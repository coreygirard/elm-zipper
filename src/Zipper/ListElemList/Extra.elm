module Zipper.ListElemList.Extra exposing
    ( positionFromEnd
    , getAt, getAtClamp, getAtRelative, getAtRelativeClamp
    , setAt, trySetAt, setAtClamp, setAtRelative, trySetAtRelative, setAtRelativeClamp
    , mapSeparately, mapLeft, mapRight, indexedMapLeft, indexedMapSelected, indexedMapRight
    , updateSeparately, updateAt, tryUpdateAt, updateAtClamp, updateAtRelative, tryUpdateAtRelative, updateAtRelativeClamp
    , filterSeparately, filterLeft, filterRight, indexedFilterLeft, indexedFilterRight
    , moveLeftUntil, moveRightUntil, moveToIndex, moveToIndexRelative, tryMoveToIndex, tryMoveToIndexRelative
    , sortByKeepElem, sortWithKeepElem, sortByKeepIndex, sortWithKeepIndex
    , reverseLeft, reverseRight
    , swapSelectedWithFirst, swapSelectedWithLast, swapSelectedWithIndex, trySwapSelectedWithIndex, swap
    , indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRangesFromFirst, indexRangesFromLast, indexRangesFromSelection, indexRangesFromEdges
    )

{-| A special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced) where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringCharString`](Zipper.StringCharString)

  - Special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced)
  - General case of [`Zipper.StringCharString`](Zipper.StringCharString)


# Length

@docs positionFromEnd


# Get

@docs getAt, getAtClamp, getAtRelative, getAtRelativeClamp


# Set

@docs setAt, trySetAt, setAtClamp, setAtRelative, trySetAtRelative, setAtRelativeClamp


# Map

@docs mapSeparately, mapLeft, mapRight, indexedMapLeft, indexedMapSelected, indexedMapRight


# Update

@docs updateSeparately, updateAt, tryUpdateAt, updateAtClamp, updateAtRelative, tryUpdateAtRelative, updateAtRelativeClamp


# Filter

@docs filterSeparately, filterLeft, filterRight, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeftUntil, moveRightUntil, moveToIndex, moveToIndexRelative, tryMoveToIndex, tryMoveToIndexRelative


# Insert


# Sort

@docs sortByKeepElem, sortWithKeepElem, sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverseLeft, reverseRight


# Swap

@docs swapSelectedWithFirst, swapSelectedWithLast, swapSelectedWithIndex, trySwapSelectedWithIndex, swap


# Indexes

@docs indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck, absoluteIndexToPosDists, relativeIndexToPosDists, indexRangesFromFirst, indexRangesFromLast, indexRangesFromSelection, indexRangesFromEdges

-}

import List.Extra
import Zipper.ListElemList as Basic exposing (..)
import Zipper.ListElemList.Advanced as Adv


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
filterSeparately : (a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )
filterSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( List.filter fLeft left
    , if fSelected selected then
        Just selected

      else
        Nothing
    , List.filter fRight right
    )


{-| -}
getAt : Int -> Zipper a -> Maybe a
getAt i zipper =
    getAtRelative (indexAbsoluteToRelative zipper i) zipper


{-| -}
getAtClamp : Int -> Zipper a -> a
getAtClamp i zipper =
    getAtRelativeClamp (indexAbsoluteToRelative zipper i) zipper


{-| -}
getAtRelative : Int -> Zipper a -> Maybe a
getAtRelative i (( left, selected, right ) as zipper) =
    case relativeIndexToPosDists zipper i of
        Just ( Selected, _ ) ->
            Just selected

        Just ( Left, { fromRight } ) ->
            List.Extra.getAt fromRight left

        Just ( Right, { fromLeft } ) ->
            List.Extra.getAt fromLeft right

        Nothing ->
            Nothing


{-| -}
getAtRelativeClamp : Int -> Zipper a -> a
getAtRelativeClamp i (( left, selected, right ) as zipper) =
    i
        |> clamp (List.length left * -1) (List.length right)
        |> (\i_ -> getAtRelative i_ zipper)
        |> Maybe.withDefault selected


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


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveLeftUntil (\left _ _ -> List.length left <= 1)
        --> Just (fromTuple ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))

-}
moveLeftUntil : (List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity identity f zipper


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveRightUntil (\left _ _ -> List.length left >= 5)
        --> Just (fromTuple ( [ 1, 2, 3, 4, 5 ], 6, [ 7 ] ))

-}
moveRightUntil : (List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveRightUntil f zipper =
    Adv.moveRightUntil identity identity f zipper


{-| Set selection to Nth element

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveToIndex 5
        --> Just (fromTuple ( [ 1, 2, 3, 4, 5 ], 6, [ 7 ] ))

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> moveToIndex 10
        --> Nothing

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
positionFromEnd : Zipper a -> Int
positionFromEnd =
    Adv.positionFromEnd


{-| -}
relativeIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
relativeIndexToPosDists zipper i =
    absoluteIndexToPosDists zipper (indexRelativeToAbsolute zipper i)


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
updateSeparately : (List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b
updateSeparately fLeft fSelected fRight ( left, selected, right ) =
    ( fLeft left
    , fSelected selected
    , fRight right
    )
