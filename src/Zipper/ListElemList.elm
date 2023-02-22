module Zipper.ListElemList exposing
    ( Zipper
    , singleton, fromTuple, fromZipperListList, fromZipperListListList
    , toTuple, toList, toZipperListList, toZipperListListList
    , length, lengthLeft, lengthRight, position
    , getFirst, getLeft, getSelected, getRight, getLast, getAt, getAtClamp, getAtRelative, getAtRelativeClamp
    , setFirst, setLeft, setSelected, setRight, setLast, setAt, setAtClamp, setAtRelative, setAtRelativeClamp
    , map, mapLeft, mapRight, IndexMethod(..), Position(..), indexedMap, indexedMapLeft, indexedMapSelected, indexedMapRight
    , update, updateLeft, updateSelected, updateRight, updateAt, updateAtClamp, updateAtRelative, updateAtRelativeClamp
    , filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight
    , moveLeft, tryMoveLeft, moveLeftUntil, moveRight, tryMoveRight, moveRightUntil
    , insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected
    , sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex
    , reverse, reverseLeft, reverseRight
    , swapToFirst, swapToLast, swap, swapTwo
    , indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck
    )

{-| A special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced) where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringCharString`](Zipper.StringCharString)

  - Special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced)
  - General case of [`Zipper.StringCharString`](Zipper.StringCharString)


# Definition

@docs Zipper


# Create

@docs singleton, fromTuple, fromZipperListList, fromZipperListListList


# To

@docs toTuple, toList, toZipperListList, toZipperListListList


# Length

@docs length, lengthLeft, lengthRight, position


# Get

@docs getFirst, getLeft, getSelected, getRight, getLast, getAt, getAtClamp, getAtRelative, getAtRelativeClamp


# Set

@docs setFirst, setLeft, setSelected, setRight, setLast, setAt, setAtClamp, setAtRelative, setAtRelativeClamp


# Map

@docs map, mapLeft, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapSelected, indexedMapRight


# Update

@docs update, updateLeft, updateSelected, updateRight, updateAt, updateAtClamp, updateAtRelative, updateAtRelativeClamp


# Filter

@docs filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeft, tryMoveLeft, moveLeftUntil, moveRight, tryMoveRight, moveRightUntil


# Insert

@docs insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected


# Sort

@docs sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverse, reverseLeft, reverseRight


# Swap

@docs swapToFirst, swapToLast, swap, swapTwo


# Indexes

@docs indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck

-}

import List.Extra
import Zipper.ListElemList.Advanced as Adv


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, a, List a )


{-| Specifies different ways of indexing a zipper. Used with `indexedMap` and `indexedFilter` and similar functions

    fromTuple ( [ 0, 0 ], 0, [ 0, 0, 0, 0 ] )
        |> indexedMap FromFirst (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], 2, [ 3, 4, 5, 6 ] )

    fromTuple ( [ 0, 0 ], 0, [ 0, 0, 0, 0 ] )
        |> indexedMap FromLast (\_ i _ -> i)
        --> fromTuple ( [ 6, 5 ], 4, [ 3, 2, 1, 0 ] )

    fromTuple ( [ 0, 0 ], 0, [ 0, 0, 0, 0 ] )
        |> indexedMap FromSelection (\_ i _ -> i)
        --> fromTuple ( [ 2, 1 ], 0, [ 1, 2, 3, 4 ] )

    fromTuple ( [ 0, 0 ], 0, [ 0, 0, 0, 0 ] )
        |> indexedMap FromEdges (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], 2, [ 3, 2, 1, 0 ] )

    fromTuple ( [ 0, 0, 0, 0, 0 ], 0, [ 0 ] )
        |> indexedMap FromEdges (\_ i _ -> i)
        --> fromTuple ( [ 0, 1, 2, 3, 2 ], 1, [ 0 ] )

-}
type IndexMethod
    = FromFirst
    | FromLast
    | FromSelection
    | FromEdges


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Position
    = Left
    | Selected
    | Right


{-| Create a zipper with a single element

    singleton 0 --> ( [], 0, [] )

-}
singleton : a -> Zipper a
singleton elem =
    ( [], elem, [] )


{-| -}
fromTuple : ( List a, a, List a ) -> Zipper a
fromTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| -}
toTuple : Zipper a -> ( List a, a, List a )
toTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| -}
toList : Zipper a -> List a
toList ( a, b, c ) =
    List.reverse a ++ [ b ] ++ c


{-| -}
length : Zipper a -> Int
length =
    Adv.length


{-| -}
lengthLeft : Zipper a -> Int
lengthLeft =
    Adv.lengthLeft


{-| -}
lengthRight : Zipper a -> Int
lengthRight =
    Adv.lengthRight


{-| -}
position : Zipper a -> Int
position =
    Adv.position


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> moveLeft
        --> Just ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] )
        |> moveLeft
        --> Nothing

-}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft zipper =
    Adv.moveLeft identity identity zipper


{-| Attempt to move selection to left, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    Adv.tryMoveLeft identity identity zipper


{-| -}
moveLeftUntil : (List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity identity f zipper


{-| Attempt to move selection to right

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> moveRight
        --> Just ( [ 3, 2, 1 ], 4, [ 5 ] )

    ( [ 1, 2 ], 3, [] )
        |> moveRight
        --> Nothing

-}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight zipper =
    Adv.moveRight identity identity zipper


{-| Attempt to move selection to right, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> tryMoveRight
        --> ( [ 3, 2, 1 ], 4, [ 5 ] )

    ( [ 1, 2 ], 3, [] )
        |> tryMoveRight
        --> ( [ 1, 2 ], 3, [] )

-}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    Adv.tryMoveRight identity identity zipper


{-| -}
moveRightUntil : (List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightUntil f zipper =
    Adv.moveRightUntil identity identity f zipper


{-| Map a function over all elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> map ((+) 10)
        --> ( [ 12, 11 ], 13, [ 14, 15 ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f zipper =
    Adv.map f f f zipper


{-| -}
getFirst : Zipper a -> a
getFirst ( left, selected, _ ) =
    case List.Extra.unconsLast left of
        Just ( last, rest ) ->
            last

        Nothing ->
            selected


{-| -}
getLeft : Zipper a -> List a
getLeft =
    Adv.getLeft


{-| -}
getSelected : Zipper a -> a
getSelected =
    Adv.getSelected


{-| -}
getRight : Zipper a -> List a
getRight =
    Adv.getRight


{-| -}
getLast : Zipper a -> a
getLast ( _, selected, right ) =
    case List.Extra.unconsLast right of
        Just ( last, rest ) ->
            last

        Nothing ->
            selected


{-| -}
setFirst : a -> Zipper a -> Zipper a
setFirst elem ( left, selected, right ) =
    case List.Extra.unconsLast left of
        Just ( last, rest ) ->
            ( rest ++ [ elem ], selected, right )

        Nothing ->
            ( left, elem, right )


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft =
    Adv.setLeft


{-| -}
setSelected : a -> Zipper a -> Zipper a
setSelected =
    Adv.setSelected


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight =
    Adv.setRight


{-| -}
setLast : a -> Zipper a -> Zipper a
setLast elem ( left, selected, right ) =
    case List.Extra.unconsLast right of
        Just ( last, rest ) ->
            ( left, elem, rest ++ [ elem ] )

        Nothing ->
            ( left, elem, right )


{-| -}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem ( left, selected, right ) =
    if i < 0 || i >= length ( left, selected, right ) then
        Nothing

    else
        case compare i (List.length left) of
            EQ ->
                Just ( left, elem, right )

            LT ->
                Just
                    ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
                    , selected
                    , right
                    )

            GT ->
                Just
                    ( left
                    , selected
                    , right |> List.Extra.setAt (i - List.length left - 1) elem
                    )


{-| -}
setAtClamp : Int -> a -> Zipper a -> Zipper a
setAtClamp i elem ( left, selected, right ) =
    ( left, selected, right )


{-| -}
setAtRelative : Int -> a -> Zipper a -> Maybe (Zipper a)
setAtRelative i elem ( left, selected, right ) =
    Nothing


{-| -}
setAtRelativeClamp : Int -> a -> Zipper a -> Zipper a
setAtRelativeClamp i elem ( left, selected, right ) =
    ( left, selected, right )


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft =
    Adv.mapLeft


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight =
    Adv.mapRight


{-| -}
update : (List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b
update fLeft fSelected fRight ( left, selected, right ) =
    ( fLeft left
    , fSelected selected
    , fRight right
    )


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft =
    Adv.updateLeft


{-| -}
updateSelected : (a -> a) -> Zipper a -> Zipper a
updateSelected =
    Adv.updateSelected


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight =
    Adv.updateRight


{-| -}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f ( left, selected, right ) =
    if i < 0 || i >= length ( left, selected, right ) then
        Nothing

    else
        case compare i (List.length left) of
            EQ ->
                Just ( left, f selected, right )

            LT ->
                Just
                    ( left |> List.reverse |> List.Extra.updateAt i f
                    , selected
                    , right
                    )

            GT ->
                Just
                    ( left
                    , selected
                    , right |> List.Extra.updateAt (i - List.length left - 1) f
                    )


{-| -}
updateAtClamp : Int -> (a -> a) -> Zipper a -> Zipper a
updateAtClamp i f ( left, selected, right ) =
    ( left, selected, right )


{-| -}
updateAtRelative : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelative i f ( left, selected, right ) =
    Nothing


{-| -}
updateAtRelativeClamp : Int -> (a -> a) -> Zipper a -> Zipper a
updateAtRelativeClamp i f ( left, selected, right ) =
    ( left, selected, right )


{-| Set selection to first element
-}
selectFirst : Zipper a -> Zipper a
selectFirst zipper =
    Adv.selectFirst identity identity zipper


{-| Set selection to Nth element
-}
selectNth : Int -> Zipper a -> Maybe (Zipper a)
selectNth n ( before, selected, after ) =
    let
        allElems =
            toList ( before, selected, after )
    in
    case List.Extra.getAt n allElems of
        Just elemN ->
            Just
                ( allElems |> List.take n
                , elemN
                , allElems |> List.drop (n + 1)
                )

        Nothing ->
            Nothing


{-| Set selection to last element
-}
selectLast : Zipper a -> Zipper a
selectLast zipper =
    Adv.selectLast identity identity zipper


{-| Set selection to Nth element
-}
trySelectNth : Int -> Zipper a -> Zipper a
trySelectNth n ( before, selected, after ) =
    let
        allElems =
            toList ( before, selected, after )
    in
    case List.Extra.getAt n allElems of
        Just elemN ->
            ( allElems |> List.take n
            , elemN
            , allElems |> List.drop (n + 1)
            )

        Nothing ->
            ( before, selected, after )


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( List.reverse right, selected, List.reverse left )


{-| -}
sortKeepElem : Zipper comparable -> Zipper comparable
sortKeepElem ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> elem > selected) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> elem < selected) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith compare
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith compare
    )


{-| -}
sortByKeepElem : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepElem f ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> f elem > f selected) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> f elem < f selected) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith (\a b -> compare (f a) (f b))
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith (\a b -> compare (f a) (f b))
    )


{-| -}
sortWithKeepElem : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepElem f ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> f selected elem == LT) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> f selected elem == GT) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith f
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith f
    )


{-| -}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> selectFirst
        |> updateRight List.sort
        |> sortFirstPair_
        |> updateRight List.sort
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortByKeepIndex : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepIndex f zipper =
    zipper
        |> selectFirst
        |> updateRight (List.sortBy f)
        |> sortFirstPairBy_ f
        |> updateRight (List.sortBy f)
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortWithKeepIndex : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepIndex f zipper =
    zipper
        |> selectFirst
        |> updateRight (List.sortWith f)
        |> sortFirstPairWith_ f
        |> updateRight (List.sortWith f)
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortFirstPair_ : Zipper comparable -> Zipper comparable
sortFirstPair_ ( before, selected, after ) =
    case after of
        head :: tail ->
            if head < selected then
                ( before, head, selected :: tail )

            else
                ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
sortFirstPairBy_ : (a -> comparable) -> Zipper a -> Zipper a
sortFirstPairBy_ f ( before, selected, after ) =
    case after of
        head :: tail ->
            if f head < f selected then
                ( before, head, selected :: tail )

            else
                ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
sortFirstPairWith_ : (a -> a -> Order) -> Zipper a -> Zipper a
sortFirstPairWith_ f ( before, selected, after ) =
    case after of
        head :: tail ->
            case f head selected of
                LT ->
                    ( before, head, selected :: tail )

                _ ->
                    ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, selected, right ) =
    ( List.filter f left
    , selected
    , List.filter f right
    )


{-| -}
swapToFirst : Zipper a -> Zipper a
swapToFirst ( before, selected, after ) =
    case before of
        head :: tail ->
            ( tail ++ [ selected ], head, after )

        [] ->
            ( [], selected, after )


{-| -}
swapToLast : Zipper a -> Zipper a
swapToLast ( before, selected, after ) =
    case List.Extra.unconsLast after of
        Just ( last, rest ) ->
            ( before, last, rest ++ [ selected ] )

        Nothing ->
            ( before, selected, [] )


{-| -}
insertAtFirst : a -> Zipper a -> Zipper a
insertAtFirst =
    Adv.insertAtFirst


{-| -}
insertAtLast : a -> Zipper a -> Zipper a
insertAtLast =
    Adv.insertAtLast


{-| -}
insertToLeft : a -> Zipper a -> Zipper a
insertToLeft =
    Adv.insertToLeft


{-| -}
insertToRight : a -> Zipper a -> Zipper a
insertToRight =
    Adv.insertToRight


{-| -}
getAt : Int -> Zipper a -> Maybe a
getAt i zipper =
    getAtRelative (i - position zipper) zipper


{-| -}
getAtClamp : Int -> Zipper a -> a
getAtClamp i zipper =
    getAtRelativeClamp (i - position zipper) zipper


{-| -}
getAtRelative : Int -> Zipper a -> Maybe a
getAtRelative i ( left, selected, right ) =
    if i == 0 then
        selected
            |> Just

    else if i < 0 then
        left
            |> List.Extra.getAt (i * -1 - 1)

    else
        right
            |> List.Extra.getAt (i - 1)


{-| -}
getAtRelativeClamp : Int -> Zipper a -> a
getAtRelativeClamp i ( left, selected, right ) =
    if i == 0 then
        selected

    else if i < 0 then
        left
            |> List.Extra.getAt (i * -1 |> clamp 0 (List.length left))
            |> Maybe.withDefault selected

    else
        right
            |> List.Extra.getAt (i |> clamp 0 (List.length right))
            |> Maybe.withDefault selected


{-| To [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper) by dropping selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toZipperListList
        --> ( [ 2, 1 ], [ 4, 5 ] )

-}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList =
    Adv.toZipperListList


{-| From [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper), by providing selected element.

    ( [ 2, 1 ], [ 4, 5 ] )
        |> fromZipperListList 3
        --> ( [ 2, 1 ], 3, [ 4, 5 ] )

-}
fromZipperListList : a -> ( List a, List a ) -> Zipper a
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| To [`Zipper.ListListList.Zipper`](Zipper.ListListList#Zipper) by providing function to convert selected element to selected list.

    ( [ 2, 1 ], 0, [ 4, 5 ] )
        |> toZipperListListList (List.repeat 3)
        --> ( [ 2, 1 ], [ 0, 0, 0 ], [ 4, 5 ] )

-}
toZipperListListList : (a -> List a) -> Zipper a -> ( List a, List a, List a )
toZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| From [`Zipper.ListListList.Zipper`](Zipper.ListListList#Zipper), by providing function to convert selected list to selected element.

    ( [ 2, 1 ], [ 10, 11, 12 ], [ 4, 5 ] )
        |> fromZipperListListList List.sum
        --> ( [ 2, 1 ], 33, [ 4, 5 ] )

-}
fromZipperListListList : (List a -> a) -> ( List a, List a, List a ) -> Zipper a
fromZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, selected, right ) as zipper) =
    ( List.map2 (\i elem -> f Left i elem) (getIndexesLeftHelper_ indexMethod zipper) left
    , f Selected (getIndexesSelectedHelper_ indexMethod zipper) selected
    , List.map2 (\i elem -> f Right i elem) (getIndexesRightHelper_ indexMethod zipper) right
    )


{-| -}
indexedMapLeft : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft indexMethod f (( left, selected, right ) as zipper) =
    ( List.map2 (\i elem -> f Left i elem) (getIndexesLeftHelper_ indexMethod zipper) left
    , selected
    , right
    )


{-| -}
indexedMapSelected : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapSelected indexMethod f (( left, selected, right ) as zipper) =
    ( left
    , f Selected (getIndexesSelectedHelper_ indexMethod zipper) selected
    , right
    )


{-| -}
indexedMapRight : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapRight indexMethod f (( left, selected, right ) as zipper) =
    ( left
    , selected
    , List.map2 (\i elem -> f Right i elem) (getIndexesRightHelper_ indexMethod zipper) right
    )


{-| -}
getIndexesLeftHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesLeftHelper_ indexMethod ( left, _, right ) =
    case indexMethod of
        FromFirst ->
            List.range 0 (List.length left - 1) |> List.reverse

        FromLast ->
            List.range (List.length right + 1) (List.length right + 1 + List.length left)

        FromSelection ->
            List.range 1 (List.length left)

        FromEdges ->
            List.map2
                min
                (List.range 0 (List.length left - 1) |> List.reverse)
                (List.range (List.length right + 1) (List.length right + 1 + List.length left))


{-| -}
getIndexesSelectedHelper_ : IndexMethod -> Zipper a -> Int
getIndexesSelectedHelper_ indexMethod ( left, selected, right ) =
    case indexMethod of
        FromFirst ->
            List.length left

        FromLast ->
            List.length right

        FromSelection ->
            0

        FromEdges ->
            min (List.length left) (List.length right)


{-| -}
getIndexesRightHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesRightHelper_ indexMethod ( left, _, right ) =
    case indexMethod of
        FromFirst ->
            List.range (List.length left + 1) (List.length right + 1 + List.length left)

        FromLast ->
            List.range 0 (List.length right - 1) |> List.reverse

        FromSelection ->
            List.range 1 (List.length right)

        FromEdges ->
            List.map2
                min
                (List.range (List.length left + 1) (List.length right + 1 + List.length left))
                (List.range 0 (List.length right - 1) |> List.reverse)


{-| -}
filterLeft : (a -> Bool) -> Zipper a -> Zipper a
filterLeft f ( left, selected, right ) =
    ( List.filter f left
    , selected
    , right
    )


{-| -}
filterRight : (a -> Bool) -> Zipper a -> Zipper a
filterRight f ( left, selected, right ) =
    ( left
    , selected
    , List.filter f right
    )


{-| -}
indexedFilter : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter indexMethod f (( left, selected, right ) as zipper) =
    ( List.map2 (\i elem -> ( f Left i elem, elem )) (getIndexesLeftHelper_ indexMethod zipper) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , List.map2 (\i elem -> ( f Right i elem, elem )) (getIndexesRightHelper_ indexMethod zipper) right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedFilterLeft : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft indexMethod f (( left, selected, right ) as zipper) =
    ( List.map2 (\i elem -> ( f Left i elem, elem )) (getIndexesLeftHelper_ indexMethod zipper) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , right
    )


{-| -}
indexedFilterRight : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight indexMethod f (( left, selected, right ) as zipper) =
    ( left
    , selected
    , List.map2 (\i elem -> ( f Right i elem, elem )) (getIndexesRightHelper_ indexMethod zipper) right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, selected, right ) =
    ( left ++ [ elem ], selected, right )


{-| -}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, selected, right ) =
    ( left, selected, right ++ [ elem ] )


{-| -}
insertLeftOfSelected : a -> Zipper a -> Zipper a
insertLeftOfSelected elem ( left, selected, right ) =
    ( elem :: left, selected, right )


{-| -}
insertRightOfSelected : a -> Zipper a -> Zipper a
insertRightOfSelected elem ( left, selected, right ) =
    ( left, selected, elem :: right )


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, selected, right ) =
    ( left, selected, List.reverse right )


{-| -}
swap : Int -> Zipper a -> Maybe (Zipper a)
swap i ( left, selected, right ) =
    let
        position_ =
            position ( left, selected, right )

        relativeIndex =
            i - position_
    in
    case ( compare relativeIndex 0, List.Extra.getAt relativeIndex left, List.Extra.getAt relativeIndex right ) of
        ( EQ, _, _ ) ->
            Just ( left, selected, right )

        ( LT, Just value, _ ) ->
            Just ( List.Extra.setAt relativeIndex selected left, selected, right )

        ( GT, _, Just value ) ->
            Just ( left, selected, List.Extra.setAt relativeIndex selected right )

        ( LT, Nothing, _ ) ->
            Nothing

        ( GT, _, Nothing ) ->
            Nothing


{-| -}
swapTwo : Zipper a -> Zipper a
swapTwo zipper =
    zipper


{-| -}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck ( left, selected, right ) i =
    if i >= 0 && i < List.length left then
        Just Left

    else if i == List.length left then
        Just Selected

    else if i >= length ( left, selected, [] ) && i < length ( left, selected, right ) then
        Just Right

    else
        Nothing


{-| -}
indexRelativeCheck : Zipper a -> Int -> Maybe Position
indexRelativeCheck ( left, _, right ) i =
    if i == 0 then
        Just Selected

    else if i > 0 && i < List.length right then
        Just Right

    else if i < 0 && i > (List.length left * -1) then
        Just Left

    else
        Nothing


{-| -}
indexAbsoluteToRelative : Zipper a -> Int -> Int
indexAbsoluteToRelative ( left, _, _ ) i =
    i * -1 + List.length left


{-| -}
indexAbsoluteToRelativeCheck : Zipper a -> Int -> Maybe Int
indexAbsoluteToRelativeCheck zipper i =
    indexAbsoluteToRelative zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexRelativeToAbsolute : Zipper a -> Int -> Int
indexRelativeToAbsolute ( left, _, _ ) i =
    (i - List.length left) * -1


{-| -}
indexRelativeToAbsoluteCheck : Zipper a -> Int -> Maybe Int
indexRelativeToAbsoluteCheck zipper i =
    indexRelativeToAbsolute zipper i
        |> (\j ->
                if indexRelativeCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )
