module Zipper.ListList exposing
    ( Zipper, RelativeIndex(..)
    , empty, fromTuple, fromZipperListElemList, fromZipperListListList
    , toTuple, toList, toZipperListElemList, toZipperListListList
    , length, lengthLeft, lengthRight, position, positionFromEnd
    , getLeft, getRight, getAt, getAtRelative
    , setLeft, setRight, setAt, trySetAt, setAtRelative, trySetAtRelative
    , map, mapSeparately, mapLeft, mapRight, IndexMethod(..), Position(..), indexedMap, indexedMapLeft, indexedMapRight
    , update, updateSeparately, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative
    , filter, filterSeparately, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveLeftUntil, moveRightUntil, moveToFirst, moveToLast, moveToN, tryMoveToN
    , insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit
    , sortKeepIndex, sortByKeepIndex, sortWithKeepIndex
    , reverse, reverseLeft, reverseRight
    , swap, trySwap
    , Dists, indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRanges
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper, RelativeIndex


# Create

@docs empty, fromTuple, fromZipperListElemList, fromZipperListListList


# To

@docs toTuple, toList, toZipperListElemList, toZipperListListList


# Length

@docs length, lengthLeft, lengthRight, position, positionFromEnd


# Get

@docs getLeft, getRight, getAt, getAtRelative


# Set

@docs setLeft, setRight, setAt, trySetAt, setAtRelative, trySetAtRelative


# Map

@docs map, mapSeparately, mapLeft, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapRight


# Update

@docs update, updateSeparately, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative


# Filter

@docs filter, filterSeparately, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveLeftUntil, moveRightUntil, moveToFirst, moveToLast, moveToN, tryMoveToN


# Insert

@docs insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit


# Sort

@docs sortKeepIndex, sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverse, reverseLeft, reverseRight


# Swap

@docs swap, trySwap


# Indexes

@docs Dists, indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRanges

-}

import List.Extra
import Zipper.ListList.Advanced as Adv


{-| A list type that tracks a split location
-}
type alias Zipper a =
    ( List a, List a )


{-| -}
type IndexMethod
    = FromFirst
    | FromLast
    | FromSplit
    | FromEdges


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Position
    = Left
    | Right


{-| -}
type RelativeIndex
    = LeftIndex Int
    | RightIndex Int


{-| -}
type alias Dists =
    { fromLeft : Int, fromRight : Int }


{-| Create an empty zipper

    empty --> ( [], [] )

-}
empty : Zipper a
empty =
    ( [], [] )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        --> ( [ 3, 2, 1 ], [ 4, 5, 6 ] )

-}
fromTuple : ( List a, List a ) -> Zipper a
fromTuple ( left, right ) =
    ( List.reverse left, right )


{-|

    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
        |> fromZipperListElemList
        --> ( [ 3, 2, 1 ], [ 5, 6, 7 ] )

-}
fromZipperListElemList : ( List a, a, List a ) -> Zipper a
fromZipperListElemList ( left, _, right ) =
    ( left, right )


{-|

    ( [ 3, 2, 1 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> fromZipperListListList
        --> ( [ 3, 2, 1 ], [ 7, 8, 9 ] )

-}
fromZipperListListList : ( List a, List a, List a ) -> Zipper a
fromZipperListListList ( left, _, right ) =
    ( left, right )


{-|

    ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> fromTuple
        |> toTuple
        --> ( [ 1, 2, 3 ], [ 4, 5, 6 ] )

-}
toTuple : Zipper a -> ( List a, List a )
toTuple ( left, right ) =
    ( List.reverse left, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> toList
        --> [ 1, 2, 3, 4, 5, 6 ]

-}
toList : Zipper a -> List a
toList ( left, right ) =
    List.reverse left ++ right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 5, 6, 7 ] )
        |> toZipperListElemList 4
        --> ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )

