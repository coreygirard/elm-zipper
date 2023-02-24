module Zipper.ListList exposing
    ( Zipper, RelativeIndex(..), Section(..)
    , empty, fromTuple, fromListAndIndex, fromZipperListElemList, fromZipperListListList
    , toTuple, toList, toZipperListElemList, toZipperListListList
    , length, position
    , getLeft, getRight
    , setLeft, setRight
    , map, Position, indexedMap
    , update
    , filter, indexedFilter
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast
    , insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit
    , sortKeepIndex
    , reverse
    , calcIndex, calcIndexes
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper, RelativeIndex, Section


# Create

@docs empty, fromTuple, fromListAndIndex, fromZipperListElemList, fromZipperListListList


# To

@docs toTuple, toList, toZipperListElemList, toZipperListListList


# Length

@docs length, position


# Get

@docs getLeft, getRight


# Set

@docs setLeft, setRight


# Map

@docs map, IndexMethod, Position, indexedMap


# Update

@docs update


# Filter

@docs filter, indexedFilter


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast


# Insert

@docs insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit


# Sort

@docs sortKeepIndex


# Reverse

@docs reverse


# Swap


# Indexes

@docs calcIndex, calcIndexes

-}

import List.Extra
import Zipper.ListList.Advanced as Adv


{-| -}
type alias Lengths =
    { left : Int, right : Int, total : Int }


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location in various reference frames
-}
type alias Position =
    { first : Int
    , last : Int
    , split : RelativeIndex
    , leftEdge : Int
    , rightEdge : Int
    , section : Section
    }


{-| -}
type RelativeIndex
    = LeftIndex Int
    | RightIndex Int


{-| -}
type Section
    = Left
    | Right


{-| A list type that tracks a split location
-}
type alias Zipper a =
    ( List a, List a )


{-| -}
calcIndex : Zipper a -> Int -> Maybe Position
calcIndex zipper i =
    let
        len =
            calcLengths zipper
    in
    if i >= 0 && i < len.left then
        Just <| calcIndexLeft len i

    else if i >= len.left && i < len.total then
        Just <| calcIndexRight len i

    else
        Nothing


{-| -}
calcIndexLeft : Lengths -> Int -> Position
calcIndexLeft len i =
    { first = i
    , last = len.total - i - 1
    , split = LeftIndex <| len.left - i - 1
    , leftEdge = i
    , rightEdge = len.left - i - 1
    , section = Left
    }


{-| -}
calcIndexRight : Lengths -> Int -> Position
calcIndexRight len i =
    { first = i
    , last = len.total - i - 1
    , split = RightIndex <| i - len.left
    , leftEdge = i - len.left
    , rightEdge = len.total - i - 1
    , section = Right
    }


{-| -}
calcIndexes : Zipper a -> { left : List Position, right : List Position }
calcIndexes (( left, right ) as zipper) =
    let
        len =
            calcLengths zipper
    in
    { left = List.indexedMap (\i _ -> calcIndexLeft len i) left
    , right = List.indexedMap (\i _ -> calcIndexRight len (i + len.left)) right
    }


{-| -}
calcLengths : Zipper a -> Lengths
calcLengths ( left, right ) =
    { left = List.length left
    , right = List.length right
    , total = List.length left + List.length right
    }


{-| Create an empty zipper

    empty --> ( [], [] )

-}
empty : Zipper a
empty =
    ( [], [] )


{-|

    fromTuple ( [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] )
        |> filter (\n -> modBy 2 n == 0)
        --> fromTuple ( [ 2, 4 ], [ 2, 4 ] )

-}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, right ) =
    ( List.filter f left, List.filter f right )


{-| -}
fromListAndIndex : Int -> List a -> Maybe (Zipper a)
fromListAndIndex i elems =
    if i >= 0 && i <= List.length elems then
        Just <| List.Extra.splitAt i elems

    else
        Nothing


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

    fromTuple ( [ 1, 0 ], [ 4, 2, 1, 7, 8 ] )
        |> indexedFilter (\{first} val -> val > first)
        --> fromTuple ( [ 1 ], [ 4, 7, 8 ] )

