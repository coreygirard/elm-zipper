module Zipper.ListElemList.Extra exposing
    ( positionFromEnd
    , getAt, getAtClamp, getAtRelative, getAtRelativeClamp
    , setAt, trySetAt, setAtClamp, setAtRelative, trySetAtRelative, setAtRelativeClamp
    , mapSeparately, mapLeft, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapSelected, indexedMapRight
    , updateSeparately, updateAt, tryUpdateAt, updateAtClamp, updateAtRelative, tryUpdateAtRelative, updateAtRelativeClamp
    , filterSeparately, filterLeft, filterRight, indexedFilterLeft, indexedFilterRight
    , moveLeftUntil, moveRightUntil, moveToIndex, moveToIndexRelative, tryMoveToIndex, tryMoveToIndexRelative
    , sortByKeepElem, sortWithKeepElem, sortByKeepIndex, sortWithKeepIndex
    , reverseLeft, reverseRight
    , swapSelectedWithFirst, swapSelectedWithLast, swapSelectedWithIndex, trySwapSelectedWithIndex, swap
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

@docs mapSeparately, mapLeft, mapRight, indexedMapSeparately, indexedMapLeft, indexedMapSelected, indexedMapRight


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

-}

import List.Extra
import Zipper.ListElemList as Basic exposing (..)
import Zipper.ListElemList.Advanced as Adv


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
getAt i (( left, selected, right ) as zipper) =
    case
        calcIndex zipper i
            |> Maybe.map (\elem -> ( elem.section, elem ))
    of
        Just ( Left, { rightEdge } ) ->
            List.Extra.getAt rightEdge left

        Just ( Selected, _ ) ->
            Just selected

        Just ( Right, { leftEdge } ) ->
            List.Extra.getAt leftEdge right

        Nothing ->
            Nothing


{-| -}
getAtClamp : Int -> Zipper a -> a
getAtClamp i (( left, selected, right ) as zipper) =
    getAt (i |> clamp 0 (length zipper - 1)) zipper
        |> Maybe.withDefault selected


{-| -}
getAtRelative : Int -> Zipper a -> Maybe a
getAtRelative i zipper =
    i
        |> indexRelativeToAbsolute zipper
        |> (\i_ -> getAt i_ zipper)


{-| -}
getAtRelativeClamp : Int -> Zipper a -> a
getAtRelativeClamp i (( left, selected, right ) as zipper) =
    i
        |> indexRelativeToAbsolute zipper
        |> (\i_ -> getAtClamp i_ zipper)


{-| -}
indexedFilterLeft : (Position -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 (\i elem -> ( f i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , selected
    , right
    )


{-| -}
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


{-| -}
indexedMapLeft : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 f indexes.left left
    , selected
    , right
    )


{-| -}
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


{-| -}
indexedMapSelected : (Position -> a -> a) -> Zipper a -> Zipper a
indexedMapSelected f (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( left
    , f indexes.selected selected
    , right
    )


{-|

    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
        |> indexedMapSeparately
            (\{ leftEdge } val -> (leftEdge + 1) * 10 + val)
            (\{ leftEdge } val -> (leftEdge + 1) * 10 + val)
            (\{ leftEdge } val -> (leftEdge + 1) * 10 + val)
        --> fromTuple ( [ 11, 22, 33 ], 14, [ 15, 26, 37 ] )

-}
indexedMapSeparately : (Position -> a -> b) -> (Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b
indexedMapSeparately fLeft fSelected fRight (( left, selected, right ) as zipper) =
    let
        indexes =
            calcIndexes zipper
    in
    ( List.map2 fLeft (List.reverse indexes.left) left
    , fSelected indexes.selected selected
    , List.map2 fRight indexes.right right
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
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { leftEdge } ) ->
            zipper
                |> updateLeft (List.Extra.setAt leftEdge elem)
                |> Just

        Just ( Selected, { leftEdge } ) ->
            zipper
                |> updateSelected (\_ -> elem)
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.setAt leftEdge elem)
                |> Just

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
    case
        calcIndex zipper i
            |> Maybe.map (\elem_ -> ( elem_.section, elem_ ))
    of
        Just ( Left, { rightEdge } ) ->
            Just
                ( List.Extra.setAt rightEdge selected left
                , List.Extra.getAt rightEdge left |> Maybe.withDefault selected
                , right
                )

        Just ( Selected, _ ) ->
            Just
                zipper

        Just ( Right, { leftEdge } ) ->
            Just
                ( left
                , List.Extra.getAt leftEdge right |> Maybe.withDefault selected
                , List.Extra.setAt leftEdge selected right
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
                |> updateSelected f
                |> Just

        Just ( Right, { leftEdge } ) ->
            zipper
                |> updateRight (List.Extra.updateAt leftEdge f)
                |> Just

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
