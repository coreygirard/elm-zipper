module Zipper.ListElemList exposing
    ( Zipper, Position, Lengths, Section(..)
    , singleton, fromTuple, fromListAndIndex, fromZipperListList, fromZipperListListList
    , toTuple, toList, toZipperListList, toZipperListListList
    , length, lengthLeft, lengthRight, position
    , getFirst, getLeft, getSelected, getRight, getLast
    , setFirst, setLeft, setSelected, setRight, setLast
    , map, indexedMap
    , update, updateLeft, updateSelected, updateRight
    , filter, indexedFilter
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast
    , insertFirst, insertLast, insertLeftOfSelected, insertRightOfSelected
    , sortKeepElem, sortKeepIndex
    , reverse
    , calcIndex, calcIndexes, indexRelativeToAbsolute
    )

{-| A special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced) where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringCharString`](Zipper.StringCharString)

  - Special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced)
  - General case of [`Zipper.StringCharString`](Zipper.StringCharString)


# Definition

@docs Zipper, Position, Lengths, Section


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

@docs map, indexedMap


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

@docs calcIndex, calcIndexes, indexRelativeToAbsolute

-}

import List.Extra
import Zipper.ListElemList.Advanced as Adv


{-| -}
type alias Lengths =
    { left : Int
    , right : Int
    , leftSelected : Int
    , selectedRight : Int
    , total : Int
    }


{-| -}
type alias Position =
    { first : Int
    , last : Int
    , selection : Int
    , leftEdge : Int
    , rightEdge : Int
    , section : Section
    }


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Section
    = Left
    | Selected
    | Right


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, a, List a )


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
    , selection = i - len.left
    , leftEdge = i
    , rightEdge = len.left - i - 1
    , section = Left
    }


{-| -}
calcIndexSelected : Lengths -> Int -> Position
calcIndexSelected len i =
    { first = i
    , last = len.total - i - 1
    , selection = i - len.left
    , leftEdge = i - len.left
    , rightEdge = len.leftSelected - i - 1
    , section = Selected
    }


{-| -}
calcIndexRight : Lengths -> Int -> Position
calcIndexRight len i =
    { first = i
    , last = len.total - i - 1
    , selection = i - len.left
    , leftEdge = i - len.leftSelected
    , rightEdge = len.total - i - 1
    , section = Right
    }


{-| -}
calcIndexes : Zipper a -> { left : List Position, selected : Position, right : List Position }
calcIndexes (( left, selected, right ) as zipper) =
    let
        len =
            calcLengths zipper
    in
    { left = List.indexedMap (\i _ -> calcIndexLeft len i) left
    , selected = calcIndexSelected len len.left
    , right = List.indexedMap (\i _ -> calcIndexRight len (i + len.leftSelected)) right
    }


{-| -}
calcLengths : Zipper a -> Lengths
calcLengths ( left, selected, right ) =
    { left = List.length left
    , right = List.length right
    , total = List.length left + 1 + List.length right
    , leftSelected = List.length left + 1
    , selectedRight = 1 + List.length right
    }


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

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedFilter (\{ section, rightEdge } val -> section == Selected || rightEdge == 0 || val == 6)
        --> fromTuple ( [ 3 ], 4, [ 6, 7 ] )

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedFilter (\{ leftEdge, rightEdge } val -> leftEdge == 0 || rightEdge == 0)
        --> fromTuple ( [ 1, 3 ], 4, [ 5, 7 ] )

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
    , selected
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedMap (\{ leftEdge } val -> (leftEdge + 1) * 10 + val)
        --> fromTuple ( [ 11, 22, 33 ], 14, [ 15, 26, 37 ] )

-}
indexedMap : (Position -> a -> b) -> Zipper a -> Zipper b
indexedMap f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> f i elem) (List.reverse indexes.left) left
    , f indexes.selected selected
    , List.map2 (\i elem -> f i elem) indexes.right right
    )


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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> position
        --> 3

-}
position : Zipper a -> Int
position =
    Adv.position


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
