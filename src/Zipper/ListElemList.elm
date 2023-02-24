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

@docs indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRangesFromFirst, indexRangesFromLast, indexRangesFromSelection, indexRangesFromEdges

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


{-|

    fromTuple ( [ 1, 12, 3 ], 4, [ 15, 16, 7 ] )
        |> filter (\n -> n < 10)
        --> ( [ 1, 3 ], Just 4, [ 7 ] )

-}
filter : (a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )
filter f ( left, selected, right ) =
    ( left |> List.filter f |> List.reverse
    , if f selected then
        Just selected

      else
        Nothing
    , List.filter f right
    )


{-|

    fromListAndIndex 3 [ 1, 2, 3, 4, 5, 6, 7 ]
        --> Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] ))

    fromListAndIndex 10 [ 1, 2, 3, 4, 5, 6, 7 ]
        --> Nothing

-}
fromListAndIndex : Int -> List a -> Maybe (Zipper a)
fromListAndIndex i elems =
    case List.Extra.getAt i elems of
        Just elem ->
            Just <| fromTuple ( List.take i elems, elem, List.drop (i + 1) elems )

        Nothing ->
            Nothing


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        --> ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> getLeft
        --> [ 1, 2, 3 ]

-}
getLeft : Zipper a -> List a
getLeft =
    Adv.getLeft


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> getRight
        --> [ 5, 6, 7 ]

-}
getRight : Zipper a -> List a
getRight =
    Adv.getRight


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> getSelected
        --> 4

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedFilter FromLast (\pos _ val -> pos == Left || val == 6)
        --> fromTuple ( [ 1, 2, 3 ], 4, [ 6 ] )

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedMap FromLast (\_ i val -> i * val * val)
        --> fromTuple ( [ 6, 20, 36 ], 48, [ 50, 36, 0 ] )

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> insertFirst 0
        --> fromTuple ( [ 0, 1, 2, 3 ], 4, [ 5, 6, 7 ] )

-}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, selected, right ) =
    ( left ++ [ elem ], selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> insertLast 0
        --> fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7, 0 ] )

-}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, selected, right ) =
    ( left, selected, right ++ [ elem ] )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> insertLeftOfSelected 0
        --> fromTuple ( [ 1, 2, 3, 0 ], 4, [ 5, 6, 7 ] )

-}
insertLeftOfSelected : a -> Zipper a -> Zipper a
insertLeftOfSelected elem ( left, selected, right ) =
    ( elem :: left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> insertRightOfSelected 0
        --> fromTuple ( [ 1, 2, 3 ], 4, [ 0, 5, 6, 7 ] )

-}
insertRightOfSelected : a -> Zipper a -> Zipper a
insertRightOfSelected elem ( left, selected, right ) =
    ( left, selected, elem :: right )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> length
        --> 7

-}
length : Zipper a -> Int
length =
    Adv.length


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> lengthLeft
        --> 3

-}
lengthLeft : Zipper a -> Int
lengthLeft =
    Adv.lengthLeft


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> lengthRight
        --> 3

-}
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


{-| Set selection to first element

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveToFirst
        --> fromTuple ( [], 1, [ 2, 3, 4, 5, 6, 7 ] )

-}
moveToFirst : Zipper a -> Zipper a
moveToFirst zipper =
    Adv.moveToFirst identity identity zipper


{-| Set selection to last element

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveToLast
        --> fromTuple ( [ 1, 2, 3, 4, 5, 6 ], 7, [] )

-}
moveToLast : Zipper a -> Zipper a
moveToLast zipper =
    Adv.moveToLast identity identity zipper


{-| -}
position : Zipper a -> Int
position =
    Adv.position


{-| -}
relativeIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
relativeIndexToPosDists zipper i =
    absoluteIndexToPosDists zipper (indexRelativeToAbsolute zipper i)


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> reverse
        --> fromTuple ( [ 7, 6, 5 ], 4, [ 3, 2, 1 ] )

-}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( right, selected, left )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> setFirst 0
        --> fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] )

-}
setFirst : a -> Zipper a -> Zipper a
setFirst elem ( left, selected, right ) =
    case List.Extra.unconsLast left of
        Just ( last, rest ) ->
            ( rest ++ [ elem ], selected, right )

        Nothing ->
            ( left, elem, right )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> setLast 0
        --> fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] )

-}
setLast : a -> Zipper a -> Zipper a
setLast elem ( left, selected, right ) =
    case List.Extra.unconsLast right of
        Just ( last, rest ) ->
            ( left, selected, rest ++ [ elem ] )

        Nothing ->
            ( left, elem, right )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> setLeft [ 11, 12, 13 ]
        --> fromTuple ( [ 11, 12, 13 ], 4, [ 5, 6, 7 ] )

-}
setLeft : List a -> Zipper a -> Zipper a
setLeft =
    Adv.setLeft


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> setRight [ 15, 16, 17 ]
        --> fromTuple ( [ 1, 2, 3 ], 4, [ 15, 16, 17 ] )

-}
setRight : List a -> Zipper a -> Zipper a
setRight =
    Adv.setRight


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> setSelected 0
        --> fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] )

-}
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


{-|

    fromTuple ( [ 6, 6, 5, 4, 4 ], 2, [ 1, 1 ] )
        |> sortKeepIndex
        --> fromTuple ( [ 1, 1, 2, 4, 4 ], 5, [ 6, 6 ] )

-}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> moveToFirst
        |> updateRight List.sort
        |> sortFirstPair_
        |> updateRight List.sort
        |> Adv.moveToIndex identity identity identity identity (position zipper)
        |> Maybe.withDefault zipper


{-|

    ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> fromTuple
        |> toList
        --> [ 1, 2, 3, 4, 5, 6, 7 ]

-}
toList : Zipper a -> List a
toList ( a, b, c ) =
    List.reverse a ++ [ b ] ++ c


{-|

    ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> fromTuple
        |> toTuple
        --> ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )

-}
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


{-|

    fromTuple ( [ "a", "b", "c" ], "d", [ "e", "f", "g" ] )
        |> update (String.join "-" >> List.singleton)
        --> fromTuple ( [ "a-b-c" ], "d", [ "e-f-g" ] )

-}
update : (List a -> List a) -> Zipper a -> Zipper a
update f ( left, selected, right ) =
    ( left |> List.reverse |> f |> List.reverse
    , selected
    , f right
    )


{-|

    fromTuple ( [ "a", "b", "c" ], "d", [ "e", "f", "g" ] )
        |> updateLeft (String.join "-" >> List.singleton)
        --> fromTuple ( [ "a-b-c" ], "d", [ "e", "f", "g" ] )

-}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft =
    Adv.updateLeft


{-|

    fromTuple ( [ "a", "b", "c" ], "d", [ "e", "f", "g" ] )
        |> updateRight (String.join "-" >> List.singleton)
        --> fromTuple ( [ "a", "b", "c" ], "d", [ "e-f-g" ] )

-}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight =
    Adv.updateRight


{-|

    fromTuple ( [ "a", "b", "c" ], "d", [ "e", "f", "g" ] )
        |> updateSelected (String.repeat 3)
        --> fromTuple ( [ "a", "b", "c" ], "ddd", [ "e", "f", "g" ] )

-}
updateSelected : (a -> a) -> Zipper a -> Zipper a
updateSelected =
    Adv.updateSelected
