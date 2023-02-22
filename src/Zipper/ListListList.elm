module Zipper.ListListList exposing
    ( Zipper
    , empty, fromTuple, fromZipperListList, fromZipperListElemList
    , toTuple, toList, toZipperListList, toZipperListElemList
    , length, lengthLeft, lengthSelection, lengthRight, positionLeft, positionRight, positionLeftFromEnd, positionRightFromEnd
    , getLeft, getSelection, getRight, getAt, getAtRelativeToLeftSplit, getAtRelativeToRightSplit
    , setLeft, setSelection, setRight, setAt, setAtRelativeToLeftSplit, setAtRelativeToRightSplit
    , map, mapLeft, mapSelection, mapRight, IndexMethod, Position(..), indexedMap, indexedMapLeft, indexedMapSelection, indexedMapRight
    , update, updateLeft, updateSelection, updateRight, updateAt, updateAtRelativeToLeftSplit, updateAtRelativeToRightSplit
    , filter, filterLeft, filterSelection, filterRight, indexedFilter, indexedFilterLeft, indexedFilterSelection, indexedFilterRight
    , moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight
    , insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit
    , sort, sortBy, sortWith
    , reverse, reverseLeft, reverseSelected, reverseRight
    , swapTwo
    , indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, absoluteIndexToPosDists
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringStringString`](Zipper.StringStringString)

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper


# Create

@docs empty, fromTuple, fromZipperListList, fromZipperListElemList


# To

@docs toTuple, toList, toZipperListList, toZipperListElemList


# Length

@docs length, lengthLeft, lengthSelection, lengthRight, positionLeft, positionRight, positionLeftFromEnd, positionRightFromEnd


# Get

@docs getLeft, getSelection, getRight, getAt, getAtRelativeToLeftSplit, getAtRelativeToRightSplit


# Set

@docs setLeft, setSelection, setRight, setAt, setAtRelativeToLeftSplit, setAtRelativeToRightSplit


# Map

@docs map, mapLeft, mapSelection, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapSelection, indexedMapRight


# Update

@docs update, updateLeft, updateSelection, updateRight, updateAt, updateAtRelativeToLeftSplit, updateAtRelativeToRightSplit


# Filter

@docs filter, filterLeft, filterSelection, filterRight, indexedFilter, indexedFilterLeft, indexedFilterSelection, indexedFilterRight


# Move

@docs moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight


# Insert

@docs insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit


# Sort

@docs sort, sortBy, sortWith


# Reverse

@docs reverse, reverseLeft, reverseSelected, reverseRight


# Swap

@docs swapTwo


# Indexes

@docs indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, absoluteIndexToPosDists

-}

import List.Extra
import Zipper.ListListList.Advanced as Adv


{-| A list type that tracks two split locations
-}
type alias Zipper a =
    ( List a, List a, List a )


{-| -}
type IndexMethod
    = FromFirst
    | FromLast
    | FromLeftSplit
    | FromRightSplit
    | FromEdges


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Position
    = Left
    | Selection
    | Right


{-| -}
type alias Dists =
    { fromLeft : Int, fromRight : Int }


{-| Create an empty zipper

    empty --> ( [], [], [] )

-}
empty : Zipper a
empty =
    ( [], [], [] )


{-| -}
fromTuple : ( List a, List a, List a ) -> Zipper a
fromTuple ( left, selection, right ) =
    ( List.reverse left, selection, right )


{-| -}
fromZipperListList : List a -> ( List a, List a ) -> Zipper a
fromZipperListList selection ( left, right ) =
    ( left, selection, right )


{-| -}
fromZipperListElemList : (a -> List a) -> ( List a, a, List a ) -> Zipper a
fromZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
toTuple : Zipper a -> ( List a, List a, List a )
toTuple ( left, selection, right ) =
    ( List.reverse left, selection, right )


{-| -}
toList : Zipper a -> List a
toList ( left, selection, right ) =
    List.reverse left ++ selection ++ right


{-| -}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList ( left, _, right ) =
    ( left, right )


{-| -}
toZipperListElemList : (List a -> a) -> Zipper a -> ( List a, a, List a )
toZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
length : Zipper a -> Int
length ( left, selection, right ) =
    List.length left + List.length selection + List.length right


{-| -}
lengthLeft : Zipper a -> Int
lengthLeft ( left, _, _ ) =
    List.length left


{-| -}
lengthSelection : Zipper a -> Int
lengthSelection ( _, selection, _ ) =
    List.length selection


{-| -}
lengthRight : Zipper a -> Int
lengthRight ( _, _, right ) =
    List.length right


{-| -}
positionLeft : Zipper a -> Int
positionLeft ( left, _, _ ) =
    List.length left


{-| -}
positionRight : Zipper a -> Int
positionRight ( left, selection, _ ) =
    List.length left + List.length selection


{-| -}
positionLeftFromEnd : Zipper a -> Int
positionLeftFromEnd ( _, selection, right ) =
    List.length selection + List.length right


{-| -}
positionRightFromEnd : Zipper a -> Int
positionRightFromEnd ( _, _, right ) =
    List.length right


{-| -}
getLeft : Zipper a -> List a
getLeft ( left, _, _ ) =
    left


{-| -}
getSelection : Zipper a -> List a
getSelection ( _, selection, _ ) =
    selection


{-| -}
getRight : Zipper a -> List a
getRight ( _, _, right ) =
    right


{-| -}
getAt : Int -> Zipper a -> Maybe a
getAt i ( left, selection, right ) =
    if i >= 0 && i < length ( left, [], [] ) then
        List.Extra.getAt i (List.reverse left)

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        List.Extra.getAt (i + List.length left) selection

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        List.Extra.getAt (i + length ( left, selection, [] )) right

    else
        Nothing


{-| -}
getAtRelativeToLeftSplit : Int -> Zipper a -> Maybe a
getAtRelativeToLeftSplit i ( left, selection, right ) =
    if i < 0 then
        left
            |> List.Extra.getAt (List.length left - i)

    else
        right
            |> List.Extra.getAt (i - List.length left)


{-| -}
getAtRelativeToRightSplit : Int -> Zipper a -> Maybe a
getAtRelativeToRightSplit i ( left, selection, right ) =
    if i < 0 then
        left
            |> List.Extra.getAt (List.length left - i)

    else
        right
            |> List.Extra.getAt (i - List.length left)


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, selection, right ) =
    ( List.reverse left, selection, right )


{-| -}
setSelection : List a -> Zipper a -> Zipper a
setSelection selection ( left, _, right ) =
    ( left, selection, right )


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, selection, _ ) =
    ( left, selection, right )


{-| -}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem ( left, selection, right ) =
    if i >= 0 && i < length ( left, [], [] ) then
        Just
            ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
            , selection
            , right
            )

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        Just
            ( left
            , selection |> List.Extra.setAt (i - List.length left - 1) elem
            , right
            )

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        Just
            ( left
            , selection
            , right |> List.Extra.setAt (i - List.length left - 1) elem
            )

    else
        Nothing


{-| -}
setAtRelativeToLeftSplit : Int -> a -> Zipper a -> Maybe (Zipper a)
setAtRelativeToLeftSplit i elem ( left, selection, right ) =
    if i >= 0 && i < length ( left, [], [] ) then
        Just
            ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
            , selection
            , right
            )

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        Just
            ( left
            , selection |> List.Extra.setAt (i - List.length left - 1) elem
            , right
            )

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        Just
            ( left
            , selection
            , right |> List.Extra.setAt (i - List.length left - 1) elem
            )

    else
        Nothing


{-| -}
setAtRelativeToRightSplit : Int -> a -> Zipper a -> Maybe (Zipper a)
setAtRelativeToRightSplit i elem ( left, selection, right ) =
    if i >= 0 && i < length ( left, [], [] ) then
        Just
            ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
            , selection
            , right
            )

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        Just
            ( left
            , selection |> List.Extra.setAt (i - List.length left - 1) elem
            , right
            )

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        Just
            ( left
            , selection
            , right |> List.Extra.setAt (i - List.length left - 1) elem
            )

    else
        Nothing


{-| -}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, selection, right ) =
    ( List.map f left
    , List.map f selection
    , List.map f right
    )


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft f ( left, selection, right ) =
    ( List.map f left, selection, right )


{-| -}
mapSelection : (a -> a) -> Zipper a -> Zipper a
mapSelection f ( left, selection, right ) =
    ( left, List.map f selection, right )


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight f ( left, selection, right ) =
    ( left, selection, List.map f right )


{-| -}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, selection, right ) as zipper) =
    ( List.map2 (\i elem -> f Left i elem) (getIndexesLeftHelper_ indexMethod zipper) left
    , List.map2 (\i elem -> f Selection i elem) (getIndexesSelectionHelper_ indexMethod zipper) left
    , List.map2 (\i elem -> f Right i elem) (getIndexesRightHelper_ indexMethod zipper) right
    )


{-| -}
indexedMapLeft : Zipper a -> Zipper a
indexedMapLeft zipper =
    zipper


{-| -}
indexedMapSelection : Zipper a -> Zipper a
indexedMapSelection zipper =
    zipper


{-| -}
indexedMapRight : Zipper a -> Zipper a
indexedMapRight zipper =
    zipper


{-| -}
getIndexesLeftHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesLeftHelper_ indexMethod ( left, selection, right ) =
    case indexMethod of
        FromFirst ->
            List.range 0 (List.length left - 1) |> List.reverse

        FromLast ->
            List.range (List.length right) (List.length right + List.length left)

        _ ->
            List.map2
                min
                (List.range 0 (List.length left - 1) |> List.reverse)
                (List.range (List.length right + 1) (List.length right + 1 + List.length left))


{-| -}
getIndexesSelectionHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesSelectionHelper_ indexMethod ( left, selection, right ) =
    case indexMethod of
        FromFirst ->
            List.range 0 (List.length left - 1) |> List.reverse

        FromLast ->
            List.range (List.length right) (List.length right + List.length left)

        _ ->
            List.map2
                min
                (List.range 0 (List.length left - 1) |> List.reverse)
                (List.range (List.length right + 1) (List.length right + 1 + List.length left))


{-| -}
getIndexesRightHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesRightHelper_ indexMethod ( left, selection, right ) =
    case indexMethod of
        FromFirst ->
            List.range (List.length left) (List.length right + List.length left)

        FromLast ->
            List.range 0 (List.length right - 1) |> List.reverse

        _ ->
            List.map2
                min
                (List.range (List.length left + 1) (List.length right + 1 + List.length left))
                (List.range 0 (List.length right - 1) |> List.reverse)


{-| -}
update : (List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b
update fLeft fSelection fRight ( left, selection, right ) =
    ( fLeft left, fSelection selection, fRight right )


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft fLeft ( left, selection, right ) =
    ( fLeft left, selection, right )


{-| -}
updateSelection : (List a -> List a) -> Zipper a -> Zipper a
updateSelection fSelection ( left, selection, right ) =
    ( left, fSelection selection, right )


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, selection, right ) =
    ( left, selection, fRight right )


{-| -}
updateAt : Zipper a -> Maybe (Zipper a)
updateAt zipper =
    Just zipper


{-| -}
tryUpdateAt : Zipper a -> Zipper a
tryUpdateAt zipper =
    zipper
        |> updateAt
        |> Maybe.withDefault zipper


{-| -}
updateAtRelativeToLeftSplit : Zipper a -> Maybe (Zipper a)
updateAtRelativeToLeftSplit zipper =
    Just zipper


{-| -}
tryUpdateAtRelativeToLeftSplit : Zipper a -> Zipper a
tryUpdateAtRelativeToLeftSplit zipper =
    zipper
        |> updateAtRelativeToLeftSplit
        |> Maybe.withDefault zipper


{-| -}
updateAtRelativeToRightSplit : Zipper a -> Maybe (Zipper a)
updateAtRelativeToRightSplit zipper =
    Just zipper


{-| -}
tryUpdateAtRelativeToRightSplit : Zipper a -> Zipper a
tryUpdateAtRelativeToRightSplit zipper =
    zipper
        |> updateAtRelativeToRightSplit
        |> Maybe.withDefault zipper


{-| -}
filter : Zipper a -> Zipper a
filter zipper =
    zipper


{-| -}
filterLeft : Zipper a -> Zipper a
filterLeft zipper =
    zipper


{-| -}
filterSelection : Zipper a -> Zipper a
filterSelection zipper =
    zipper


{-| -}
filterRight : Zipper a -> Zipper a
filterRight zipper =
    zipper


{-| -}
indexedFilter : Zipper a -> Zipper a
indexedFilter zipper =
    zipper


{-| -}
indexedFilterLeft : Zipper a -> Zipper a
indexedFilterLeft zipper =
    zipper


{-| -}
indexedFilterSelection : Zipper a -> Zipper a
indexedFilterSelection zipper =
    zipper


{-| -}
indexedFilterRight : Zipper a -> Zipper a
indexedFilterRight zipper =
    zipper


{-| Attempt to move left edge of selection to left

    fromTuple ( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Ok (fromTuple ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] ))

    fromTuple ( [], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Err (fromTuple ( [], [ 3, 4 ], [ 5, 6 ] ))

-}
moveLeftToLeft : Zipper a -> Result (Zipper a) (Zipper a)
moveLeftToLeft zipper =
    Adv.moveLeftToLeft identity zipper


{-| -}
tryMoveLeftToLeft : Zipper a -> Zipper a
tryMoveLeftToLeft zipper =
    zipper


{-| -}
moveLeftToRight : Zipper a -> Zipper a
moveLeftToRight zipper =
    zipper


{-| -}
tryMoveLeftToRight : Zipper a -> Zipper a
tryMoveLeftToRight zipper =
    zipper


{-| -}
moveRightToLeft : Zipper a -> Zipper a
moveRightToLeft zipper =
    zipper


{-| -}
tryMoveRightToLeft : Zipper a -> Zipper a
tryMoveRightToLeft zipper =
    zipper


{-| -}
moveRightToRight : Zipper a -> Zipper a
moveRightToRight zipper =
    zipper


{-| -}
tryMoveRightToRight : Zipper a -> Zipper a
tryMoveRightToRight zipper =
    zipper


{-| -}
insertFirst : Zipper a -> Zipper a
insertFirst zipper =
    zipper


{-| -}
insertLast : Zipper a -> Zipper a
insertLast zipper =
    zipper


{-| -}
insertLeftOfLeftSplit : Zipper a -> Zipper a
insertLeftOfLeftSplit zipper =
    zipper


{-| -}
insertRightOfLeftSplit : Zipper a -> Zipper a
insertRightOfLeftSplit zipper =
    zipper


{-| -}
insertLeftOfRightSplit : Zipper a -> Zipper a
insertLeftOfRightSplit zipper =
    zipper


{-| -}
insertRightOfRightSplit : Zipper a -> Zipper a
insertRightOfRightSplit zipper =
    zipper


{-| -}
sort : Zipper a -> Zipper a
sort zipper =
    zipper


{-| -}
sortBy : Zipper a -> Zipper a
sortBy zipper =
    zipper


{-| -}
sortWith : Zipper a -> Zipper a
sortWith zipper =
    zipper


{-| -}
reverse : Zipper a -> Zipper a
reverse zipper =
    zipper


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft zipper =
    zipper


{-| -}
reverseSelected : Zipper a -> Zipper a
reverseSelected zipper =
    zipper


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight zipper =
    zipper


{-| -}
swapTwo : Zipper a -> Zipper a
swapTwo zipper =
    zipper


{-| -}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck ( left, selection, right ) i =
    if i >= 0 && i < length ( left, [], [] ) then
        Just Left

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        Just Selection

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        Just Right

    else
        Nothing


{-| -}
indexRelativeLeftCheck : Zipper a -> Int -> Maybe Position
indexRelativeLeftCheck ( left, _, right ) i =
    if i == 0 then
        Nothing

    else if i > 0 && i < List.length right then
        Just Right

    else if i < 0 && i > (List.length left * -1) then
        Just Left

    else
        Nothing


{-| -}
indexRelativeRightCheck : Zipper a -> Int -> Maybe Position
indexRelativeRightCheck ( left, _, right ) i =
    if i == 0 then
        Nothing

    else if i > 0 && i < List.length right then
        Just Right

    else if i < 0 && i > (List.length left * -1) then
        Just Left

    else
        Nothing


{-| -}
indexAbsoluteToRelativeLeft : Zipper a -> Int -> Int
indexAbsoluteToRelativeLeft ( left, _, _ ) i =
    i * -1 + List.length left


{-| -}
indexAbsoluteToRelativeRight : Zipper a -> Int -> Int
indexAbsoluteToRelativeRight ( left, _, _ ) i =
    i * -1 + List.length left


{-| -}
indexAbsoluteToRelativeLeftCheck : Zipper a -> Int -> Maybe Int
indexAbsoluteToRelativeLeftCheck zipper i =
    indexAbsoluteToRelativeLeft zipper i
        |> (\j ->
                if indexRelativeLeftCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexAbsoluteToRelativeRightCheck : Zipper a -> Int -> Maybe Int
indexAbsoluteToRelativeRightCheck zipper i =
    indexAbsoluteToRelativeRight zipper i
        |> (\j ->
                if indexRelativeRightCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexRelativeLeftToAbsolute : Zipper a -> Int -> Int
indexRelativeLeftToAbsolute ( left, _, _ ) i =
    (i - List.length left) * -1


{-| -}
indexRelativeRightToAbsolute : Zipper a -> Int -> Int
indexRelativeRightToAbsolute ( left, _, _ ) i =
    (i - List.length left) * -1


{-| -}
indexRelativeLeftToAbsoluteCheck : Zipper a -> Int -> Maybe Int
indexRelativeLeftToAbsoluteCheck zipper i =
    indexRelativeLeftToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexRelativeRightToAbsoluteCheck : Zipper a -> Int -> Maybe Int
indexRelativeRightToAbsoluteCheck zipper i =
    indexRelativeRightToAbsolute zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
absoluteIndexToPosDists : Zipper a -> Int -> Maybe ( Position, Dists )
absoluteIndexToPosDists ( left, selection, right ) i =
    if i >= 0 && i < length ( left, [], [] ) then
        Just
            ( Left
            , { fromLeft = i
              , fromRight = length ( left, [], [] ) - i
              }
            )

    else if i >= length ( left, [], [] ) && i < length ( left, selection, [] ) then
        Just
            ( Selection
            , { fromLeft = i - length ( left, [], [] )
              , fromRight = length ( left, selection, [] ) - i
              }
            )

    else if i >= length ( left, selection, [] ) && i < length ( left, selection, right ) then
        Just
            ( Right
            , { fromLeft = i - length ( left, selection, [] )
              , fromRight = length ( left, selection, right ) - i
              }
            )

    else
        Nothing
