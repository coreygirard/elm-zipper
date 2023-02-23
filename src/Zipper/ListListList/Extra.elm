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
    , indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, relativeIndexLeftToPosDists, relativeIndexRightToPosDists, absoluteIndexToPosDists, indexRanges
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

@docs indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, relativeIndexLeftToPosDists, relativeIndexRightToPosDists, absoluteIndexToPosDists, indexRanges

-}

import List.Extra
import Zipper.ListListList as Basic exposing (..)
import Zipper.ListListList.Advanced as Adv


{-|

    zipper : Zipper Int
    zipper = fromTuple ([1,2,3],[4,5,6],[7,8,9])

    absoluteIndexToPosDists zipper -1 --> Nothing

    absoluteIndexToPosDists zipper 0 --> Just (Left, {fromLeft=0,fromRight=2})

    absoluteIndexToPosDists zipper 2 --> Just (Left, {fromLeft=2,fromRight=0})

    absoluteIndexToPosDists zipper 3 --> Just (Selected, {fromLeft=0,fromRight=2})

    absoluteIndexToPosDists zipper 5 --> Just (Selected, {fromLeft=2,fromRight=0})

    absoluteIndexToPosDists zipper 6 --> Just (Right, {fromLeft=0,fromRight=2})

    absoluteIndexToPosDists zipper 8 --> Just (Right, {fromLeft=2,fromRight=0})

    absoluteIndexToPosDists zipper 9 --> Nothing

-}
absoluteIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
absoluteIndexToPosDists ( left, selected, right ) i =
    if i >= 0 && i < length ( left, [], [] ) then
        Just
            ( Left
            , { fromLeft = i
              , fromRight = length ( left, [], [] ) - i - 1
              }
            )

    else if i >= length ( left, [], [] ) && i < length ( left, selected, [] ) then
        Just
            ( Selected
            , { fromLeft = i - length ( left, [], [] )
              , fromRight = length ( left, selected, [] ) - i - 1
              }
            )

    else if i >= length ( left, selected, [] ) && i < length ( left, selected, right ) then
        Just
            ( Right
            , { fromLeft = i - length ( left, selected, [] )
              , fromRight = length ( left, selected, right ) - i - 1
              }
            )

    else
        Nothing


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
    case absoluteIndexToPosDists zipper i of
        Just ( Left, { fromRight } ) ->
            List.Extra.getAt fromRight left

        Just ( Selected, { fromLeft } ) ->
            List.Extra.getAt fromLeft selected

        Just ( Right, { fromLeft } ) ->
            List.Extra.getAt fromLeft right

        Nothing ->
            Nothing


{-|

    zipper : Zipper Int
    zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )

    zipper |> getAtRelativeLeft (LeftIndex 3) --> Nothing

    zipper |> getAtRelativeLeft (LeftIndex 2) --> Just 1

    zipper |> getAtRelativeLeft (LeftIndex 0) --> Just 3

    zipper |> getAtRelativeLeft (RightIndex 0) --> Just 4

    zipper |> getAtRelativeLeft (RightIndex 2) --> Just 6

    zipper |> getAtRelativeLeft (RightIndex 3) --> Just 7

    zipper |> getAtRelativeLeft (RightIndex 5) --> Just 9

    zipper |> getAtRelativeLeft (RightIndex 6) --> Nothing

-}
getAtRelativeLeft : RelativeIndex -> Zipper a -> Maybe a
getAtRelativeLeft i zipper =
    getAt (indexRelativeLeftToAbsolute zipper i) zipper


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

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteCheck zipper -1 --> Nothing

    indexAbsoluteCheck zipper 0 --> Just Left

    indexAbsoluteCheck zipper 2 --> Just Left

    indexAbsoluteCheck zipper 3 --> Just Selected

    indexAbsoluteCheck zipper 5 --> Just Selected

    indexAbsoluteCheck zipper 6 --> Just Right

    indexAbsoluteCheck zipper 8 --> Just Right

    indexAbsoluteCheck zipper 9 --> Nothing

-}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck ( left, selected, right ) i =
    if i >= 0 && i < length ( left, [], [] ) then
        Just Left

    else if i >= length ( left, [], [] ) && i < length ( left, selected, [] ) then
        Just Selected

    else if i >= length ( left, selected, [] ) && i < length ( left, selected, right ) then
        Just Right

    else
        Nothing


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteToRelativeLeft zipper 0 --> LeftIndex 2

    indexAbsoluteToRelativeLeft zipper 2 --> LeftIndex 0

    indexAbsoluteToRelativeLeft zipper 3 --> RightIndex 0

    indexAbsoluteToRelativeLeft zipper 5 --> RightIndex 2

    indexAbsoluteToRelativeLeft zipper 6 --> RightIndex 3

    indexAbsoluteToRelativeLeft zipper 8 --> RightIndex 5