-}
toZipperListElemList : a -> Zipper a -> ( List a, a, List a )
toZipperListElemList selected ( left, right ) =
    ( left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 7, 8, 9 ] )
        |> toZipperListListList [ 4, 5, 6 ]
        --> ( [ 3, 2, 1 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
toZipperListListList : List a -> Zipper a -> ( List a, List a, List a )
toZipperListListList selection ( left, right ) =
    ( left, selection, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> length
        --> 6

-}
length : Zipper a -> Int
length ( left, right ) =
    List.length left + List.length right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> lengthLeft
        --> 3

-}
lengthLeft : Zipper a -> Int
lengthLeft ( left, _ ) =
    List.length left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> lengthRight
        --> 2

-}
lengthRight : Zipper a -> Int
lengthRight ( _, right ) =
    List.length right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> position
        --> 3

-}
position : Zipper a -> Int
position ( left, _ ) =
    List.length left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> positionFromEnd
        --> 2

-}
positionFromEnd : Zipper a -> Int
positionFromEnd ( _, right ) =
    List.length right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> getLeft
        --> [ 1, 2, 3 ]

-}
getLeft : Zipper a -> List a
getLeft ( left, _ ) =
    List.reverse left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> getRight
        --> [ 4, 5 ]

-}
getRight : Zipper a -> List a
getRight ( _, right ) =
    right


{-|

    zipper : Zipper Int
    zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )

    zipper |> getAt -1 --> Nothing

    zipper |> getAt 0 --> Just 1

    zipper |> getAt 2 --> Just 3

    zipper |> getAt 3 --> Just 4

    zipper |> getAt 4 --> Just 5

    zipper |> getAt 5 --> Nothing

-}
getAt : Int -> Zipper a -> Maybe a
getAt i zipper =
    getAtRelative (indexAbsoluteToRelative zipper i) zipper


{-|

    zipper : Zipper Int
    zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )

    zipper |> getAtRelative (LeftIndex 3) --> Nothing

    zipper |> getAtRelative (LeftIndex 2) --> Just 1

    zipper |> getAtRelative (LeftIndex 0) --> Just 3

    zipper |> getAtRelative (RightIndex 0) --> Just 4

    zipper |> getAtRelative (RightIndex 2) --> Just 6

    zipper |> getAtRelative (RightIndex 3) --> Nothing

-}
getAtRelative : RelativeIndex -> Zipper a -> Maybe a
getAtRelative i ( left, right ) =
    case i of
        LeftIndex i_ ->
            List.Extra.getAt
                i_
                left

        RightIndex i_ ->
            List.Extra.getAt
                i_
                right


{-|

    fromTuple ( [ '1', '2', '3' ], [ '4', '5', '6' ] )
        |> setLeft [ 'a', 'b', 'c' ]
        --> fromTuple ( [ 'a', 'b', 'c' ], [ '4', '5', '6' ] )

-}
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, right ) =
    ( List.reverse left, right )


{-|

    fromTuple ( [ '1', '2', '3' ], [ '4', '5', '6' ] )
        |> setRight [ 'a', 'b', 'c' ]
        --> fromTuple ( [ '1', '2', '3' ], [ 'a', 'b', 'c' ] )

-}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, _ ) =
    ( left, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAt 2 0
        --> Just (fromTuple ( [ 1, 2, 0 ], [ 4, 5 ] ))

-}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem zipper =
    setAtRelative (indexAbsoluteToRelative zipper i) elem zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAt 2 0
        --> Just (fromTuple ( [ 1, 2, 0 ], [ 4, 5 ] ))

-}
trySetAt : Int -> a -> Zipper a -> Zipper a
trySetAt i elem zipper =
    trySetAtRelative (indexAbsoluteToRelative zipper i) elem zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAtRelative (LeftIndex 1) 0
        --> Just (fromTuple ( [ 1, 0, 3 ], [ 4, 5 ] ))

-}
setAtRelative : RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)
setAtRelative i elem ( left, right ) =
    case i of
        LeftIndex i_ ->
            List.Extra.getAt i_ left
                |> Maybe.map (\_ -> ( List.Extra.setAt i_ elem left, right ))

        RightIndex i_ ->
            List.Extra.getAt i_ right
                |> Maybe.map (\_ -> ( left, List.Extra.setAt i_ elem right ))


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAtRelative (LeftIndex 1) 0
        --> Just (fromTuple ( [ 1, 0, 3 ], [ 4, 5 ] ))

