module Zipper.ListElemList exposing
    ( Zipper, Dists
    , singleton, fromTuple, fromListAndIndex, fromZipperListList, fromZipperListListList
    , toTuple, toList, toZipperListList, toZipperListListList
    , length, lengthLeft, lengthRight, position
    , getFirst, getLeft, getSelected, getRight, getLast
    , setFirst, setLeft, setSelected, setRight, setLast
    , map, IndexMethod(..), Position(..), indexedMap
    , update, updateLeft, updateSelected, updateRight
    , filter, indexedFilter
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast
    , insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected
    , sortKeepElem, sortKeepIndex
    , reverse
    , indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRangesFromFirst, indexRangesFromLast, indexRangesFromSelection, indexRangesFromEdges
    , indexedFilterLeft, indexedFilterRight, indexedMapLeft, indexedMapRight, indexedMapSelected, mapLeft, mapRight, mapSeparately, moveLeftUntil, moveRightUntil, moveToIndex, moveToIndexRelative, positionFromEnd, reverseLeft, reverseRight, setAt, setAtClamp, setAtRelative, setAtRelativeClamp, sortByKeepElem, sortByKeepIndex, sortWithKeepElem, sortWithKeepIndex, swap, swapSelectedWithFirst, swapSelectedWithIndex, swapSelectedWithLast, tryMoveToIndex, tryMoveToIndexRelative, trySetAt, trySetAtRelative, trySwapSelectedWithIndex, tryUpdateAt, tryUpdateAtRelative, updateAt, updateAtClamp, updateAtRelative, updateAtRelativeClamp, updateSeparately
    )