-}
indexAbsoluteToRelativeLeft : Zipper a -> Int -> RelativeIndex
indexAbsoluteToRelativeLeft ( left, _, _ ) i =
    let
        position =
            List.length left
    in
    if i < position then
        LeftIndex <| position - i - 1

    else
        RightIndex <| i - position


{-| -}
indexAbsoluteToRelativeLeftCheck : Zipper a -> Int -> Maybe RelativeIndex
indexAbsoluteToRelativeLeftCheck zipper i =
    indexAbsoluteToRelativeLeft zipper i
        |> (\j ->
                if indexRelativeLeftCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexAbsoluteToRelativeRight zipper 0 --> LeftIndex 5

    indexAbsoluteToRelativeRight zipper 2 --> LeftIndex 3

    indexAbsoluteToRelativeRight zipper 3 --> LeftIndex 2

    indexAbsoluteToRelativeRight zipper 5 --> LeftIndex 0

    indexAbsoluteToRelativeRight zipper 6 --> RightIndex 0

    indexAbsoluteToRelativeRight zipper 8 --> RightIndex 2

-}
indexAbsoluteToRelativeRight : Zipper a -> Int -> RelativeIndex
indexAbsoluteToRelativeRight ( left, selection, _ ) i =
    let
        position =
            List.length left + List.length selection
    in
    if i < position then
        LeftIndex <| position - i - 1

    else
        RightIndex <| i - position


{-| -}
indexAbsoluteToRelativeRightCheck : Zipper a -> Int -> Maybe RelativeIndex
indexAbsoluteToRelativeRightCheck zipper i =
    indexAbsoluteToRelativeRight zipper i
        |> (\j ->
                if indexRelativeRightCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
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
indexedFilterSelected : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterSelected indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( left
    , List.map2 (\i elem -> ( f Selected i elem, elem )) indexes.selected selected
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , right
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
    , List.map2 (\i elem -> f Selected i elem) indexes.selected selected
    , right
    )


{-| -}
indexedMapSeparately :
    IndexMethod
    -> (Position -> Int -> a -> b)
    -> (Position -> Int -> a -> b)
    -> (Position -> Int -> a -> b)
    -> Zipper a
    -> Zipper b
indexedMapSeparately indexMethod fLeft fSelected fRight (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> fLeft Left i elem) indexes.left left
    , List.map2 (\i elem -> fSelected Selected i elem) indexes.selected selected
    , List.map2 (\i elem -> fRight Right i elem) indexes.right right
    )


indexRangeFromMethod :
    IndexMethod
    -> Zipper a
    ->
        { left : List Int
        , selected : List Int
        , right : List Int
        }
indexRangeFromMethod indexMethod zipper =
    case indexMethod of
        FromFirst ->
            indexRanges zipper |> .fromFirst

        FromLast ->
            indexRanges zipper |> .fromLast

        FromLeftSplit ->
            indexRanges zipper |> .fromLeftSplit

        FromRightSplit ->
            indexRanges zipper |> .fromRightSplit


{-| -}
indexRanges :
    Zipper a
    ->
        { fromFirst :
            { left : List Int
            , selected : List Int
            , right : List Int
            }
        , fromLast :
            { left : List Int
            , selected : List Int
            , right : List Int
            }
        , fromLeftSplit :
            { left : List Int
            , selected : List Int
            , right : List Int
            }
        , fromRightSplit :
            { left : List Int
            , selected : List Int
            , right : List Int
            }
        }
