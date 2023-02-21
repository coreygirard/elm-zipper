module Zipper.ListElemList exposing
    ( Zipper
    , singleton, fromTuple, fromZipperListList, fromZipperListListList
    , toList, toZipperListList, toZipperListListList
    , length, lengthLeft, lengthRight, position
    , getFirst, getLeft, getSelected, getRight, getLast
    , setFirst, setLeft, setSelected, setRight, setLast
    , map, mapLeft, mapRight, IndexMethod(..), Position(..), indexedMap, indexedMapLeft, indexedMapRight
    , updateLeft, updateSelected, updateRight
    , filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight
    , insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected
    , sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex
    , reverse, reverseLeft, reverseRight
    , swapToFirst, swapToLast, swap, swapTwo
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

@docs toList, toZipperListList, toZipperListListList


# Length

@docs length, lengthLeft, lengthRight, position


# Get

@docs getFirst, getLeft, getSelected, getRight, getLast


# Set

@docs setFirst, setLeft, setSelected, setRight, setLast


# Map

@docs map, mapLeft, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapRight


# Update

@docs updateLeft, updateSelected, updateRight


# Filter

@docs filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight


# Insert

@docs insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected


# Sort

@docs sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverse, reverseLeft, reverseRight


# Swap

@docs swapToFirst, swapToLast, swap, swapTwo

-}

import List.Extra
import Zipper.ListElemList.Advanced as Adv


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, a, List a )


{-| Create a new `Zipper`

    singleton 0 --> ([],0,[])

-}
singleton : a -> Zipper a
singleton elem =
    ( [], elem, [] )


{-| Create a new `Zipper`

    singleton 0 --> ([],0,[])

-}
fromTuple : ( List a, a, List a ) -> Zipper a
fromTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
toList : Zipper a -> List a
toList ( a, b, c ) =
    List.reverse a ++ [ b ] ++ c


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
length : Zipper a -> Int
length =
    Adv.length


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
lengthLeft : Zipper a -> Int
lengthLeft =
    Adv.lengthLeft


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
lengthRight : Zipper a -> Int
lengthRight =
    Adv.lengthRight


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
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


moveLeftUntil : (a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity identity (\_ elem _ -> f elem) zipper


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
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft =
    Adv.mapLeft


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight =
    Adv.mapRight


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
indexedMapRelative : (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMapRelative f ( before, selected, after ) =
    ( List.indexedMap (\i elem -> f BeforeSelected (i * -1) elem) before
    , f Selected 0 selected
    , List.indexedMap (\i elem -> f AfterSelected i elem) before
    )


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
toZipperListListList : (a -> List b) -> Zipper a -> ( List a, List b, List a )
toZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| From [`Zipper.ListListList.Zipper`](Zipper.ListListList#Zipper), by providing function to convert selected list to selected element.

    ( [ 2, 1 ], [ 10, 11, 12 ], [ 4, 5 ] )
        |> fromZipperListListList List.sum
        --> ( [ 2, 1 ], 33, [ 4, 5 ] )

-}
fromZipperListListList : (List b -> a) -> ( List a, List b, List a ) -> Zipper a
fromZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| Specifies different ways of indexing a zipper. Used with `indexedMap` and `indexedFilter` and similar functions

    fromTuple ( [ 'a', 'b' ], 'c', [ 'd', 'e', 'f', 'g' ] )
        |> indexedMap FromFirst (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], 2, [ 3, 4, 5, 6 ] )

    fromTuple ( [ 'a', 'b' ], 'c', [ 'd', 'e', 'f', 'g' ] )
        |> indexedMap FromLast (\_ i _ -> i)
        --> fromTuple ( [ 6, 5 ], 4, [ 3, 2, 1, 0 ] )

    fromTuple ( [ 'a', 'b' ], 'c', [ 'd', 'e', 'f', 'g' ] )
        |> indexedMap FromSelection (\_ i _ -> i)
        --> fromTuple ( [ -2, -1 ], 0, [ 1, 2, 3, 4 ] )

    fromTuple ( [ 'a', 'b' ], 'c', [ 'd', 'e', 'f', 'g' ] )
        |> indexedMap FromEdges (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], 2, [ 3, 2, 1, 0 ] )

