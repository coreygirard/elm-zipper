module Zipper.ListElemList.Advanced exposing
    ( Zipper
    , singleton, fromTuple, fromZipperListList, fromZipperListListList
    , toTuple, toZipperListList, toZipperListListList, toNonemptyListDropLeft, toNonemptyListDropRight
    , length, lengthLeft, lengthRight, position
    , selectFirst, selectLast, selectNth
    , moveLeft, tryMoveLeft, moveLeftUntil, moveLeftN, moveLeftNNonnegative, moveRight, tryMoveRight, moveRightN, moveRightUntil, moveRightNNonnegative
    , getLeft, getSelected, getRight, getAt, getAtClamp, getAtRelative, getAtRelativeClamp
    , setLeft, setSelected, setRight, setAt, setAtClamp
    , insertAtFirst, insertAtLast, insertToLeft, insertToRight
    , map, mapLeft, mapRight, indexedMap, indexedMapRelative
    , filter
    , updateLeft, updateSelected, updateRight, updateAt, updateAtClamp
    )

{-| A zipper with a single selected element.

**Note**: If all zipper elements are of the same type, use [`Zipper.ListElemList`](Zipper.ListElemList) instead. It has a simpler API.

  - General case of [`Zipper.ListElemList`](Zipper.ListElemList)
  - General case of [`Zipper.StringCharString`](Zipper.StringCharString)


# Definition

@docs Zipper


# Create

@docs singleton, fromTuple, fromZipperListList, fromZipperListListList


# To other types

@docs toTuple, toZipperListList, toZipperListListList, toNonemptyListDropLeft, toNonemptyListDropRight


# Utilities

@docs length, lengthLeft, lengthRight, position


# Select (rename?)

@docs selectFirst, selectLast, selectNth


# Move (rename?)

@docs moveLeft, tryMoveLeft, moveLeftUntil, moveLeftN, moveLeftNNonnegative, moveRight, tryMoveRight, moveRightN, moveRightUntil, moveRightNNonnegative


# Get

@docs getLeft, getSelected, getRight, getAt, getAtClamp, getAtRelative, getAtRelativeClamp


# Set

@docs setLeft, setSelected, setRight, setAt, setAtClamp


# Insert

@docs insertAtFirst, insertAtLast, insertToLeft, insertToRight


# Map

@docs map, mapLeft, mapRight, indexedMap, indexedMapRelative


# Filter

@docs filter


# Update

@docs updateLeft, updateSelected, updateRight, updateAt, updateAtClamp

-}

import List.Extra
import Result.Extra


{-| A list type that must contain at least one element
-}
type alias Zipper a b c =
    ( List a, b, List c )


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
singleton : b -> Zipper a b c
singleton elem =
    ( [], elem, [] )


{-| -}
fromTuple : ( List a, b, List c ) -> Zipper a b c
fromTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| -}
length : Zipper a b c -> Int
length ( a, _, c ) =
    List.length a + 1 + List.length c


{-| -}
lengthLeft : Zipper a b c -> Int
lengthLeft ( a, _, c ) =
    List.length a


{-| -}
lengthRight : Zipper a b c -> Int
lengthRight ( a, _, c ) =
    List.length c


{-| -}
position : Zipper a b c -> Int
position ( a, _, c ) =
    List.length a


{-| -}
toTuple : Zipper a b c -> ( List a, b, List c )
toTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| -}
toList : (a -> d) -> (b -> d) -> (c -> d) -> Zipper a b c -> List d
toList fA fB fC ( a, b, c ) =
    (a |> List.reverse |> List.map fA)
        ++ [ fB b ]
        ++ (c |> List.map fC)


{-| Attempt to move selection to left
-}
moveLeft : (a -> b) -> (b -> c) -> Zipper a b c -> Maybe (Zipper a b c)
moveLeft fAB fBC zipper =
    case zipper of
        ( head :: tail, selected, right ) ->
            Just ( tail, fAB head, fBC selected :: right )

        ( [], selected, right ) ->
            Nothing


{-| Attempt to move selection to left, returning unmodified zipper on failure
-}
tryMoveLeft : (a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c
tryMoveLeft fAB fBC zipper =
    moveLeft fAB fBC zipper
        |> Maybe.withDefault zipper


{-| Move left until function returns True. If no match found, returns `Nothing`.

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 2)
        --> Just ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] )

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 1)
        --> Just ( [], 1, [ 2, 3, 4, 5, 6, 7 ] )

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 100)
        --> Nothing