indexRanges ( left, selected, right ) =
    { fromFirst =
        { left =
            List.range
                0
                (length ( left, [], [] ) - 1)
        , selected =
            List.range
                (length ( left, [], [] ))
                (length ( left, selected, [] ) - 1)
        , right =
            List.range
                (length ( left, selected, [] ))
                (length ( left, selected, right ) - 1)
        }
    , fromLast =
        { left =
            List.range
                (length ( [], selected, right ))
                (length ( left, selected, right ) - 1)
                |> List.reverse
        , selected =
            List.range
                (length ( [], [], right ))
                (length ( [], selected, right ) - 1)
                |> List.reverse
        , right =
            List.range
                0
                (length ( [], [], right ) - 1)
                |> List.reverse
        }
    , fromLeftSplit =
        { left =
            List.range
                0
                (length ( left, [], [] ) - 1)
                |> List.map (\n -> n - List.length left)
        , selected =
            List.range
                (length ( left, [], [] ))
                (length ( left, selected, [] ) - 1)
                |> List.map (\n -> n - List.length left + 1)
        , right =
            List.range
                (length ( left, selected, [] ))
                (length ( left, selected, right ) - 1)
                |> List.map (\n -> n - List.length left + 1)
        }
    , fromRightSplit =
        { left =
            List.range
                0
                (length ( left, [], [] ) - 1)
                |> List.map (\n -> n - List.length left - List.length selected)
        , selected =
            List.range
                (length ( left, [], [] ))
                (length ( left, selected, [] ) - 1)
                |> List.map (\n -> n - List.length left - List.length selected)
        , right =
            List.range
                (length ( left, selected, [] ))
                (length ( left, selected, right ) - 1)
                |> List.map (\n -> n - List.length left - List.length selected + 1)
        }
    }


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeLeftCheck zipper (LeftIndex 3) --> Nothing

    indexRelativeLeftCheck zipper (LeftIndex 2) --> Just Left

    indexRelativeLeftCheck zipper (LeftIndex 0) --> Just Left

    indexRelativeLeftCheck zipper (RightIndex 0) --> Just Selected

    indexRelativeLeftCheck zipper (RightIndex 2) --> Just Selected

    indexRelativeLeftCheck zipper (RightIndex 3) --> Just Right

    indexRelativeLeftCheck zipper (RightIndex 5) --> Just Right

    indexRelativeLeftCheck zipper (RightIndex 6) --> Nothing

-}
indexRelativeLeftCheck : Zipper a -> RelativeIndex -> Maybe Position
indexRelativeLeftCheck zipper i =
    indexAbsoluteCheck
        zipper
        (indexRelativeLeftToAbsolute zipper i)


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


{-| -}
indexRelativeLeftToAbsoluteCheck : Zipper a -> RelativeIndex -> Maybe Int
indexRelativeLeftToAbsoluteCheck zipper i =
    indexRelativeLeftToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-|

    zipper : Zipper Int
    zipper = ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )

    indexRelativeRightCheck zipper (LeftIndex 6) --> Nothing

    indexRelativeRightCheck zipper (LeftIndex 5) --> Just Left

    indexRelativeRightCheck zipper (LeftIndex 3) --> Just Left

    indexRelativeRightCheck zipper (LeftIndex 2) --> Just Selected

    indexRelativeRightCheck zipper (LeftIndex 0) --> Just Selected

    indexRelativeRightCheck zipper (RightIndex 0) --> Just Right

    indexRelativeRightCheck zipper (RightIndex 2) --> Just Right

    indexRelativeRightCheck zipper (RightIndex 3) --> Nothing

-}
indexRelativeRightCheck : Zipper a -> RelativeIndex -> Maybe Position
indexRelativeRightCheck zipper i =
    indexAbsoluteCheck
        zipper
        (indexRelativeRightToAbsolute zipper i)


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
indexRelativeRightToAbsoluteCheck : Zipper a -> RelativeIndex -> Maybe Int
indexRelativeRightToAbsoluteCheck zipper i =
    indexRelativeRightToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
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
relativeIndexLeftToPosDists : Zipper a -> RelativeIndex -> Maybe ( Position, Dists )
relativeIndexLeftToPosDists zipper i =
    absoluteIndexToPosDists
        zipper
        (indexRelativeLeftToAbsolute zipper i)


{-| -}
relativeIndexRightToPosDists : Zipper a -> RelativeIndex -> Maybe ( Position, Dists )
relativeIndexRightToPosDists zipper i =
    absoluteIndexToPosDists
        zipper
        (indexRelativeRightToAbsolute zipper i)


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

        Just ( Selected, { fromLeft } ) ->
            Just
                ( left
                , List.Extra.setAt fromLeft elem selected
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
    case absoluteIndexToPosDists zipper i of
        Just ( Left, { fromRight } ) ->
            Just
                ( List.Extra.updateAt fromRight f left
                , selected
                , right
                )

        Just ( Selected, { fromLeft } ) ->
            Just
                ( left
                , List.Extra.updateAt fromLeft f selected
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
updateAtRelativeLeft : RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelativeLeft i f zipper =
    updateAt (indexRelativeLeftToAbsolute zipper i) f zipper


{-| -}
updateAtRelativeRight : RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelativeRight i f zipper =
    updateAt (indexRelativeRightToAbsolute zipper i) f zipper