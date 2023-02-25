module Zipper.ListListList exposing
    ( Zipper, RelativeIndex(..), Position, Section(..), MoveDirection(..)
    , empty, fromTuple, fromZipperListList, fromZipperListElemList
    , toTuple, toList, toZipperListList, toZipperListElemList
    , length, positionLeft, positionRight
    , getLeft, getSelected, getRight
    , setLeft, setSelected, setRight
    , map, indexedMap
    , update, updateLeft, updateSelected, updateRight
    , filter, indexedFilter
    , move, tryMove
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

@docs Zipper, RelativeIndex, Position, Section, MoveDirection


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

@docs move, tryMove


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
type alias Lengths =
    { left : Int
    , selected : Int
    , right : Int
    , leftSelected : Int
    , selectedRight : Int
    , total : Int
    }


{-| -}
type MoveDirection
    = MoveFirst
    | MoveLeft
    | MoveNone
    | MoveRight
    | MoveLast


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


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertFirst 0
        --> fromTuple ( [ 0, 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, selected, right ) =
    ( left ++ [ elem ], selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertLast 0
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9, 0 ] )

-}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, selected, right ) =
    ( left, selected, right ++ [ elem ] )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertLeftOfLeftSplit 0
        --> fromTuple ( [ 1, 2, 3, 0 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
insertLeftOfLeftSplit : a -> Zipper a -> Zipper a
insertLeftOfLeftSplit elem ( left, selected, right ) =
    ( [ elem ] ++ left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertLeftOfRightSplit 0
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6, 0 ], [ 7, 8, 9 ] )

-}
insertLeftOfRightSplit : a -> Zipper a -> Zipper a
insertLeftOfRightSplit elem ( left, selected, right ) =
    ( left, selected ++ [ elem ], right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertRightOfLeftSplit 0
        --> fromTuple ( [ 1, 2, 3 ], [ 0, 4, 5, 6 ], [ 7, 8, 9 ] )

-}
insertRightOfLeftSplit : a -> Zipper a -> Zipper a
insertRightOfLeftSplit elem ( left, selected, right ) =
    ( left, [ elem ] ++ selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> insertRightOfRightSplit 0
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 0, 7, 8, 9 ] )

-}
insertRightOfRightSplit : a -> Zipper a -> Zipper a
insertRightOfRightSplit elem ( left, selected, right ) =
    ( left, selected, [ elem ] ++ right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> length
        --> 9

-}
length : Zipper a -> Int
length ( left, selected, right ) =
    List.length left + List.length selected + List.length right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> map ((+) 10)
        --> fromTuple ( [ 11, 12, 13 ], [ 14, 15, 16 ], [ 17, 18, 19 ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, selected, right ) =
    ( List.map f left
    , List.map f selected
    , List.map f right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> move MoveLeft MoveLast
        --> Just (fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6, 7, 8, 9 ], [] ))

-}
move : MoveDirection -> MoveDirection -> Zipper a -> Maybe (Zipper a)
move leftDir rightDir (( left, selected, right ) as zipper) =
    let
        leftR =
            List.reverse left
    in
    case ( leftDir, rightDir ) of
        ( MoveNone, _ ) ->
            ( selected, right )
                |> moveHelperPair rightDir
                |> Maybe.map (\( b, c ) -> ( left, b, c ))

        ( _, MoveNone ) ->
            ( leftR, selected )
                |> moveHelperPair leftDir
                |> Maybe.map (\( a, b ) -> ( List.reverse a, b, right ))

        ( MoveFirst, _ ) ->
            ( leftR ++ selected, right )
                |> moveHelperPair rightDir
                |> Maybe.map (\( b, c ) -> ( [], b, c ))

        ( MoveLeft, _ ) ->
            case List.Extra.unconsLast leftR of
                Just ( last, rest ) ->
                    ( last :: selected, right )
                        |> moveHelperPair rightDir
                        |> Maybe.map (\( b, c ) -> ( List.reverse rest, b, c ))

                Nothing ->
                    Nothing

        ( _, MoveRight ) ->
            case right of
                head :: tail ->
                    ( leftR, selected ++ [ head ] )
                        |> moveHelperPair leftDir
                        |> Maybe.map (\( a, b ) -> ( List.reverse a, b, tail ))

                [] ->
                    Nothing

        ( _, MoveLast ) ->
            ( leftR, selected ++ right )
                |> moveHelperPair leftDir
                |> Maybe.map (\( a, b ) -> ( List.reverse a, b, [] ))

        ( MoveRight, MoveLeft ) ->
            case
                selected
                    |> List.Extra.uncons
                    |> Maybe.map (Tuple.mapSecond List.Extra.unconsLast)
            of
                Just ( head, Just ( last, rest ) ) ->
                    Just ( head :: left, rest, last :: right )

                _ ->
                    Nothing

        ( MoveRight, MoveFirst ) ->
            case selected of
                head :: tail ->
                    Just ( leftR ++ [ head ] |> List.reverse, [], tail ++ right )

                [] ->
                    Nothing

        ( MoveLast, MoveLeft ) ->
            case List.Extra.unconsLast selected of
                Just ( last, rest ) ->
                    Just ( leftR ++ rest |> List.reverse, [], last :: right )

                Nothing ->
                    Nothing

        ( MoveLast, MoveFirst ) ->
            Nothing