-}
moveLeftUntil : (a -> b) -> (b -> c) -> (List a -> b -> List c -> Bool) -> Zipper a b c -> Maybe (Zipper a b c)
moveLeftUntil fAB fBC fStop zipper =
    case moveLeft fAB fBC zipper of
        Nothing ->
            Nothing

        Just ( a, b, c ) ->
            if fStop a b c then
                Just ( a, b, c )

            else
                moveLeftUntil fAB fBC fStop ( a, b, c )


{-| Move left until function returns True. If no match found, returns `Nothing`.

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 2)
        --> Just ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] )

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 1)
        --> Just ( [], 1, [ 2, 3, 4, 5, 6, 7 ] )

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil identity identity (\_ n _ -> n == 100)
        --> Nothing

-}
moveRightUntil : (b -> a) -> (c -> b) -> (List a -> b -> List c -> Bool) -> Zipper a b c -> Maybe (Zipper a b c)
moveRightUntil fBA fCB fStop zipper =
    case moveRight fBA fCB zipper of
        Nothing ->
            Nothing

        Just ( a, b, c ) ->
            if fStop a b c then
                Just ( a, b, c )

            else
                moveRightUntil fBA fCB fStop ( a, b, c )


{-| -}
moveLeftN : (a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)
moveLeftN fAB fBC fCB fBA n zipper =
    if n == 0 then
        Just zipper

    else if n < 0 then
        moveRightNNonnegative fBA fCB (n * -1) zipper

    else
        moveLeftNNonnegative fAB fBC n zipper


{-| -}
moveRightN : (a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)
moveRightN fAB fBC fCB fBA n zipper =
    moveLeftN fAB fBC fCB fBA (n * -1) zipper


{-| -}
moveLeftNNonnegative : (a -> b) -> (b -> c) -> Int -> Zipper a b c -> Maybe (Zipper a b c)
moveLeftNNonnegative fAB fBC n zipper =
    if n == 0 then
        Just zipper

    else
        case moveLeft fAB fBC zipper of
            Just shifted ->
                moveLeftNNonnegative fAB fBC (n - 1) shifted

            Nothing ->
                Nothing


{-| -}
moveRightNNonnegative : (b -> a) -> (c -> b) -> Int -> Zipper a b c -> Maybe (Zipper a b c)
moveRightNNonnegative fBA fCB n zipper =
    if n == 0 then
        Just zipper

    else
        case moveRight fBA fCB zipper of
            Just shifted ->
                moveRightNNonnegative fBA fCB (n - 1) shifted

            Nothing ->
                Nothing


{-| Attempt to move selection to right
-}
moveRight : (b -> a) -> (c -> b) -> Zipper a b c -> Maybe (Zipper a b c)
moveRight fBA fCB zipper =
    case zipper of
        ( left, selected, head :: tail ) ->
            Just ( fBA selected :: left, fCB head, tail )

        ( left, selected, [] ) ->
            Nothing


