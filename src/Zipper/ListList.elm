module Zipper.ListList exposing
    ( Zipper, RelativeIndex(..)
    , empty, fromTuple, fromListAndIndex, fromZipperListElemList, fromZipperListListList
    , toTuple, toList, toZipperListElemList, toZipperListListList
    , length, position
    , getLeft, getRight
    , setLeft, setRight
    , map, IndexMethod(..), Position(..), indexedMap
    , update
    , filter, indexedFilter
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast
    , insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit
    , sortKeepIndex
    , reverse
    , Dists, indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRanges
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper, RelativeIndex


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
    if i >= 0 && i < List.length elems then
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
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, right ) =
    ( left ++ [ elem ], right )


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


{-| -}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft ( left, right ) =
    case left of
        head :: tail ->
            Just ( tail, head :: right )

        [] ->
            Nothing


{-| -}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight ( left, right ) =
    case right of
        head :: tail ->
            Just ( head :: left, tail )

        [] ->
            Nothing


{-| Set selection to first element
-}
moveToFirst : Zipper a -> Zipper a
moveToFirst zipper =
    fromTuple ( toList zipper, [] )


{-| Set selection to last element
-}
moveToLast : Zipper a -> Zipper a
moveToLast zipper =
    fromTuple ( [], toList zipper )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> position
        --> 3

-}
position : Zipper a -> Int
position ( left, _ ) =
    List.length left


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, right ) =
    ( List.reverse right, List.reverse left )


{-| -}
relativeIndexToPosDists : Zipper a -> RelativeIndex -> Maybe ( Position, Dists )
relativeIndexToPosDists zipper i =
    absoluteIndexToPosDists
        zipper
        (indexRelativeToAbsolute zipper i)


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


{-| -}
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


{-| -}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    zipper
        |> moveLeft
        |> Maybe.withDefault zipper


{-| -}
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
