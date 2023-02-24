module Zipper.ListListList.Extra exposing
    ( lengthLeft, lengthSelected, lengthRight, positionLeftFromEnd, positionRightFromEnd
    , getAt, getAtRelativeLeft, getAtRelativeRight
    , setAt, trySetAt, setAtRelativeLeft, trySetAtRelativeLeft, setAtRelativeRight, trySetAtRelativeRight
    , mapSeparately, mapLeft, mapSelected, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapSelected, indexedMapRight
    , updateSeparately, updateAt, tryUpdateAt, updateAtRelativeLeft, tryUpdateAtRelativeLeft, updateAtRelativeRight, tryUpdateAtRelativeRight
    , filterSeparately, filterLeft, filterSelected, filterRight, indexedFilterLeft, indexedFilterSelected, indexedFilterRight
    , moveToN, tryMoveToN, moveLeftToLeftUntil, moveLeftToRightUntil, moveRightToLeftUntil, moveRightToRightUntil
    , reverseLeft, reverseSelected, reverseRight
    , swap
    , sortByKeepIndexes, sortWithKeepIndexes
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringStringString`](Zipper.StringStringString)

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition


# Create


# To


# Length

@docs lengthLeft, lengthSelected, lengthRight, positionLeftFromEnd, positionRightFromEnd


# Get

@docs getAt, getAtRelativeLeft, getAtRelativeRight


# Set

@docs setAt, trySetAt, setAtRelativeLeft, trySetAtRelativeLeft, setAtRelativeRight, trySetAtRelativeRight


# Map

@docs mapSeparately, mapLeft, mapSelected, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapSelected, indexedMapRight


# Update

@docs updateSeparately, updateAt, tryUpdateAt, updateAtRelativeLeft, tryUpdateAtRelativeLeft, updateAtRelativeRight, tryUpdateAtRelativeRight


# Filter

@docs filterSeparately, filterLeft, filterSelected, filterRight, indexedFilterLeft, indexedFilterSelected, indexedFilterRight


# Move

@docs moveToN, tryMoveToN, moveLeftToLeftUntil, moveLeftToRightUntil, moveRightToLeftUntil, moveRightToRightUntil


# Insert


# Reverse

@docs reverseLeft, reverseSelected, reverseRight


# Swap

@docs swap


# Sort

@docs sortByKeepIndexes, sortWithKeepIndexes


# Indexes

-}

import List.Extra
import Zipper.ListListList as Basic exposing (..)
import Zipper.ListListList.Advanced as Adv


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
filterSelected : (a -> Bool) -> Zipper a -> Zipper a
filterSelected f ( left, selected, right ) =
    ( left
    , List.filter f selected
    , right
    )


{-| -}
filterSeparately : (a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a
filterSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( List.filter fLeft left
    , List.filter fSelected selected
    , List.filter fRight right
    )


{-| -}
getAt : Int -> Zipper a -> Maybe a
getAt i (( left, selected, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem -> ( elem.section, elem ))
    of
        Just ( Left, { rightEdge } ) ->
            List.Extra.getAt rightEdge left

        Just ( Selected, { leftEdge } ) ->
            List.Extra.getAt leftEdge selected

        Just ( Right, { leftEdge } ) ->
            List.Extra.getAt leftEdge right

        Nothing ->
            Nothing


{-| -}
getAtRelativeLeft : RelativeIndex -> Zipper a -> Maybe a
getAtRelativeLeft i zipper =
    indexRelativeLeftToAbsolute zipper i
        |> calcIndex zipper
        |> Maybe.map .first
        |> Maybe.andThen (\i_ -> getAt i_ zipper)


{-|

    zipper : Zipper Int
    zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

    zipper |> getAtRelativeRight (LeftIndex 6) --> Nothing

    zipper |> getAtRelativeRight (LeftIndex 5) --> Just 1

    zipper |> getAtRelativeRight (LeftIndex 3) --> Just 3

    zipper |> getAtRelativeRight (LeftIndex 2) --> Just 4

    zipper |> getAtRelativeRight (LeftIndex 0) --> Just 6

    zipper |> getAtRelativeRight (RightIndex 0) --> Just 7

    zipper |> getAtRelativeRight (RightIndex 2) --> Just 9

    zipper |> getAtRelativeRight (RightIndex 3) --> Nothing

-}
getAtRelativeRight : RelativeIndex -> Zipper a -> Maybe a
getAtRelativeRight i zipper =
    getAt (indexRelativeRightToAbsolute zipper i) zipper


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\pos { rightEdge } val -> pos == Left || rightEdge == 0 || val == 7)
        --> fromTuple ( [ 1, 2, 3 ], [ 6 ], [ 7, 9 ] )

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\_ { leftEdge, rightEdge } val -> leftEdge == 0 || rightEdge == 0)
        --> fromTuple ( [ 1, 3 ], [ 4, 6 ], [ 7, 9 ] )

-}
indexedFilterLeft : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> ( f i elem, elem )) (List.reverse indexes.left) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\pos { rightEdge } val -> pos == Left || rightEdge == 0 || val == 7)
        --> fromTuple ( [ 1, 2, 3 ], [ 6 ], [ 7, 9 ] )

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\_ { leftEdge, rightEdge } val -> leftEdge == 0 || rightEdge == 0)
        --> fromTuple ( [ 1, 3 ], [ 4, 6 ], [ 7, 9 ] )

-}
indexedFilterRight : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , selected
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\pos { rightEdge } val -> pos == Left || rightEdge == 0 || val == 7)
        --> fromTuple ( [ 1, 2, 3 ], [ 6 ], [ 7, 9 ] )

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedFilter (\_ { leftEdge, rightEdge } val -> leftEdge == 0 || rightEdge == 0)
        --> fromTuple ( [ 1, 3 ], [ 4, 6 ], [ 7, 9 ] )

-}
indexedFilterSelected : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterSelected f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , List.map2 (\i elem -> ( f i elem, elem )) indexes.selected selected
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedMap (\_ { first, leftEdge } val -> first * 100 + leftEdge * 10 + val)
        --> fromTuple ( [ 1, 112, 223 ], [ 304, 415, 526 ], [ 607, 718, 829 ] )

-}
indexedMapLeft : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 f (List.reverse indexes.left) left
    , selected
    , right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedMap (\_ { first, leftEdge } val -> first * 100 + leftEdge * 10 + val)
        --> fromTuple ( [ 1, 112, 223 ], [ 304, 415, 526 ], [ 607, 718, 829 ] )

-}
indexedMapRight : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapRight f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , selected
    , List.map2 f indexes.right right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedMap (\_ { first, leftEdge } val -> first * 100 + leftEdge * 10 + val)
        --> fromTuple ( [ 1, 112, 223 ], [ 304, 415, 526 ], [ 607, 718, 829 ] )

-}
indexedMapSelected : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapSelected f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , List.map2 f indexes.selected selected
    , right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
        |> indexedMap (\_ { first, leftEdge } val -> first * 100 + leftEdge * 10 + val)
        --> fromTuple ( [ 1, 112, 223 ], [ 304, 415, 526 ], [ 607, 718, 829 ] )

-}
indexedMapSeparately : (Position -> a -> b) -> (Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b
indexedMapSeparately fLeft fSelected fRight (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 fLeft (List.reverse indexes.left) left
    , List.map2 fSelected indexes.selected selected
    , List.map2 fRight indexes.right right
    )


{-| -}
lengthLeft : Zipper a -> Int
lengthLeft ( left, _, _ ) =
    List.length left


{-| -}
lengthRight : Zipper a -> Int
lengthRight ( _, _, right ) =
    List.length right


{-| -}
lengthSelected : Zipper a -> Int
lengthSelected ( _, selected, _ ) =
    List.length selected


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft f ( left, selected, right ) =
    ( List.map f left, selected, right )


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight f ( left, selected, right ) =
    ( left, selected, List.map f right )


{-| -}
mapSelected : (a -> a) -> Zipper a -> Zipper a
mapSelected f ( left, selected, right ) =
    ( left, List.map f selected, right )


{-| -}
mapSeparately : (a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b
mapSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( List.map fLeft left
    , List.map fSelected selected
    , List.map fRight right
    )


{-| -}
moveLeftToLeftUntil : (List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftToLeftUntil f zipper =
    Adv.moveLeftToLeftUntil identity f zipper


{-| -}
moveLeftToRightUntil : (List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftToRightUntil f zipper =
    Adv.moveLeftToRightUntil identity f zipper


{-| -}
moveRightToLeftUntil : (List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightToLeftUntil f zipper =
    Adv.moveRightToLeftUntil identity f zipper


{-| -}
moveRightToRightUntil : (List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightToRightUntil f zipper =
    Adv.moveRightToRightUntil identity f zipper


{-| -}
moveToN : Int -> Int -> Zipper a -> Maybe (Zipper a)
moveToN i j zipper =
    Nothing


{-| -}
positionLeftFromEnd : Zipper a -> Int
positionLeftFromEnd ( _, selected, right ) =
    List.length selected + List.length right


{-| -}
positionRightFromEnd : Zipper a -> Int
positionRightFromEnd ( _, _, right ) =
    List.length right


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, selected, right ) =
    ( left, selected, List.reverse right )


{-| -}
reverseSelected : Zipper a -> Zipper a
reverseSelected ( left, selected, right ) =
    ( left, List.reverse selected, right )


{-| -}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem (( left, selected, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { rightEdge } ) ->
            zipper
                |> updateLeft (List.Extra.setAt rightEdge elem)
                |> Just

        Just ( Selected, { leftEdge } ) ->
            zipper
                |> updateSelected (List.Extra.setAt leftEdge elem)
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.setAt leftEdge elem)
                |> Just

        Nothing ->
            Nothing


{-| -}
setAtRelativeLeft : RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)
setAtRelativeLeft i elem zipper =
    setAt (indexRelativeLeftToAbsolute zipper i) elem zipper


{-| -}
setAtRelativeRight : RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)
setAtRelativeRight i elem zipper =
    setAt (indexRelativeRightToAbsolute zipper i) elem zipper


{-| -}
sortByKeepIndexes : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepIndexes f zipper =
    zipper
        |> moveBothToFirst
        |> updateRight (List.sortBy f)
        |> moveToN (positionLeft zipper) (positionRight zipper)
        |> Maybe.withDefault zipper


{-| -}
sortWithKeepIndexes : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepIndexes f zipper =
    zipper
        |> moveBothToFirst
        |> updateRight (List.sortWith f)
        |> moveToN (positionLeft zipper) (positionRight zipper)
        |> Maybe.withDefault zipper


{-| -}
swap : Zipper a -> Zipper a
swap zipper =
    zipper


{-| -}
tryMoveToN : Int -> Int -> Zipper a -> Zipper a
tryMoveToN i j zipper =
    moveToN i j zipper
        |> Maybe.withDefault zipper


{-| -}
trySetAt : Int -> a -> Zipper a -> Zipper a
trySetAt i elem zipper =
    setAt i elem zipper
        |> Maybe.withDefault zipper


{-| -}
trySetAtRelativeLeft : RelativeIndex -> a -> Zipper a -> Zipper a
trySetAtRelativeLeft i elem zipper =
    setAtRelativeLeft i elem zipper
        |> Maybe.withDefault zipper


{-| -}
trySetAtRelativeRight : RelativeIndex -> a -> Zipper a -> Zipper a
trySetAtRelativeRight i elem zipper =
    setAtRelativeRight i elem zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAt : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAt i f zipper =
    updateAt i f zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAtRelativeLeft : RelativeIndex -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAtRelativeLeft i f zipper =
    updateAtRelativeLeft i f zipper
        |> Maybe.withDefault zipper


{-| -}
tryUpdateAtRelativeRight : RelativeIndex -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAtRelativeRight i f zipper =
    updateAtRelativeRight i f zipper
        |> Maybe.withDefault zipper


{-| -}
updateSeparately : (List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b
updateSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( left |> List.reverse |> fLeft |> List.reverse, fSelected selected, fRight right )


{-|

    zipper : Zipper Int
    zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

    updateAt 2 ((+) 10) zipper
        --> Just (fromTuple ( [ 1, 2, 13 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ))

    updateAt 5 ((+) 10) zipper
        --> Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 16 ], [ 7, 8, 9 ] ))

    updateAt 9 ((+) 10) zipper
        --> Nothing

-}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f (( left, selected, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { leftEdge } ) ->
            zipper
                |> updateLeft (List.Extra.updateAt leftEdge f)
                |> Just

        Just ( Selected, { leftEdge } ) ->
            zipper
                |> updateSelected (List.Extra.updateAt leftEdge f)
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.updateAt leftEdge f)
                |> Just

        Nothing ->
            Nothing


{-| -}
updateAtRelativeLeft : RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelativeLeft i f zipper =
    updateAt (indexRelativeLeftToAbsolute zipper i) f zipper


{-| -}
updateAtRelativeRight : RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelativeRight i f zipper =
    updateAt (indexRelativeRightToAbsolute zipper i) f zipper