{-| A special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced) where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringCharString`](Zipper.StringCharString)

  - Special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced)
  - General case of [`Zipper.StringCharString`](Zipper.StringCharString)


# Definition

@docs Zipper, Dists


# Create

@docs singleton, fromTuple, fromListAndIndex, fromZipperListList, fromZipperListListList


# To

@docs toTuple, toList, toZipperListList, toZipperListListList


# Length

@docs length, lengthLeft, lengthRight, position


# Get

@docs getFirst, getLeft, getSelected, getRight, getLast


# Set

@docs setFirst, setLeft, setSelected, setRight, setLast


# Map

@docs map, IndexMethod, Position, indexedMap


# Update

@docs update, updateLeft, updateSelected, updateRight


# Filter

@docs filter, indexedFilter


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast


# Insert

@docs insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected


# Sort

@docs sortKeepElem, sortKeepIndex


# Reverse

@docs reverse


# Swap


# Indexes

@docs Dists, indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRangesFromFirst, indexRangesFromLast, indexRangesFromSelection, indexRangesFromEdges

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
        --> fromTuple ( [ -2, -1 ], 0, [ 1, 2, 3, 4 ] )

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


{-| -}
type alias Dists =
    { fromLeft : Int, fromRight : Int }


{-|

    zipper : Zipper Int
    zipper = fromTuple ([1,2,3],4,[5,6,7])

    absoluteIndexToPosDists zipper -1 --> Nothing

    absoluteIndexToPosDists zipper 0 --> Just (Left, {fromLeft=0,fromRight=2})

    absoluteIndexToPosDists zipper 2 --> Just (Left, {fromLeft=2,fromRight=0})

    absoluteIndexToPosDists zipper 3 --> Just (Selected, {fromLeft=0,fromRight=0})

    absoluteIndexToPosDists zipper 4 --> Just (Right, {fromLeft=0,fromRight=2})

    absoluteIndexToPosDists zipper 6 --> Just (Right, {fromLeft=2,fromRight=0})

    absoluteIndexToPosDists zipper 7 --> Nothing

-}
absoluteIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
absoluteIndexToPosDists ( left, selection, right ) i =
    if i >= 0 && i < List.length left then
        Just
            ( Left
            , { fromLeft = i
              , fromRight = length ( left, selection, right ) - i - 1 - List.length right - 1
              }
            )

    else if i == List.length left then
        Just
            ( Selected
            , { fromLeft = 0
              , fromRight = 0
              }
            )

    else if i >= List.length left + 1 && i < length ( left, selection, right ) then
        Just
            ( Right
            , { fromLeft = i - length ( left, selection, [] )
              , fromRight = length ( left, selection, right ) - i - 1
              }
            )

    else
        Nothing


{-| -}
filter : (a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )
filter f ( left, selected, right ) =
    ( List.filter f left
    , if f selected then
        Just selected

      else
        Nothing
    , List.filter f right
    )


{-| -}
fromListAndIndex : Int -> List a -> Maybe (Zipper a)
fromListAndIndex i elems =
    case List.Extra.getAt i elems of
        Just elem ->
            Just ( List.take i elems, elem, List.drop (i + 1) elems )

        Nothing ->
            Nothing


{-| -}
fromTuple : ( List a, a, List a ) -> Zipper a
fromTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| From [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper), by providing selected element.

    ( [ 2, 1 ], [ 4, 5 ] )
        |> fromZipperListList 3
        --> ( [ 2, 1 ], 3, [ 4, 5 ] )

-}
fromZipperListList : a -> ( List a, List a ) -> Zipper a
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| From [`Zipper.ListListList.Zipper`](Zipper.ListListList#Zipper), by providing function to convert selected list to selected element.

    ( [ 2, 1 ], [ 10, 11, 12 ], [ 4, 5 ] )
        |> fromZipperListListList List.sum
        --> ( [ 2, 1 ], 33, [ 4, 5 ] )

-}
fromZipperListListList : (List a -> a) -> ( List a, List a, List a ) -> Zipper a
fromZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-|

    fromTuple ( [ 1, 2 ], 3, [ 4, 5 ] )
        |> getFirst
        --> 1

    fromTuple ( [], 1, [] )
        |> getFirst
        --> 1

-}
getFirst : Zipper a -> a
getFirst ( left, selected, _ ) =
    case List.Extra.unconsLast left of
        Just ( last, rest ) ->
            last

        Nothing ->
            selected


{-|

    fromTuple ( [ 1, 2 ], 3, [ 4, 5 ] )
        |> getLast
        --> 5

    fromTuple ( [], 1, [] )
        |> getLast
        --> 1

-}
getLast : Zipper a -> a
getLast ( _, selected, right ) =
    case List.Extra.unconsLast right of
        Just ( last, rest ) ->
            last

        Nothing ->
            selected


{-| -}
getLeft : Zipper a -> List a
getLeft =
    Adv.getLeft


{-| -}
getRight : Zipper a -> List a
getRight =
    Adv.getRight


{-| -}
getSelected : Zipper a -> a
getSelected =
    Adv.getSelected


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexAbsoluteCheck zipper -1 --> Nothing

    indexAbsoluteCheck zipper 0 --> Just Left

    indexAbsoluteCheck zipper 2 --> Just Left

    indexAbsoluteCheck zipper 3 --> Just Selected

    indexAbsoluteCheck zipper 4 --> Just Right

    indexAbsoluteCheck zipper 6 --> Just Right

    indexAbsoluteCheck zipper 7 --> Nothing

-}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck zipper i =
    indexRelativeCheck zipper (indexAbsoluteToRelative zipper i)


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexAbsoluteToRelative zipper -1 --> -4

    indexAbsoluteToRelative zipper 0 --> -3

    indexAbsoluteToRelative zipper 2 --> -1

    indexAbsoluteToRelative zipper 3 --> 0

    indexAbsoluteToRelative zipper 4 --> 1

    indexAbsoluteToRelative zipper 6 --> 3

    indexAbsoluteToRelative zipper 7 --> 4

-}
indexAbsoluteToRelative : Zipper a -> Int -> Int
indexAbsoluteToRelative ( left, _, _ ) i =
    i - List.length left


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexAbsoluteToRelativeCheck zipper -1 --> Nothing

    indexAbsoluteToRelativeCheck zipper 0 --> Just -3

    indexAbsoluteToRelativeCheck zipper 2 --> Just -1

    indexAbsoluteToRelativeCheck zipper 3 --> Just 0

    indexAbsoluteToRelativeCheck zipper 4 --> Just 1

    indexAbsoluteToRelativeCheck zipper 6 --> Just 3

    indexAbsoluteToRelativeCheck zipper 7 --> Nothing

-}
indexAbsoluteToRelativeCheck : Zipper a -> Int -> Maybe Int
indexAbsoluteToRelativeCheck zipper i =
    indexAbsoluteToRelative zipper i
        |> (\j ->
                if indexRelativeCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexedFilter : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> ( f Left i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , List.map2 (\i elem -> ( f Right i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedFilterLeft : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> ( f Left i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , right
    )


{-| -}
indexedFilterRight : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , selected
    , List.map2 (\i elem -> ( f Right i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> f Left i elem) indexes.left left
    , f Selected indexes.selected selected
    , List.map2 (\i elem -> f Right i elem) indexes.right right
    )


{-| -}
indexedMapLeft : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> f Left i elem) indexes.left left
    , selected
    , right
    )


{-| -}
indexedMapRight : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapRight indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , selected
    , List.map2 (\i elem -> f Right i elem) indexes.right right
    )


{-| -}
indexedMapSelected : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapSelected indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , f Selected indexes.selected selected
    , right
    )


indexRangeFromMethod : IndexMethod -> Zipper a -> { left : List Int, selected : Int, right : List Int }
indexRangeFromMethod indexMethod zipper =
    case indexMethod of
        FromFirst ->
            indexRangesFromFirst zipper

        FromLast ->
            indexRangesFromLast zipper

        FromSelection ->
            indexRangesFromSelection zipper

        FromEdges ->
            indexRangesFromEdges zipper


{-| -}
indexRangesFromEdges : Zipper a -> { left : List Int, selected : Int, right : List Int }
indexRangesFromEdges (( left, selected, right ) as zipper) =
    let
        fromFirst =
            indexRangesFromFirst zipper

        fromLast =
            indexRangesFromLast zipper
    in
    { left =
        List.Extra.zip fromFirst.left fromLast.left
            |> List.map (\( a, b ) -> min a b)
    , selected = min fromFirst.selected fromLast.selected
    , right =
        List.Extra.zip fromFirst.right fromLast.right
            |> List.map (\( a, b ) -> min a b)
    }


{-| -}
indexRangesFromFirst : Zipper a -> { left : List Int, selected : Int, right : List Int }
indexRangesFromFirst (( left, selected, right ) as zipper) =
    { left =
        List.range
            0
            (List.length left - 1)
            |> List.reverse
    , selected =
        List.length left
    , right =
        List.range
            (List.length left + 1)
            (length zipper - 1)
    }


{-| -}
indexRangesFromLast : Zipper a -> { left : List Int, selected : Int, right : List Int }
indexRangesFromLast (( left, selected, right ) as zipper) =
    { left =
        List.range
            (List.length right + 1)
            (length zipper - 1)
    , selected =
        List.length right
    , right =
        List.range
            0
            (List.length right - 1)
            |> List.reverse
    }


{-| -}
indexRangesFromSelection : Zipper a -> { left : List Int, selected : Int, right : List Int }
indexRangesFromSelection (( left, selected, right ) as zipper) =
    { left =
        List.range
            1
            (List.length left)
            |> List.map ((*) -1)
    , selected = 0
    , right =
        List.range
            1
            (List.length right)
    }


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexRelativeCheck zipper -4 --> Nothing

    indexRelativeCheck zipper -3 --> Just Left

    indexRelativeCheck zipper -1 --> Just Left

    indexRelativeCheck zipper 0 --> Just Selected

    indexRelativeCheck zipper 1 --> Just Right

    indexRelativeCheck zipper 3 --> Just Right

    indexRelativeCheck zipper 4 --> Nothing

-}
indexRelativeCheck : Zipper a -> Int -> Maybe Position
indexRelativeCheck ( left, _, right ) i =
    if i == 0 then
        Just Selected

    else if i > 0 && i <= List.length right then
        Just Right

    else if (i * -1) > 0 && (i * -1) <= List.length left then
        Just Left

    else
        Nothing


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexRelativeToAbsolute zipper -4 --> -1

    indexRelativeToAbsolute zipper -3 --> 0

    indexRelativeToAbsolute zipper -1 --> 2

    indexRelativeToAbsolute zipper 0 --> 3

    indexRelativeToAbsolute zipper 1 --> 4

    indexRelativeToAbsolute zipper 3 --> 6

    indexRelativeToAbsolute zipper 4 --> 7

-}
indexRelativeToAbsolute : Zipper a -> Int -> Int
indexRelativeToAbsolute ( left, _, _ ) i =
    i + List.length left


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )

    indexRelativeToAbsoluteCheck zipper -4 --> Nothing

    indexRelativeToAbsoluteCheck zipper -3 --> Just 0

    indexRelativeToAbsoluteCheck zipper -1 --> Just 2

    indexRelativeToAbsoluteCheck zipper 0 --> Just 3

    indexRelativeToAbsoluteCheck zipper 1 --> Just 4

    indexRelativeToAbsoluteCheck zipper 3 --> Just 6

    indexRelativeToAbsoluteCheck zipper 4 --> Nothing

-}
indexRelativeToAbsoluteCheck : Zipper a -> Int -> Maybe Int
indexRelativeToAbsoluteCheck zipper i =
    indexRelativeToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
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


{-| Map a function over all elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> map ((+) 10)
        --> ( [ 12, 11 ], 13, [ 14, 15 ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f zipper =
    Adv.map f f f zipper


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft =
    Adv.mapLeft


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight =
    Adv.mapRight


{-| Map a function over all elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> mapSeparately ((+) 10) ((+) 20) ((+) 30)
        --> ( [ 12, 11 ], 23, [ 34, 35 ] )

-}
mapSeparately : (a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b
mapSeparately fA fB fC zipper =
    Adv.map fA fB fC zipper


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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil (\left _ _ -> List.length left <= 1)
        --> Just (fromTuple ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveRightUntil (\left _ _ -> List.length left >= 5)
        --> Just (fromTuple ( [ 1, 2, 3, 4, 5 ], 6, [ 7 ] ))

-}
moveRightUntil : (List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightUntil f zipper =
    Adv.moveRightUntil identity identity f zipper


{-| Set selection to first element
-}
moveToFirst : Zipper a -> Zipper a
moveToFirst zipper =
    Adv.moveToFirst identity identity zipper


{-| Set selection to last element
-}
moveToLast : Zipper a -> Zipper a
moveToLast zipper =
    Adv.moveToLast identity identity zipper


{-| Set selection to Nth element
-}
moveToIndex : Int -> Zipper a -> Maybe (Zipper a)
moveToIndex i ( before, selected, after ) =
    let
        allElems =
            toList ( before, selected, after )
    in
    case List.Extra.getAt i allElems of
        Just elemN ->
            Just
                ( allElems |> List.take i |> List.reverse
                , elemN
                , allElems |> List.drop (i + 1)
                )

        Nothing ->
            Nothing


{-| Set selection to Nth element
-}
moveToIndexRelative : Int -> Zipper a -> Maybe (Zipper a)
moveToIndexRelative i zipper =
    moveToIndex (indexRelativeToAbsolute zipper i) zipper


{-| -}
position : Zipper a -> Int
position =
    Adv.position


{-| -}
positionFromEnd : Zipper a -> Int
positionFromEnd =
    Adv.positionFromEnd


{-| -}
relativeIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
relativeIndexToPosDists zipper i =
    absoluteIndexToPosDists zipper (indexRelativeToAbsolute zipper i)


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( List.reverse right, selected, List.reverse left )


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, selected, right ) =
    ( left, selected, List.reverse right )


{-| -}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem (( left, selected, right ) as zipper) =
    case absoluteIndexToPosDists zipper i of
        Just ( Left, { fromRight } ) ->
            Just
                ( List.Extra.setAt fromRight elem left
                , selected
                , right
                )

        Just ( Selected, _ ) ->
            Just
                ( left
                , elem
                , right
                )

        Just ( Right, { fromLeft } ) ->
            Just
                ( left
                , selected
                , List.Extra.setAt fromLeft elem right
                )

        Nothing ->
            Nothing


{-| -}
setAtClamp : Int -> a -> Zipper a -> Zipper a
setAtClamp i elem zipper =
    setAt
        (i |> clamp 0 (length zipper - 1))
        elem
        zipper
        |> Maybe.withDefault zipper


{-| -}
setAtRelative : Int -> a -> Zipper a -> Maybe (Zipper a)
setAtRelative i elem zipper =
    setAt (indexRelativeToAbsolute zipper i) elem zipper


{-| -}
setAtRelativeClamp : Int -> a -> Zipper a -> Zipper a
setAtRelativeClamp i elem zipper =
    setAtClamp (indexRelativeToAbsolute zipper i) elem zipper


{-| -}
setFirst : a -> Zipper a -> Zipper a
setFirst elem ( left, selected, right ) =
    case List.Extra.unconsLast left of
        Just ( last, rest ) ->
            ( rest ++ [ elem ], selected, right )

        Nothing ->
            ( left, elem, right )


{-| -}
setLast : a -> Zipper a -> Zipper a
setLast elem ( left, selected, right ) =
    case List.Extra.unconsLast right of
        Just ( last, rest ) ->
            ( left, selected, rest ++ [ elem ] )

        Nothing ->
            ( left, elem, right )


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft =
    Adv.setLeft


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight =
    Adv.setRight


{-| -}
setSelected : a -> Zipper a -> Zipper a
setSelected =
    Adv.setSelected


{-| Create a zipper with a single element

    singleton 0 --> ( [], 0, [] )

-}
singleton : a -> Zipper a
singleton elem =
    ( [], elem, [] )


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
sortByKeepIndex : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepIndex f zipper =
    zipper
        |> moveToFirst
        |> updateRight (List.sortBy f)
        |> sortFirstPairBy_ f
        |> updateRight (List.sortBy f)
        |> moveToIndex (position zipper)
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


{-|

    fromTuple ( [ 9, 7, 8, 6 ], 5, [ 5, 3, 4 ] )
        |> sortKeepElem
        --> fromTuple ( [ 3, 4 ], 5, [ 5, 6, 7, 8, 9 ] )

    fromTuple ( [ 9, 7, 8, 6, 5 ], 5, [ 3, 4 ] )
        |> sortKeepElem
        --> fromTuple ( [ 3, 4, 5 ], 5, [ 6, 7, 8, 9 ] )

-}
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
        |> List.reverse
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith compare
    )


{-| -}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> moveToFirst
        |> updateRight List.sort
        |> sortFirstPair_
        |> updateRight List.sort
        |> moveToIndex (position zipper)
        |> Maybe.withDefault zipper


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
sortWithKeepIndex : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepIndex f zipper =
    zipper
        |> moveToFirst
        |> updateRight (List.sortWith f)
        |> sortFirstPairWith_ f
        |> updateRight (List.sortWith f)
        |> moveToIndex (position zipper)
        |> Maybe.withDefault zipper


{-| -}
swap : Zipper a -> Zipper a
swap zipper =
    zipper


{-| -}
swapSelectedWithFirst : Zipper a -> Zipper a
swapSelectedWithFirst ( before, selected, after ) =
    case List.Extra.unconsLast before of
        Just ( last, rest ) ->
            ( rest ++ [ selected ], last, after )

        Nothing ->
            ( [], selected, after )


{-| -}
swapSelectedWithLast : Zipper a -> Zipper a
swapSelectedWithLast ( before, selected, after ) =
    case List.Extra.unconsLast after of
        Just ( last, rest ) ->
            ( before, last, rest ++ [ selected ] )

        Nothing ->
            ( before, selected, [] )


{-| -}
swapSelectedWithIndex : Int -> Zipper a -> Maybe (Zipper a)
swapSelectedWithIndex i (( left, selected, right ) as zipper) =
    case absoluteIndexToPosDists zipper i of
        Just ( Left, { fromRight } ) ->
            Just
                ( List.Extra.setAt fromRight selected left
                , List.Extra.getAt fromRight left |> Maybe.withDefault selected
                , right
                )

        Just ( Selected, _ ) ->
            Just
                zipper

        Just ( Right, { fromLeft } ) ->
            Just
                ( left
                , List.Extra.getAt fromLeft right |> Maybe.withDefault selected
                , List.Extra.setAt fromLeft selected right
                )

        Nothing ->
            Nothing


{-| -}
toList : Zipper a -> List a
toList ( a, b, c ) =
    List.reverse a ++ [ b ] ++ c


{-| -}
toTuple : Zipper a -> ( List a, a, List a )
toTuple ( a, b, c ) =
    ( List.reverse a, b, c )


{-| To [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper) by dropping selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> toZipperListList
        --> ( [ 2, 1 ], [ 4, 5 ] )

-}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList =
    Adv.toZipperListList


{-| To [`Zipper.ListListList.Zipper`](Zipper.ListListList#Zipper) by providing function to convert selected element to selected list.

    ( [ 2, 1 ], 0, [ 4, 5 ] )
        |> toZipperListListList (List.repeat 3)
        --> ( [ 2, 1 ], [ 0, 0, 0 ], [ 4, 5 ] )

-}
toZipperListListList : (a -> List a) -> Zipper a -> ( List a, List a, List a )
toZipperListListList f ( left, selected, right ) =
    ( left, f selected, right )


{-| Attempt to move selection to left, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    Adv.tryMoveLeft identity identity zipper


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


{-| Set selection to Nth element
-}
tryMoveToIndex : Int -> Zipper a -> Zipper a
tryMoveToIndex n zipper =
    moveToIndex n zipper
        |> Maybe.withDefault zipper


{-| Set selection to Nth element
-}
tryMoveToIndexRelative : Int -> Zipper a -> Zipper a
tryMoveToIndexRelative n zipper =
    moveToIndexRelative n zipper
        |> Maybe.withDefault zipper


{-| -}
trySetAt : Int -> a -> Zipper a -> Zipper a
trySetAt i elem zipper =
    setAt i elem zipper
        |> Maybe.withDefault zipper


{-| -}
trySetAtRelative : Int -> a -> Zipper a -> Zipper a
trySetAtRelative i elem zipper =
    setAtRelative i elem zipper
        |> Maybe.withDefault zipper


{-| -}
trySwapSelectedWithIndex : Int -> Zipper a -> Zipper a
trySwapSelectedWithIndex i zipper =
    swapSelectedWithIndex i zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAt : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAt i f zipper =
    updateAt i f zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAtRelative : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAtRelative i f zipper =
    updateAtRelative i f zipper
        |> Maybe.withDefault zipper


{-| -}
update : (List a -> List a) -> Zipper a -> Zipper a
update f ( left, selected, right ) =
    ( f left
    , selected
    , f right
    )


{-| -}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f (( left, selected, right ) as zipper) =
    case absoluteIndexToPosDists zipper i of
        Just ( Left, { fromRight } ) ->
            Just
                ( List.Extra.updateAt fromRight f left
                , selected
                , right
                )

        Just ( Selected, _ ) ->
            Just
                ( left
                , f selected
                , right
                )

        Just ( Right, { fromLeft } ) ->
            Just
                ( left
                , selected
                , List.Extra.updateAt fromLeft f right
                )

        Nothing ->
            Nothing


{-| -}
updateAtClamp : Int -> (a -> a) -> Zipper a -> Zipper a
updateAtClamp i f zipper =
    updateAt
        (i |> clamp 0 (length zipper - 1))
        f
        zipper
        |> Maybe.withDefault zipper


{-| -}
updateAtRelative : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelative i f zipper =
    updateAt (indexRelativeToAbsolute zipper i) f zipper


{-| -}
updateAtRelativeClamp : Int -> (a -> a) -> Zipper a -> Zipper a
updateAtRelativeClamp i f zipper =
    updateAtClamp (indexRelativeToAbsolute zipper i) f zipper


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft =
    Adv.updateLeft


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight =
    Adv.updateRight


{-| -}
updateSelected : (a -> a) -> Zipper a -> Zipper a
updateSelected =
    Adv.updateSelected


{-| -}
updateSeparately : (List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b
updateSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( fLeft left
    , fSelected selected
    , fRight right
    )