{-| Attempt to move selection to right, returning unmodified zipper on failure
-}
tryMoveRight : (b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c
tryMoveRight fBA fCB zipper =
    moveRight fBA fCB zipper
        |> Maybe.withDefault zipper


{-| Set selection to first element
-}
selectFirst : (a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c
selectFirst fAB fBC ( before, selected, after ) =
    case before of
        head :: tail ->
            ( []
            , fAB head
            , List.map (fAB >> fBC) tail ++ [ fBC selected ] ++ after
            )

        [] ->
            ( before, selected, after )


{-| Try to set selection to Nth element, returning Nothing on failure
-}
selectNth : (a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)
selectNth fAB fBC fCB fBA n ( before, selected, after ) =
    let
        allElems =
            toList fAB identity fCB ( before, selected, after )
    in
    case List.Extra.getAt n allElems of
        Just elemN ->
            Just
                ( allElems |> List.take n |> List.map fBA |> List.reverse
                , elemN
                , allElems |> List.drop (n + 1) |> List.map fBC
                )

        Nothing ->
            Nothing


{-| Set selection to last element
-}
selectLast : (b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c
selectLast fBA fCB ( before, selected, after ) =
    case List.Extra.unconsLast after of
        Just ( last, rest ) ->
            ( List.map (fCB >> fBA) rest ++ [ fBA selected ] ++ before
            , fCB last
            , []
            )

        Nothing ->
            ( before, selected, after )


{-| To [`Zipper.ListList.Zipper.Advanced`](Zipper.ListList.Advanced#Zipper) by dropping selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toZipperListList
        --> ( [ 2, 1 ], [ 4, 5 ] )

-}
toZipperListList : Zipper a b c -> ( List a, List c )
toZipperListList ( left, _, right ) =
    ( left, right )


{-| From [`Zipper.ListList.Zipper.Advanced`](Zipper.ListList.Advanced#Zipper), by providing selected element.

    ( [ 2, 1 ], [ 4, 5 ] )
        |> fromZipperListList 3
        --> ( [ 2, 1 ], 3, [ 4, 5 ] )

-}
fromZipperListList : b -> ( List a, List c ) -> Zipper a b c
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| To [`Zipper.ListListList.Zipper.Advanced`](Zipper.ListListList.Advanced#Zipper) by providing function to convert selected element to selected list.

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toZipperListList
        --> ( [ 2, 1 ], [ 4, 5 ] )

-}
toZipperListListList : (b1 -> List b2) -> Zipper a b1 c -> ( List a, List b2, List c )
toZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| From [`Zipper.ListListList.Zipper.Advanced`](Zipper.ListListList.Advanced#Zipper), by providing function to convert selected list to selected element.

    ( [ 2, 1 ], [ 4, 5 ] )
        |> fromZipperListList 3
        --> ( [ 2, 1 ], 3, [ 4, 5 ] )

-}
fromZipperListListList : (List b1 -> b2) -> ( List a, List b1, List c ) -> Zipper a b2 c
fromZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| Convert zipper to a nonempty list by dropping all left elements. Fully compatible with [coreygirard/elm-nonempty-list](https://package.elm-lang.org/packages/coreygirard/elm-nonempty-list/latest/)

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toNonemptyListDropLeft
        --> ( 3, [ 4, 5 ] )

-}
toNonemptyListDropLeft : Zipper a b c -> ( b, List c )
toNonemptyListDropLeft ( _, selected, right ) =
    ( selected, right )


{-| Convert zipper to a nonempty list by dropping all left elements. Fully compatible with [coreygirard/elm-nonempty-list](https://package.elm-lang.org/packages/coreygirard/elm-nonempty-list/latest/). Note that the relative order of elements changes to fit the nonempty list type.

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toNonemptyListDropRight
        --> ( 3, [ 1, 2 ] )

-}
toNonemptyListDropRight : Zipper a b c -> ( b, List a )
toNonemptyListDropRight ( left, selected, _ ) =
    ( selected, List.reverse left )


{-| Replace left elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> setLeft [ 'a', 'b' ]
        --> ( [ 'b', 'a' ], 3, [ 4, 5 ] )

-}
setLeft : List a2 -> Zipper a1 b c -> Zipper a2 b c
setLeft left ( _, selected, right ) =
    ( List.reverse left, selected, right )


{-| Replace selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> setSelected 'c'
        --> ( [ 2, 1 ], 'c', [ 4, 5 ] )

-}
setSelected : b2 -> Zipper a b1 c -> Zipper a b2 c
setSelected selected ( left, _, right ) =
    ( left, selected, right )


{-| Replace right elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> setRight [ 'd', 'e' ]
        --> ( [ 2, 1 ], 3, [ 'd', 'e' ] )

-}
setRight : List c2 -> Zipper a b c1 -> Zipper a b c2
setRight right ( left, selected, _ ) =
    ( left, selected, right )


{-| Return left elements

    getLeft ( [ 2, 1 ], 3, [ 4, 5 ] )
        --> [ 1, 2 ]

-}
getLeft : Zipper a b c -> List a
getLeft ( left, _, _ ) =
    List.reverse left


{-| Return selected element

    getSelected ( [ 2, 1 ], 3, [ 4, 5 ] )
        --> 3

-}
getSelected : Zipper a b c -> b
getSelected ( _, selected, _ ) =
    selected


{-| Return right elements

    getRight ( [ 2, 1 ], 3, [ 4, 5 ] )
        --> [ 4, 5 ]

-}
getRight : Zipper a b c -> List c
getRight ( _, _, right ) =
    right


{-| Set selection to last element
-}
map : (a1 -> a2) -> (b1 -> b2) -> (c1 -> c2) -> Zipper a1 b1 c1 -> Zipper a2 b2 c2
map fA fB fC ( left, selected, right ) =
    ( List.map fA left, fB selected, List.map fC right )


{-| Set selection to last element
-}
mapLeft : (a1 -> a2) -> Zipper a1 b c -> Zipper a2 b c
mapLeft f ( left, selected, right ) =
    ( List.map f left, selected, right )


{-| Set selection to last element
-}
mapRight : (c1 -> c2) -> Zipper a b c1 -> Zipper a b c2
mapRight f ( left, selected, right ) =
    ( left, selected, List.map f right )


{-| Set selection to last element
-}
updateLeft : (List a1 -> List a2) -> Zipper a1 b c -> Zipper a2 b c
updateLeft f ( left, selected, right ) =
    ( left |> List.reverse |> f |> List.reverse, selected, right )


{-| Set selection to last element
-}
updateSelected : (b1 -> b2) -> Zipper a b1 c -> Zipper a b2 c
updateSelected f ( left, selected, right ) =
    ( left, f selected, right )


{-| Set selection to last element
-}
updateRight : (List c1 -> List c2) -> Zipper a b c1 -> Zipper a b c2
updateRight f ( left, selected, right ) =
    ( left, selected, f right )


{-| -}
getAt : (a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> Maybe d
getAt fAD fBD fCD i zipper =
    getAtRelative fAD fBD fCD (i - position zipper) zipper


{-| -}
getAtClamp : (a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> d
getAtClamp fAD fBD fCD i zipper =
    getAtRelativeClamp fAD fBD fCD (i - position zipper) zipper


{-| -}
getAtRelative : (a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> Maybe d
getAtRelative fAD fBD fCD i ( left, selected, right ) =
    if i == 0 then
        selected
            |> fBD
            |> Just

    else if i < 0 then
        left
            |> List.Extra.getAt (i * -1 - 1)
            |> Maybe.map fAD

    else
        right
            |> List.Extra.getAt (i - 1)
            |> Maybe.map fCD


{-| -}
getAtRelativeClamp : (a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> d
getAtRelativeClamp fAD fBD fCD i ( left, selected, right ) =
    if i == 0 then
        selected
            |> fBD

    else if i < 0 then
        left
            |> List.Extra.getAt (i * -1 |> clamp 0 (List.length left))
            |> Maybe.map fAD
            |> Maybe.withDefault (fBD selected)

    else
        right
            |> List.Extra.getAt (i |> clamp 0 (List.length right))
            |> Maybe.map fCD
            |> Maybe.withDefault (fBD selected)


{-| -}
setAt : Zipper a b c -> Zipper a b c
setAt zipper =
    zipper


{-| -}
setAtClamp : Zipper a b c -> Zipper a b c
setAtClamp zipper =
    zipper


{-| -}
updateAt : Zipper a b c -> Zipper a b c
updateAt zipper =
    zipper


{-| -}
updateAtClamp : Zipper a b c -> Zipper a b c
updateAtClamp zipper =
    zipper


type Position
    = BeforeSelected
    | Selected
    | AfterSelected


{-| -}
indexedMap :
    (Position -> Int -> a1 -> a2)
    -> (Int -> b1 -> b2)
    -> (Position -> Int -> c1 -> c2)
    -> Zipper a1 b1 c1
    -> Zipper a2 b2 c2
indexedMap fA fB fC ( left, selected, right ) =
    ( left
        |> List.reverse
        |> List.indexedMap (\i elem -> fA BeforeSelected i elem)
        |> List.reverse
    , fB (List.length left) selected
    , right
        |> List.indexedMap (\i elem -> fC AfterSelected (i + 1 + List.length left) elem)
    )


{-| -}
indexedMapRelative :
    (Position -> Int -> a1 -> a2)
    -> (b1 -> b2)
    -> (Position -> Int -> c1 -> c2)
    -> Zipper a1 b1 c1
    -> Zipper a2 b2 c2
indexedMapRelative fA fB fC ( left, selected, right ) =
    ( List.indexedMap (\i elem -> fA BeforeSelected (i * -1 + 1) elem) left
    , fB selected
    , List.indexedMap (\i elem -> fC AfterSelected (i + 1) elem) right
    )


{-| -}
filter : (a -> Bool) -> (c -> Bool) -> Zipper a b c -> Zipper a b c
filter fA fC ( left, selected, right ) =
    ( List.filter fA left
    , selected
    , List.filter fC right
    )


{-| -}
insertAtFirst : a -> Zipper a b c -> Zipper a b c
insertAtFirst elem ( before, selected, after ) =
    ( before ++ [ elem ], selected, after )


{-| -}
insertAtLast : c -> Zipper a b c -> Zipper a b c
insertAtLast elem ( before, selected, after ) =
    ( before, selected, after ++ [ elem ] )


{-| -}
insertToLeft : a -> Zipper a b c -> Zipper a b c
insertToLeft elem ( before, selected, after ) =
    ( [ elem ] ++ before, selected, after )


{-| -}
insertToRight : c -> Zipper a b c -> Zipper a b c
insertToRight elem ( before, selected, after ) =
    ( before, selected, [ elem ] ++ after )
