module Zipper.ListList.Extra exposing
    ( lengthLeft, lengthRight, positionFromEnd
    , getAt, getAtRelative
    , setAt, trySetAt, setAtRelative, trySetAtRelative
    , mapSeparately, mapLeft, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapRight
    , updateSeparately, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative
    , filterSeparately, filterLeft, filterRight, indexedFilterLeft, indexedFilterRight
    , moveLeftUntil, moveRightUntil, moveToN, tryMoveToN
    , sortByKeepIndex, sortWithKeepIndex
    , reverseLeft, reverseRight
    , swap, trySwap
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition


# Create


# To


# Length

@docs lengthLeft, lengthRight, positionFromEnd


# Get

@docs getAt, getAtRelative


# Set

@docs setAt, trySetAt, setAtRelative, trySetAtRelative


# Map

@docs mapSeparately, mapLeft, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapRight


# Update

@docs updateSeparately, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative


# Filter

@docs filterSeparately, filterLeft, filterRight, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeftUntil, moveRightUntil, moveToN, tryMoveToN


# Insert


# Sort

@docs sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverseLeft, reverseRight


# Swap

@docs swap, trySwap


# Indexes

-}

import List.Extra
import Zipper.ListList as Basic exposing (..)
import Zipper.ListList.Advanced as Adv


{-| -}
filterLeft : (a -> Bool) -> Zipper a -> Zipper a
filterLeft f ( left, right ) =
    ( List.filter f left, right )


{-| -}
filterRight : (a -> Bool) -> Zipper a -> Zipper a
filterRight f ( left, right ) =
    ( left, List.filter f right )


{-|

    fromTuple ( [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] )
        |> filterSeparately (\n -> modBy 2 n /= 0) (\n -> modBy 2 n == 0)
        --> fromTuple ( [ 1, 3 ], [ 2, 4 ] )

-}
filterSeparately : (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a
filterSeparately fLeft fRight ( left, right ) =
    ( List.filter fLeft left, List.filter fRight right )


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
getAt i (( left, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem -> ( elem.section, elem ))
    of
        Just ( Left, { rightEdge } ) ->
            List.Extra.getAt rightEdge left

        Just ( Right, { leftEdge } ) ->
            List.Extra.getAt leftEdge right

        Nothing ->
            Nothing


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


{-| -}
indexedFilterLeft : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> ( f i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , right
    )


{-| -}
indexedFilterRight : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| Similar to `indexedMap` except only applied to the left side. Note the slightly different type signature. See [`Zipper.ListList.Advanced.indexedMapLeft`](Zipper.ListList.Advanced.indexedMapLeft) for a function that is capable of `(List a, List a) -> (List b, List a)`
-}
indexedMapLeft : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> f i elem) indexes.left left
    , right
    )


{-| Similar to `indexedMap` except only applied to the right side. Note the slightly different type signature. See [`Zipper.ListList.Advanced.indexedMapRight`](Zipper.ListList.Advanced.indexedMapRight) for a function that is capable of `(List a, List a) -> (List a, List b)`
-}
indexedMapRight : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapRight f (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , List.map2 (\i elem -> f i elem) indexes.right right
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
indexedMapSeparately : (Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b
indexedMapSeparately fLeft fRight (( left, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 fLeft (List.reverse indexes.left) left
    , List.map2 fRight indexes.right right
    )


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

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> mapSeparately ((+) 10) ((+) 20)
        --> fromTuple ( [ 11, 12, 13 ], [ 24, 25 ] )

-}
mapSeparately : (a -> b) -> (a -> b) -> Zipper a -> Zipper b
mapSeparately fLeft fRight ( left, right ) =
    ( List.map fLeft left, List.map fRight right )


{-| -}
moveLeftUntil : (List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity f zipper


{-| -}
moveRightUntil : (List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightUntil f zipper =
    Adv.moveRightUntil identity f zipper


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


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> positionFromEnd
        --> 2

-}
positionFromEnd : Zipper a -> Int
positionFromEnd ( _, right ) =
    List.length right


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, right ) =
    ( List.reverse left, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, right ) =
    ( left, List.reverse right )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAt 2 0
        --> Just (fromTuple ( [ 1, 2, 0 ], [ 4, 5 ] ))

-}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem (( left, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { rightEdge } ) ->
            zipper
                |> updateLeft (List.Extra.setAt rightEdge elem)
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.setAt leftEdge elem)
                |> Just

        Nothing ->
            Nothing


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAtRelative (LeftIndex 1) 0
        --> Just (fromTuple ( [ 1, 0, 3 ], [ 4, 5 ] ))

-}
setAtRelative : RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)
setAtRelative i elem zipper =
    setAt (indexRelativeToAbsolute zipper i) elem zipper


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


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAt 2 0
        --> Just (fromTuple ( [ 1, 2, 0 ], [ 4, 5 ] ))

-}
trySetAt : Int -> a -> Zipper a -> Zipper a
trySetAt i elem zipper =
    setAt i elem zipper
        |> Maybe.withDefault zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5 ] )
        |> setAtRelative (LeftIndex 1) 0
        --> Just (fromTuple ( [ 1, 0, 3 ], [ 4, 5 ] ))

-}
trySetAtRelative : RelativeIndex -> a -> Zipper a -> Zipper a
trySetAtRelative i elem zipper =
    setAtRelative i elem zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAt : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAt i f zipper =
    updateAt i f zipper
        |> Maybe.withDefault zipper


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


{-| Set selection to Nth element
-}
tryMoveToN : Int -> Zipper a -> Zipper a
tryMoveToN n zipper =
    moveToN n zipper
        |> Maybe.withDefault zipper


{-| -}
trySwap : Int -> Int -> Zipper a -> Zipper a
trySwap i j zipper =
    swap i j zipper |> Maybe.withDefault zipper


{-| -}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f (( left, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { leftEdge } ) ->
            zipper
                |> updateLeft (List.Extra.updateAt leftEdge f)
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.updateAt leftEdge f)
                |> Just

        Nothing ->
            Nothing


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