-}
trySetAtRelative : RelativeIndex -> a -> Zipper a -> Zipper a
trySetAtRelative i elem zipper =
    setAtRelative i elem zipper
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> map String.fromInt
        --> fromTuple ( [ "1", "2", "3" ], [ "4", "5" ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, right ) =
    ( List.map f left, List.map f right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> mapSeparately ((+) 10) ((+) 20)
        --> fromTuple ( [ 11, 12, 13 ], [ 24, 25 ] )

-}
mapSeparately : (a -> b) -> (a -> b) -> Zipper a -> Zipper b
mapSeparately fLeft fRight ( left, right ) =
    ( List.map fLeft left, List.map fRight right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> mapLeft ((+) 10)
        --> fromTuple ( [ 11, 12, 13 ], [ 4, 5 ] )

-}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft f ( left, right ) =
    ( List.map f left, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> mapRight ((+) 10)
        --> fromTuple ( [ 1, 2, 3 ], [ 14, 15 ] )

-}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight f ( left, right ) =
    ( left, List.map f right )


{-|

    justIndex : a -> Int -> b -> Int
    justIndex _ i _ = i

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap FromFirst justIndex
        --> fromTuple ( [ 0, 1 ], [ 2, 3, 4, 5 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap FromLast justIndex
        --> fromTuple ( [ 5, 4 ], [ 3, 2, 1, 0 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap FromSplit justIndex
        --> fromTuple ( [ -2, -1 ], [ 1, 2, 3, 4 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap FromEdges justIndex
        --> fromTuple ( [ 0, 1 ], [ 3, 2, 1, 0 ] )

-}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> f Left i elem) indexes.left left
    , List.map2 (\i elem -> f Right i elem) indexes.right right
    )


{-| Similar to `indexedMap` except only applied to the left side. Note the slightly different type signature. See [`Zipper.ListList.Advanced.indexedMapLeft`](Zipper.ListList.Advanced.indexedMapLeft) for a function that is capable of `(List a, List a) -> (List b, List a)`
-}
indexedMapLeft : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> f Left i elem) indexes.left left
    , right
    )


{-| Similar to `indexedMap` except only applied to the right side. Note the slightly different type signature. See [`Zipper.ListList.Advanced.indexedMapRight`](Zipper.ListList.Advanced.indexedMapRight) for a function that is capable of `(List a, List a) -> (List a, List b)`
-}
indexedMapRight : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapRight indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , List.map2 (\i elem -> f Right i elem) indexes.right right
    )


{-|

    fromTuple ( [ "a", "b", "c" ], [ "d", "e", "f" ] )
        |> update (String.join "" >> List.repeat 2 >> List.indexedMap Tuple.pair)
        --> fromTuple ( [ ( 0, "abc" ), ( 1, "abc" ) ], [ ( 0, "def" ), ( 1, "def" ) ] )

-}
update : (List a -> List b) -> Zipper a -> Zipper b
update f ( left, right ) =
    ( left |> List.reverse |> f |> List.reverse, f right )


{-|

    fromTuple ( [ "a", "b", "c" ], [ "d", "e", "f" ] )
        |> updateSeparately
            (String.join "" >> List.singleton)
            (String.join "-" >> List.singleton)
        --> fromTuple ( [ "abc" ], [ "d-e-f" ] )

-}
updateSeparately : (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b
updateSeparately fLeft fRight ( left, right ) =
    ( left |> List.reverse |> fLeft |> List.reverse, fRight right )


{-|

    fromTuple ( [ "a", "b", "c" ], [ "d", "e", "f" ] )
        |> updateLeft (String.join "" >> List.singleton)
        --> fromTuple ( [ "abc" ], [ "d", "e", "f" ] )

-}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft fLeft ( left, right ) =
    ( left |> List.reverse |> fLeft |> List.reverse, right )


{-|

    fromTuple ( [ "a", "b", "c" ], [ "d", "e", "f" ] )
        |> updateRight (String.join "" >> List.singleton)
        --> fromTuple ( [ "a", "b", "c" ], [ "def" ] )

-}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, right ) =
    ( left, fRight right )


{-| -}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f zipper =
    updateAtRelative (indexAbsoluteToRelative zipper i) f zipper


{-| -}
tryUpdateAt : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAt i f zipper =
    tryUpdateAtRelative (indexAbsoluteToRelative zipper i) f zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> updateAtRelative (LeftIndex 0) ((+) 10)
        --> Just (fromTuple ( [ 1, 2, 13 ], [ 4, 5, 6 ] ))

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> updateAtRelative (RightIndex 2) ((+) 10)
        --> Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 16 ] ))

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> updateAtRelative (RightIndex 10) ((+) 10)
        --> Nothing

