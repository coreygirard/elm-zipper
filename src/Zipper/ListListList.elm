module Zipper.ListListList exposing
    ( Zipper, RelativeIndex(..), Dists, Position, Section(..)
    , empty, fromTuple, fromZipperListList, fromZipperListElemList
    , toTuple, toList, toZipperListList, toZipperListElemList
    , length, positionLeft, positionRight
    , getLeft, getSelected, getRight
    , setLeft, setSelected, setRight
    , map, indexedMap
    , update, updateLeft, updateSelected, updateRight
    , filter, indexedFilter
    , moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight, moveBothToFirst, moveLeftToFirst, moveBothToLast, moveRightToLast
    , insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit
    , reverse
    , sortKeepIndexes
    , calcIndexes, calcIndex, calcIndexLeft, calcIndexSelected, calcIndexRight, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringStringString`](Zipper.StringStringString)

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper, RelativeIndex, Dists, Position, Indexes, Section


# Create

@docs empty, fromTuple, fromZipperListList, fromZipperListElemList


# To

@docs toTuple, toList, toZipperListList, toZipperListElemList


# Length

@docs length, positionLeft, positionRight


# Get

@docs getLeft, getSelected, getRight


# Set

@docs setLeft, setSelected, setRight


# Map

@docs map, indexedMap


# Update

@docs update, updateLeft, updateSelected, updateRight


# Filter

@docs filter, indexedFilter


# Move

@docs moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight, moveBothToFirst, moveLeftToFirst, moveBothToLast, moveRightToLast


# Insert

@docs insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit


# Reverse

@docs reverse


# Swap


# Sort

@docs sortKeepIndexes


# Indexes

@docs calcIndexes, calcIndex, calcIndexLeft, calcIndexSelected, calcIndexRight, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute

-}

import List.Extra
import Zipper.ListListList.Advanced as Adv


{-| -}
type alias Dists =
    { fromLeft : Int, fromRight : Int }


{-| -}
type alias Lengths =
    { left : Int, selected : Int, right : Int, leftSelected : Int, selectedRight : Int, total : Int }


{-| -}
type alias Position =
    { first : Int
    , last : Int
    , leftSplit : RelativeIndex
    , rightSplit : RelativeIndex
    , leftEdge : Int
    , rightEdge : Int
    , section : Section
    }


{-| -}
type RelativeIndex
    = LeftIndex Int
    | RightIndex Int


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Section
    = Left
    | Selected
    | Right


{-| A list type that tracks two split locations
-}
type alias Zipper a =
    ( List a, List a, List a )


{-| -}
calcIndex : Zipper a -> Int -> Maybe Position
calcIndex zipper i =
    let
        len =
            calcLengths zipper
    in
    if i >= 0 && i < len.left then
        Just <| calcIndexLeft len i

    else if i >= len.left && i < len.leftSelected then
        Just <| calcIndexSelected len i

    else if i >= len.leftSelected && i < len.total then
        Just <| calcIndexRight len i

    else
        Nothing


{-| -}
calcIndexLeft : Lengths -> Int -> Position
calcIndexLeft len i =
    { first = i
    , last = len.total - i - 1
    , leftSplit = LeftIndex <| len.left - i - 1
    , rightSplit = LeftIndex <| len.leftSelected - i - 1
    , leftEdge = i
    , rightEdge = len.left - i - 1
    , section = Left
    }


{-| -}
calcIndexSelected : Lengths -> Int -> Position
calcIndexSelected len i =
    { first = i
    , last = len.total - i - 1
    , leftSplit = RightIndex <| i - len.left
    , rightSplit = LeftIndex <| len.leftSelected - i - 1
    , leftEdge = i - len.left
    , rightEdge = len.leftSelected - i - 1
    , section = Selected
    }


{-| -}
calcIndexRight : Lengths -> Int -> Position
calcIndexRight len i =
    { first = i
    , last = len.total - i - 1
    , leftSplit = RightIndex <| i - len.left
    , rightSplit = RightIndex <| i - len.leftSelected
    , leftEdge = i - len.leftSelected
    , rightEdge = len.total - i - 1
    , section = Right
    }


{-| -}
calcIndexes : Zipper a -> { left : List Position, selected : List Position, right : List Position }
calcIndexes (( left, selected, right ) as zipper) =
    let
        len =
            calcLengths zipper
    in
    { left = List.indexedMap (\i _ -> calcIndexLeft len i) left
    , selected = List.indexedMap (\i _ -> calcIndexSelected len (i + len.left)) selected
    , right = List.indexedMap (\i _ -> calcIndexRight len (i + len.leftSelected)) right
    }


{-| -}
calcLengths : Zipper a -> Lengths
calcLengths ( left, selected, right ) =
    { left = List.length left
    , selected = List.length selected
    , right = List.length right
    , total = List.length left + List.length selected + List.length right
    , leftSelected = List.length left + List.length selected
    , selectedRight = List.length selected + List.length right
    }


{-| Create an empty zipper

    empty --> ( [], [], [] )

-}
empty : Zipper a
empty =
    ( [], [], [] )


{-|

    fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6, 7, 8 ], [ 9, 10, 11, 12 ] )
        |> filter (modBy 2 >> (==) 0)
        --> fromTuple ( [ 2, 4 ], [ 6, 8 ], [ 10, 12 ] )

-}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, selected, right ) =
    ( List.filter f left
    , List.filter f selected
    , List.filter f right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        --> ( [ 3, 2, 1 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
fromTuple : ( List a, List a, List a ) -> Zipper a
fromTuple ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-|

    ( [ 3, 2, 1 ], 5, [ 7, 8, 9 ] )
    |> fromZipperListElemList (\n -> [4, n, 6])
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
fromZipperListElemList : (a -> List a) -> ( List a, a, List a ) -> Zipper a
fromZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-|

    ( [ 3, 2, 1 ], [ 7, 8, 9 ] )
    |> fromZipperListList [4, 5, 6]
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
fromZipperListList : List a -> ( List a, List a ) -> Zipper a
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> getLeft
        --> [ 1, 2, 3 ]

-}
getLeft : Zipper a -> List a
getLeft ( left, _, _ ) =
    List.reverse left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> getRight
        --> [ 7, 8, 9 ]

-}
getRight : Zipper a -> List a
getRight ( _, _, right ) =
    right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> getSelected
        --> [ 4, 5, 6 ]

-}
getSelected : Zipper a -> List a
getSelected ( _, selected, _ ) =
    selected


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\{ section, rightEdge } val -> section == Left || rightEdge == 0 || val == 7)
        --> fromTuple ( [ 1, 2, 3 ], [ 6 ], [ 7, 9 ] )

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\{ leftEdge, rightEdge } val -> leftEdge == 0 || rightEdge == 0)
        --> fromTuple ( [ 1, 3 ], [ 4, 6 ], [ 7, 9 ] )

-}
indexedFilter : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> ( f i elem, elem )) (List.reverse indexes.left) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.selected selected
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedMap (\{ first, leftEdge } val -> first * 100 + leftEdge * 10 + val)
        --> fromTuple ( [ 1, 112, 223 ], [ 304, 415, 526 ], [ 607, 718, 829 ] )

-}
indexedMap : (Position -> a -> b) -> Zipper a -> Zipper b
indexedMap f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 f (List.reverse indexes.left) left
    , List.map2 f indexes.selected selected
    , List.map2 f indexes.right right
    )


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeLeftToAbsolute zipper (LeftIndex 2) --> 0

    indexRelativeLeftToAbsolute zipper (LeftIndex 0) --> 2

    indexRelativeLeftToAbsolute zipper (RightIndex 0) --> 3

    indexRelativeLeftToAbsolute zipper (RightIndex 2) --> 5

    indexRelativeLeftToAbsolute zipper (RightIndex 3) --> 6

    indexRelativeLeftToAbsolute zipper (RightIndex 5) --> 8

-}
indexRelativeLeftToAbsolute : Zipper a -> RelativeIndex -> Int
indexRelativeLeftToAbsolute ( left, _, _ ) i =
    let
        position =
            List.length left
    in
    case i of
        LeftIndex i_ ->
            position - i_ - 1

        RightIndex i_ ->
            position + i_


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeRightToAbsolute zipper (LeftIndex 5) --> 0

    indexRelativeRightToAbsolute zipper (LeftIndex 3) --> 2

    indexRelativeRightToAbsolute zipper (LeftIndex 2) --> 3

    indexRelativeRightToAbsolute zipper (LeftIndex 0) --> 5

    indexRelativeRightToAbsolute zipper (RightIndex 0) --> 6

    indexRelativeRightToAbsolute zipper (RightIndex 2) --> 8

-}
indexRelativeRightToAbsolute : Zipper a -> RelativeIndex -> Int
indexRelativeRightToAbsolute ( left, selected, _ ) i =
    let
        position =
            List.length left + List.length selected
    in
    case i of
        LeftIndex i_ ->
            position - i_ - 1

        RightIndex i_ ->
            position + i_


{-| -}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, selected, right ) =
    ( left ++ [ elem ], selected, right )


{-| -}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, selected, right ) =
    ( left, selected, right ++ [ elem ] )


{-| -}
insertLeftOfLeftSplit : a -> Zipper a -> Zipper a
insertLeftOfLeftSplit elem ( left, selected, right ) =
    ( [ elem ] ++ left, selected, right )


{-| -}
insertLeftOfRightSplit : a -> Zipper a -> Zipper a
insertLeftOfRightSplit elem ( left, selected, right ) =
    ( left, selected ++ [ elem ], right )


{-| -}
insertRightOfLeftSplit : a -> Zipper a -> Zipper a
insertRightOfLeftSplit elem ( left, selected, right ) =
    ( left, [ elem ] ++ selected, right )


{-| -}
insertRightOfRightSplit : a -> Zipper a -> Zipper a
insertRightOfRightSplit elem ( left, selected, right ) =
    ( left, selected, [ elem ] ++ right )


{-| -}
length : Zipper a -> Int
length ( left, selected, right ) =
    List.length left + List.length selected + List.length right


{-| -}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, selected, right ) =
    ( List.map f left
    , List.map f selected
    , List.map f right
    )


{-| -}
moveBothToFirst : Zipper a -> Zipper a
moveBothToFirst zipper =
    fromTuple ( toList zipper, [], [] )


{-| -}
moveBothToLast : Zipper a -> Zipper a
moveBothToLast zipper =
    fromTuple ( [], [], toList zipper )


{-| -}
moveLeftToFirst : Zipper a -> Zipper a
moveLeftToFirst zipper =
    fromTuple ( toList zipper, [], [] )


{-| Attempt to move left edge of selection to left

    fromTuple ( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Just (fromTuple ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] ))

    fromTuple ( [], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Nothing

-}
moveLeftToLeft : Zipper a -> Maybe (Zipper a)
moveLeftToLeft zipper =
    Adv.moveLeftToLeft identity zipper


{-| -}
moveLeftToRight : Zipper a -> Zipper a
moveLeftToRight zipper =
    zipper


{-| -}
moveRightToLast : Zipper a -> Zipper a
moveRightToLast zipper =
    fromTuple ( [], [], toList zipper )


{-| -}
moveRightToLeft : Zipper a -> Zipper a
moveRightToLeft zipper =
    zipper


{-| -}
moveRightToRight : Zipper a -> Zipper a
moveRightToRight zipper =
    zipper


{-| -}
positionLeft : Zipper a -> Int
positionLeft ( left, _, _ ) =
    List.length left


{-| -}
positionRight : Zipper a -> Int
positionRight ( left, selected, _ ) =
    List.length left + List.length selected


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( List.reverse right, selected, List.reverse left )


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, selected, _ ) =
    ( left, selected, right )


{-| -}
setSelected : List a -> Zipper a -> Zipper a
setSelected selected ( left, _, right ) =
    ( left, selected, right )


{-| -}
sortKeepIndexes : Zipper comparable -> Zipper comparable
sortKeepIndexes zipper =
    zipper
        |> moveBothToFirst
        |> updateRight List.sort
        |> Adv.moveToIndex identity identity identity identity (positionLeft zipper) (positionRight zipper)
        |> Maybe.withDefault zipper


{-| -}
toList : Zipper a -> List a
toList ( left, selected, right ) =
    List.reverse left ++ selected ++ right


{-| -}
toTuple : Zipper a -> ( List a, List a, List a )
toTuple ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
toZipperListElemList : (List a -> a) -> Zipper a -> ( List a, a, List a )
toZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList ( left, _, right ) =
    ( left, right )


{-| -}
tryMoveLeftToLeft : Zipper a -> Zipper a
tryMoveLeftToLeft zipper =
    zipper


{-| -}
tryMoveLeftToRight : Zipper a -> Zipper a
tryMoveLeftToRight zipper =
    zipper


{-| -}
tryMoveRightToLeft : Zipper a -> Zipper a
tryMoveRightToLeft zipper =
    zipper


{-| -}
tryMoveRightToRight : Zipper a -> Zipper a
tryMoveRightToRight zipper =
    zipper


{-| -}
update : (List a -> List b) -> Zipper a -> Zipper b
update f ( left, selected, right ) =
    ( left |> List.reverse |> f |> List.reverse, f selected, f right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> updateLeft (\elems -> 0 :: elems)
        --> fromTuple ( [ 0, 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft fLeft ( left, selected, right ) =
    ( left |> List.reverse |> fLeft |> List.reverse, selected, right )


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, selected, right ) =
    ( left, selected, fRight right )


{-| -}
updateSelected : (List a -> List a) -> Zipper a -> Zipper a
updateSelected fSelected ( left, selected, right ) =
    ( left, fSelected selected, right )