moveHelperPair : MoveDirection -> ( List a, List a ) -> Maybe ( List a, List a )
moveHelperPair dir ( left, right ) =
    case dir of
        MoveFirst ->
            Just ( [], left ++ right )

        MoveLeft ->
            case List.Extra.unconsLast left of
                Just ( last, rest ) ->
                    Just ( rest, last :: right )

                Nothing ->
                    Nothing

        MoveNone ->
            Just ( left, right )

        MoveRight ->
            case right of
                head :: tail ->
                    Just ( left ++ [ head ], tail )

                [] ->
                    Nothing

        MoveLast ->
            Just ( left ++ right, [] )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> positionLeft
        --> 3

-}
positionLeft : Zipper a -> Int
positionLeft ( left, _, _ ) =
    List.length left


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> positionRight
        --> 6

-}
positionRight : Zipper a -> Int
positionRight ( left, selected, _ ) =
    List.length left + List.length selected


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> reverse
        --> fromTuple ( [ 9, 8, 7 ], [ 6, 5, 4 ], [ 3, 2, 1 ] )

-}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( right, List.reverse selected, left )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> setLeft [ 11, 12, 13 ]
        --> fromTuple ( [ 11, 12, 13 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, selected, right ) =
    ( List.reverse left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> setRight [ 17, 18, 19 ]
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 17, 18, 19 ] )

-}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, selected, _ ) =
    ( left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> setSelected [ 14, 15, 16 ]
        --> fromTuple ( [ 1, 2, 3 ], [ 14, 15, 16 ], [ 7, 8, 9 ] )

-}
setSelected : List a -> Zipper a -> Zipper a
setSelected selected ( left, _, right ) =
    ( left, selected, right )


{-| -}
sortKeepIndexes : Zipper comparable -> Zipper comparable
sortKeepIndexes zipper =
    zipper
        |> move MoveFirst MoveFirst
        |> Maybe.withDefault zipper
        |> updateRight List.sort
        |> Adv.moveToIndex identity identity identity identity (positionLeft zipper) (positionRight zipper)
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> toList
        --> [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

-}
toList : Zipper a -> List a
toList ( left, selected, right ) =
    List.reverse left ++ selected ++ right


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> toTuple
        --> ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

-}
toTuple : Zipper a -> ( List a, List a, List a )
toTuple ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> toZipperListElemList List.sum
        --> ( [ 3, 2, 1 ], 15, [ 7, 8, 9 ] )

-}
toZipperListElemList : (List a -> a) -> Zipper a -> ( List a, a, List a )
toZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> toZipperListList
        --> ( [ 3, 2, 1 ], [ 7, 8, 9 ] )

-}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList ( left, _, right ) =
    ( left, right )


{-| -}
tryMove : MoveDirection -> MoveDirection -> Zipper a -> Zipper a
tryMove leftDir rightDir zipper =
    move leftDir rightDir zipper
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> update (\elems -> 0 :: elems)
        --> fromTuple ( [ 0, 1, 2, 3 ], [ 0, 4, 5, 6 ], [ 0, 7, 8, 9 ] )

-}
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


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> updateRight (\elems -> 0 :: elems)
        --> fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 0, 7, 8, 9 ] )

-}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, selected, right ) =
    ( left, selected, fRight right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> updateSelected (\elems -> 0 :: elems)
        --> fromTuple ( [ 1, 2, 3 ], [ 0, 4, 5, 6 ], [ 7, 8, 9 ] )

-}
updateSelected : (List a -> List a) -> Zipper a -> Zipper a
updateSelected fSelected ( left, selected, right ) =
    ( left, fSelected selected, right )