-}
updateAtRelative : RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelative i f ( left, right ) =
    case i of
        LeftIndex i_ ->
            List.Extra.getAt i_ left
                |> Maybe.map (\_ -> ( List.Extra.updateAt i_ f left, right ))

        RightIndex i_ ->
            List.Extra.getAt i_ right
                |> Maybe.map (\_ -> ( left, List.Extra.updateAt i_ f right ))


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> tryUpdateAtRelative (LeftIndex 0) ((+) 10)
        --> fromTuple ( [ 1, 2, 13 ], [ 4, 5, 6 ] )

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> tryUpdateAtRelative (RightIndex 10) ((+) 10)
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )

-}
tryUpdateAtRelative : RelativeIndex -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAtRelative i f zipper =
    updateAtRelative i f zipper
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] )
        |> filter (\n -> modBy 2 n == 0)
        --> fromTuple ( [ 2, 4 ], [ 2, 4 ] )

-}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, right ) =
    ( List.filter f left, List.filter f right )


{-|

    fromTuple ( [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] )
        |> filterSeparately (\n -> modBy 2 n /= 0) (\n -> modBy 2 n == 0)
        --> fromTuple ( [ 1, 3 ], [ 2, 4 ] )

-}
filterSeparately : (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a
filterSeparately fLeft fRight ( left, right ) =
    ( List.filter fLeft left, List.filter fRight right )


{-| -}
filterLeft : (a -> Bool) -> Zipper a -> Zipper a
filterLeft f ( left, right ) =
    ( List.filter f left, right )


{-| -}
filterRight : (a -> Bool) -> Zipper a -> Zipper a
filterRight f ( left, right ) =
    ( left, List.filter f right )


{-| -}
indexedFilter : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> ( f Left i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f Right i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedFilterLeft : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> ( f Left i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , right
    )


{-| -}
indexedFilterRight : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight indexMethod f (( left, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , List.map2 (\i elem -> ( f Right i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft ( left, right ) =
    case left of
        head :: tail ->
            Just ( tail, head :: right )

        [] ->
            Nothing


{-| -}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    zipper
        |> moveLeft
        |> Maybe.withDefault zipper


{-| -}
moveLeftUntil : (List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity f zipper


{-| -}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight ( left, right ) =
    case right of
        head :: tail ->
            Just ( head :: left, tail )

        [] ->
            Nothing


{-| -}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    zipper
        |> moveRight
        |> Maybe.withDefault zipper


{-| -}
moveRightUntil : (List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightUntil f zipper =
    Adv.moveRightUntil identity f zipper


{-| -}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, right ) =
    ( left ++ [ elem ], right )


{-| Set selection to first element
-}
moveToFirst : Zipper a -> Zipper a
moveToFirst zipper =
    fromTuple ( toList zipper, [] )


{-| Set selection to Nth element
-}
moveToN : Int -> Zipper a -> Maybe (Zipper a)
moveToN n zipper =
    let
        allElems =
            toList zipper
    in
    if n >= 0 && n < List.length allElems then
        Just
            ( allElems |> List.take n
            , allElems |> List.drop n
            )

    else
        Nothing


{-| Set selection to Nth element
-}
tryMoveToN : Int -> Zipper a -> Zipper a
tryMoveToN n zipper =
    moveToN n zipper
        |> Maybe.withDefault zipper


{-| Set selection to last element
-}
moveToLast : Zipper a -> Zipper a
moveToLast zipper =
    fromTuple ( [], toList zipper )


{-| -}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, right ) =
    ( left, right ++ [ elem ] )


{-| -}
insertLeftOfSplit : a -> Zipper a -> Zipper a
insertLeftOfSplit elem ( left, right ) =
    ( elem :: left, right )


{-| -}
insertRightOfSplit : a -> Zipper a -> Zipper a
insertRightOfSplit elem ( left, right ) =
    ( left, elem :: right )


{-| -}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> moveToFirst
        |> updateRight List.sort
        |> moveToN (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortByKeepIndex : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepIndex f zipper =
    zipper
        |> moveToFirst
        |> updateRight (List.sortBy f)
        |> moveToN (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortWithKeepIndex : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepIndex f zipper =
    zipper
        |> moveToFirst
        |> updateRight (List.sortWith f)
        |> moveToN (position zipper)
        |> Maybe.withDefault zipper


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, right ) =
    ( List.reverse right, List.reverse left )


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, right ) =
    ( List.reverse left, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, right ) =
    ( left, List.reverse right )


{-| -}
swap : Int -> Int -> Zipper a -> Maybe (Zipper a)
swap i j zipper =
    case ( getAt i zipper, getAt j zipper ) of
        ( Just iElem, Just jElem ) ->
            zipper
                |> setAt i jElem
                |> Maybe.withDefault zipper
                |> setAt j iElem
                |> Maybe.withDefault zipper
                |> Just

        _ ->
            Nothing


{-| -}
trySwap : Int -> Int -> Zipper a -> Zipper a
trySwap i j zipper =
    swap i j zipper |> Maybe.withDefault zipper


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteCheck zipper -1 --> Nothing

    indexAbsoluteCheck zipper 0 --> Just Left

    indexAbsoluteCheck zipper 2 --> Just Left

    indexAbsoluteCheck zipper 3 --> Just Right

    indexAbsoluteCheck zipper 5 --> Just Right

    indexAbsoluteCheck zipper 6 --> Nothing

-}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck ( left, right ) i =
    if i >= 0 && i < length ( left, [] ) then
        Just Left

    else if i >= length ( left, [] ) && i < length ( left, right ) then
        Just Right

    else
        Nothing


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeCheck zipper (LeftIndex 3) --> Nothing

    indexRelativeCheck zipper (LeftIndex 2) --> Just Left

    indexRelativeCheck zipper (LeftIndex 0) --> Just Left

    indexRelativeCheck zipper (RightIndex 0) --> Just Right

    indexRelativeCheck zipper (RightIndex 2) --> Just Right

    indexRelativeCheck zipper (RightIndex 3) --> Nothing

-}
indexRelativeCheck : Zipper a -> RelativeIndex -> Maybe Position
indexRelativeCheck zipper i =
    indexAbsoluteCheck
        zipper
        (indexRelativeToAbsolute zipper i)


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteToRelative zipper -1 --> LeftIndex 3

    indexAbsoluteToRelative zipper 0 --> LeftIndex 2

    indexAbsoluteToRelative zipper 2 --> LeftIndex 0

    indexAbsoluteToRelative zipper 3 --> RightIndex 0

    indexAbsoluteToRelative zipper 5 --> RightIndex 2

    indexAbsoluteToRelative zipper 6 --> RightIndex 3

-}
indexAbsoluteToRelative : Zipper a -> Int -> RelativeIndex
indexAbsoluteToRelative ( left, _ ) i =
    let
        position_ =
            List.length left
    in
    if i < position_ then
        LeftIndex <| position_ - i - 1

    else
        RightIndex <| i - position_


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteToRelativeCheck zipper -1 --> Nothing

    indexAbsoluteToRelativeCheck zipper 0 --> Just (LeftIndex 2)

    indexAbsoluteToRelativeCheck zipper 2 --> Just (LeftIndex 0)

    indexAbsoluteToRelativeCheck zipper 3 --> Just (RightIndex 0)

    indexAbsoluteToRelativeCheck zipper 5 --> Just (RightIndex 2)

    indexAbsoluteToRelativeCheck zipper 6 --> Nothing

-}
indexAbsoluteToRelativeCheck : Zipper a -> Int -> Maybe RelativeIndex
indexAbsoluteToRelativeCheck zipper i =
    indexAbsoluteToRelative zipper i
        |> (\j ->
                if indexRelativeCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeToAbsolute zipper (LeftIndex 3) --> -1

    indexRelativeToAbsolute zipper (LeftIndex 2) --> 0

    indexRelativeToAbsolute zipper (LeftIndex 0) --> 2

    indexRelativeToAbsolute zipper (RightIndex 0) --> 3

    indexRelativeToAbsolute zipper (RightIndex 2) --> 5

    indexRelativeToAbsolute zipper (RightIndex 3) --> 6

-}
indexRelativeToAbsolute : Zipper a -> RelativeIndex -> Int
indexRelativeToAbsolute ( left, _ ) i =
    let
        position_ =
            List.length left
    in
    case i of
        LeftIndex i_ ->
            position_ - i_ - 1

        RightIndex i_ ->
            position_ + i_


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeToAbsoluteCheck zipper (LeftIndex 3) --> Nothing

    indexRelativeToAbsoluteCheck zipper (LeftIndex 2) --> Just 0

    indexRelativeToAbsoluteCheck zipper (LeftIndex 0) --> Just 2

    indexRelativeToAbsoluteCheck zipper (RightIndex 0) --> Just 3

    indexRelativeToAbsoluteCheck zipper (RightIndex 2) --> Just 5

    indexRelativeToAbsoluteCheck zipper (RightIndex 3) --> Nothing

-}
indexRelativeToAbsoluteCheck : Zipper a -> RelativeIndex -> Maybe Int
indexRelativeToAbsoluteCheck zipper i =
    indexRelativeToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
relativeIndexToPosDists : Zipper a -> RelativeIndex -> Maybe ( Position, Dists )
relativeIndexToPosDists zipper i =
    absoluteIndexToPosDists
        zipper
        (indexRelativeToAbsolute zipper i)


{-| -}
absoluteIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
absoluteIndexToPosDists ( left, right ) i =
    if i >= 0 && i < length ( left, [] ) then
        Just
            ( Left
            , { fromLeft = i
              , fromRight = length ( left, [] ) - i
              }
            )

    else if i >= length ( left, [] ) && i < length ( left, right ) then
        Just
            ( Right
            , { fromLeft = i - length ( left, [] )
              , fromRight = length ( left, right ) - i
              }
            )

    else
        Nothing


indexRangeFromMethod :
    IndexMethod
    -> Zipper a
    ->
        { left : List Int
        , right : List Int
        }
indexRangeFromMethod indexMethod zipper =
    case indexMethod of
        FromFirst ->
            indexRanges zipper |> .fromFirst

        FromLast ->
            indexRanges zipper |> .fromLast

        FromSplit ->
            indexRanges zipper |> .fromSplit

        FromEdges ->
            indexRanges zipper |> .fromEdges


{-| -}
indexRanges :
    Zipper a
    ->
        { fromFirst :
            { left : List Int
            , right : List Int
            }
        , fromLast :
            { left : List Int
            , right : List Int
            }
        , fromSplit :
            { left : List Int
            , right : List Int
            }
        , fromEdges :
            { left : List Int
            , right : List Int
            }
        }
indexRanges (( left, right ) as zipper) =
    { fromFirst =
        { left =
            List.range
                0
                (List.length left - 1)
                |> List.reverse
        , right =
            List.range
                (List.length left)
                (length zipper - 1)
        }
    , fromLast =
        { left =
            List.range
                (List.length right)
                (length zipper - 1)
        , right =
            List.range
                0
                (List.length right - 1)
                |> List.reverse
        }
    , fromSplit =
        { left =
            List.range
                0
                (List.length left - 1)
                |> List.map ((+) 1)
                |> List.map ((*) -1)
        , right =
            List.range
                0
                (List.length right - 1)
                |> List.map ((+) 1)
        }
    , fromEdges =
        { left =
            List.range
                0
                (List.length left - 1)
                |> List.reverse
        , right =
            List.range
                0
                (List.length right - 1)
                |> List.reverse
        }
    }