-}
indexedFilter : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> ( f i elem, elem )) (List.reverse indexes.left) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-|

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap (\{first} _ -> first)
        --> fromTuple ( [ 0, 1 ], [ 2, 3, 4, 5 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap (\{last} _ -> last)
        --> fromTuple ( [ 5, 4 ], [ 3, 2, 1, 0 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap (\{leftEdge} _ -> leftEdge)
        --> fromTuple ( [ 0, 1 ], [ 0, 1, 2, 3 ] )

    fromTuple ( [ 0, 0 ], [ 0, 0, 0, 0 ] )
        |> indexedMap (\{rightEdge} _ -> rightEdge)
        --> fromTuple ( [ 1, 0 ], [ 3, 2, 1, 0 ] )

-}
indexedMap : (Position -> a -> b) -> Zipper a -> Zipper b
indexedMap f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 f (List.reverse indexes.left) left
    , List.map2 f indexes.right right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> insertFirst 0
        --> fromTuple ( [ 0, 1, 2, 3 ], [ 4, 5, 6 ] )

-}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, right ) =
    ( left ++ [ elem ], right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> insertLast 0
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6, 0 ] )

-}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, right ) =
    ( left, right ++ [ elem ] )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> insertLeftOfSplit 0
        --> fromTuple ( [ 1, 2, 3, 0 ], [ 4, 5, 6 ] )

-}
insertLeftOfSplit : a -> Zipper a -> Zipper a
insertLeftOfSplit elem ( left, right ) =
    ( elem :: left, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> insertRightOfSplit 0
        --> fromTuple ( [ 1, 2, 3 ], [ 0, 4, 5, 6 ] )

-}
insertRightOfSplit : a -> Zipper a -> Zipper a
insertRightOfSplit elem ( left, right ) =
    ( left, elem :: right )


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
        |> map String.fromInt
        --> fromTuple ( [ "1", "2", "3" ], [ "4", "5" ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, right ) =
    ( List.map f left, List.map f right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> moveLeft
        --> Just (fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] ))

    fromTuple ( [], [ 4, 5, 6 ] )
        |> moveLeft
        --> Nothing

-}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft ( left, right ) =
    case left of
        head :: tail ->
            Just ( tail, head :: right )

        [] ->
            Nothing


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> moveRight
        --> Just (fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6 ] ))

    fromTuple ( [ 1, 2, 3 ], [] )
        |> moveRight
        --> Nothing

-}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight ( left, right ) =
    case right of
        head :: tail ->
            Just ( head :: left, tail )

        [] ->
            Nothing


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> moveToFirst
        --> fromTuple ( [], [ 1, 2, 3, 4, 5, 6 ] )

-}
moveToFirst : Zipper a -> Zipper a
moveToFirst zipper =
    fromTuple ( [], toList zipper )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> moveToLast
        --> fromTuple ( [ 1, 2, 3, 4, 5, 6 ], [] )

-}
moveToLast : Zipper a -> Zipper a
moveToLast zipper =
    fromTuple ( toList zipper, [] )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> position
        --> 3

-}
position : Zipper a -> Int
position ( left, _ ) =
    List.length left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> reverse
        --> fromTuple ( [ 6, 5, 4 ], [ 3, 2, 1 ] )

-}
reverse : Zipper a -> Zipper a
reverse ( left, right ) =
    ( right, left )


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

    fromTuple ( [ 1, 4, 2 ], [ 2, 3 ] )
        |> sortKeepIndex
        --> fromTuple ( [ 1, 2, 2 ], [ 3, 4 ] )

-}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> moveToFirst
        |> Adv.updateRight List.sort
        |> Adv.moveToN identity identity (position zipper)
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> toList
        --> [ 1, 2, 3, 4, 5, 6 ]

-}
toList : Zipper a -> List a
toList ( left, right ) =
    List.reverse left ++ right


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
        |> tryMoveLeft
        --> fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] )

    fromTuple ( [], [ 4, 5, 6 ] )
        |> tryMoveLeft
        --> fromTuple ( [], [ 4, 5, 6 ] )

-}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    zipper
        |> moveLeft
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ] )
        |> tryMoveRight
        --> fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6 ] )

    fromTuple ( [ 1, 2, 3 ], [] )
        |> tryMoveRight
        --> fromTuple ( [ 1, 2, 3 ], [] )

-}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    zipper
        |> moveRight
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ "a", "b", "c" ], [ "d", "e", "f" ] )
        |> update (String.join "" >> List.repeat 2 >> List.indexedMap Tuple.pair)
        --> fromTuple ( [ ( 0, "abc" ), ( 1, "abc" ) ], [ ( 0, "def" ), ( 1, "def" ) ] )

-}
update : (List a -> List b) -> Zipper a -> Zipper b
update f ( left, right ) =
    ( left |> List.reverse |> f |> List.reverse, f right )