-}
type IndexMethod
    = FromFirst
    | FromLast
    | FromSelection
    | FromEdges


{-| A flag that is passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Position
    = BeforeSelected
    | Selected
    | AfterSelected


{-| -}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f ( before, selected, after ) =
    let
        beforeIndexes =
            List.range 0 (List.length before) |> List.reverse

        selectedIndex =
            List.length before

        afterIndexes =
            List.range (List.length before + 1) (length ( before, selected, after ))
    in
    ( indexedMapLeftHelper_ indexMethod f ( before, selected, after )
    , indexedMapSelectedHelper_ indexMethod f ( before, selected, after )
    , indexedMapRightHelper_ indexMethod f ( before, selected, after )
    )


{-| -}
indexedMapLeft : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper a
indexedMapLeft indexMethod f ( left, selected, right ) =
    ( left, selected, right )


{-| -}
indexedMapRight : Zipper a -> Zipper a
indexedMapRight ( left, selected, right ) =
    ( left, selected, right )


{-| -}
indexedMapLeftHelper_ : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> List b
indexedMapLeftHelper_ indexMethod f ( left, _, right ) =
    let
        indexes =
            case indexMethod of
                FromFirst ->
                    List.range 0 (List.length left - 1) |> List.reverse

                FromLast ->
                    List.range (List.length right + 1) (List.length right + 1 + List.length left)

                FromSelection ->
                    List.range 0 (List.length left - 1) |> List.map ((*) -1)

                FromEdges ->
                    List.range 0 (List.length left - 1) |> List.reverse
    in
    List.map2
        (\i elem -> f BeforeSelected i elem)
        indexes
        left


{-| -}
indexedMapSelectedHelper_ : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> List b
indexedMapSelectedHelper_ indexMethod f ( left, selected, right ) =
    case indexMethod of
        FromFirst ->
            f Selected (List.length left) selected

        FromLast ->
            f Selected (List.length right) selected

        FromSelection ->
            f Selected 0 selected

        FromEdges ->
            f Selected 0 selected


{-| -}
indexedMapRightHelper_ : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> List b
indexedMapRightHelper_ indexMethod f ( left, _, right ) =
    let
        indexes =
            case indexMethod of
                FromFirst ->
                    List.range (List.length left + 1) (List.length right + 1 + List.length left)

                FromLast ->
                    List.range 0 (List.length right + 1) |> List.reverse

                FromSelection ->
                    List.range 0 (List.length right - 1)

                FromEdges ->
                    List.range 0 (List.length left - 1) |> List.map ((*) -1)
    in
    List.map2
        (\i elem -> f AfterSelected i elem)
        indexes
        right


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
indexedFilter : Zipper a -> Zipper a
indexedFilter zipper =
    zipper


{-| -}
indexedFilterLeft : Zipper a -> Zipper a
indexedFilterLeft zipper =
    zipper


{-| -}
indexedFilterRight : Zipper a -> Zipper a
indexedFilterRight zipper =
    zipper


{-| -}
insertFirst : Zipper a -> Zipper a
insertFirst zipper =
    zipper


{-| -}
insertLast : Zipper a -> Zipper a
insertLast zipper =
    zipper


{-| -}
insertLeftOfSelected : Zipper a -> Zipper a
insertLeftOfSelected zipper =
    zipper


{-| -}
insertRightOfSelected : Zipper a -> Zipper a
insertRightOfSelected zipper =
    zipper


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft zipper =
    zipper


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight zipper =
    zipper


{-| -}
swap : Zipper a -> Zipper a
swap zipper =
    zipper


{-| -}
swapTwo : Zipper a -> Zipper a
swapTwo zipper =
    zipper
