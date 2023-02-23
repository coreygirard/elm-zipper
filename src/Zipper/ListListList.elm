module Zipper.ListListList exposing
    ( Zipper, RelativeIndex(..), Dists, IndexMethod(..), Position(..)
    , empty, fromTuple, fromZipperListList, fromZipperListElemList
    , toTuple, toList, toZipperListList, toZipperListElemList
    , length, positionLeft, positionRight
    , getLeft, getSelected, getRight
    , setLeft, setSelected, setRight
    , map, indexedMap
    , update, updateLeft, updateSelected, updateRight
    , filter, indexedFilter
    , moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight, moveBothToFirst, moveLeftToFirst, moveBothToLast, moveRightToLast
    , insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit
    , reverse
    , sortKeepIndexes
    , indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, relativeIndexLeftToPosDists, relativeIndexRightToPosDists, absoluteIndexToPosDists, indexRanges
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringStringString`](Zipper.StringStringString)

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper, RelativeIndex, Dists, IndexMethod, Position


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

@docs moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight, moveBothToFirst, moveLeftToFirst, moveBothToLast, moveRightToLast


# Insert

@docs insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit


# Reverse

@docs reverse


# Swap


# Sort

@docs sortKeepIndexes


# Indexes

@docs indexAbsoluteCheck, indexRelativeLeftCheck, indexRelativeRightCheck, indexAbsoluteToRelativeLeft, indexAbsoluteToRelativeRight, indexAbsoluteToRelativeLeftCheck, indexAbsoluteToRelativeRightCheck, indexRelativeLeftToAbsolute, indexRelativeRightToAbsolute, indexRelativeLeftToAbsoluteCheck, indexRelativeRightToAbsoluteCheck, relativeIndexLeftToPosDists, relativeIndexRightToPosDists, absoluteIndexToPosDists, indexRanges

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


{-| Passed to the user-provided function by `indexedMap` and similar functions to specify the current element's location relative to the selected element
-}
type Position
    = Left
    | Selected
    | Right


{-| -}
type RelativeIndex
    = LeftIndex Int
    | RightIndex Int


{-| -}
type alias Dists =
    { fromLeft : Int, fromRight : Int }


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


{-| Create an empty zipper

    empty --> ( [], [], [] )

-}
empty : Zipper a
empty =
    ( [], [], [] )


{-| -}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, selected, right ) =
    ( List.filter f left
    , List.filter f selected
    , List.filter f right
    )


{-| -}
fromTuple : ( List a, List a, List a ) -> Zipper a
fromTuple ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
fromZipperListElemList : (a -> List a) -> ( List a, a, List a ) -> Zipper a
fromZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
fromZipperListList : List a -> ( List a, List a ) -> Zipper a
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| -}
getLeft : Zipper a -> List a
getLeft ( left, _, _ ) =
    left


{-| -}
getRight : Zipper a -> List a
getRight ( _, _, right ) =
    right


{-| -}
getSelected : Zipper a -> List a
getSelected ( _, selected, _ ) =
    selected


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
indexedFilter : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> ( f Left i elem, elem )) indexes.left left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f Selected i elem, elem )) indexes.selected selected
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f Right i elem, elem )) indexes.right right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, selected, right ) as zipper) =
    let
        indexes =
            indexRangeFromMethod indexMethod zipper
    in
    ( List.map2 (\i elem -> f Left i elem) indexes.left left
    , List.map2 (\i elem -> f Selected i elem) indexes.selected selected
    , List.map2 (\i elem -> f Right i elem) indexes.right right
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
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, selected, right ) =
    ( left ++ [ elem ], selected, right )


{-| -}
insertLast : a -> Zipper a -> Zipper a
insertLast elem ( left, selected, right ) =
    ( left, selected, right ++ [ elem ] )


{-| -}
insertLeftOfLeftSplit : a -> Zipper a -> Zipper a
insertLeftOfLeftSplit elem ( left, selected, right ) =
    ( [ elem ] ++ left, selected, right )


{-| -}
insertLeftOfRightSplit : a -> Zipper a -> Zipper a
insertLeftOfRightSplit elem ( left, selected, right ) =
    ( left, selected ++ [ elem ], right )


{-| -}
insertRightOfLeftSplit : a -> Zipper a -> Zipper a
insertRightOfLeftSplit elem ( left, selected, right ) =
    ( left, [ elem ] ++ selected, right )


{-| -}
insertRightOfRightSplit : a -> Zipper a -> Zipper a
insertRightOfRightSplit elem ( left, selected, right ) =
    ( left, selected, [ elem ] ++ right )


{-| -}
length : Zipper a -> Int
length ( left, selected, right ) =
    List.length left + List.length selected + List.length right


{-| -}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, selected, right ) =
    ( List.map f left
    , List.map f selected
    , List.map f right
    )


{-| -}
moveBothToFirst : Zipper a -> Zipper a
moveBothToFirst zipper =
    fromTuple ( toList zipper, [], [] )


{-| -}
moveBothToLast : Zipper a -> Zipper a
moveBothToLast zipper =
    fromTuple ( [], [], toList zipper )


{-| -}
moveLeftToFirst : Zipper a -> Zipper a
moveLeftToFirst zipper =
    fromTuple ( toList zipper, [], [] )


{-| Attempt to move left edge of selection to left

    fromTuple ( [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Just (fromTuple ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] ))

    fromTuple ( [], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Nothing

-}
moveLeftToLeft : Zipper a -> Maybe (Zipper a)
moveLeftToLeft zipper =
    Adv.moveLeftToLeft identity zipper


{-| -}
moveLeftToRight : Zipper a -> Zipper a
moveLeftToRight zipper =
    zipper


{-| -}
moveRightToLast : Zipper a -> Zipper a
moveRightToLast zipper =
    fromTuple ( [], [], toList zipper )


{-| -}
moveRightToLeft : Zipper a -> Zipper a
moveRightToLeft zipper =
    zipper


{-| -}
moveRightToRight : Zipper a -> Zipper a
moveRightToRight zipper =
    zipper


{-| -}
positionLeft : Zipper a -> Int
positionLeft ( left, _, _ ) =
    List.length left


{-| -}
positionRight : Zipper a -> Int
positionRight ( left, selected, _ ) =
    List.length left + List.length selected


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( List.reverse right, selected, List.reverse left )


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
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, selected, _ ) =
    ( left, selected, right )


{-| -}
setSelected : List a -> Zipper a -> Zipper a
setSelected selected ( left, _, right ) =
    ( left, selected, right )


{-| -}
sortKeepIndexes : Zipper comparable -> Zipper comparable
sortKeepIndexes zipper =
    zipper
        |> moveBothToFirst
        |> updateRight List.sort
        |> Adv.moveToIndex identity identity identity identity (positionLeft zipper) (positionRight zipper)
        |> Maybe.withDefault zipper


{-| -}
toList : Zipper a -> List a
toList ( left, selected, right ) =
    List.reverse left ++ selected ++ right


{-| -}
toTuple : Zipper a -> ( List a, List a, List a )
toTuple ( left, selected, right ) =
    ( List.reverse left, selected, right )


{-| -}
toZipperListElemList : (List a -> a) -> Zipper a -> ( List a, a, List a )
toZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| -}
toZipperListList : Zipper a -> ( List a, List a )
toZipperListList ( left, _, right ) =
    ( left, right )


{-| -}
tryMoveLeftToLeft : Zipper a -> Zipper a
tryMoveLeftToLeft zipper =
    zipper


{-| -}
tryMoveLeftToRight : Zipper a -> Zipper a
tryMoveLeftToRight zipper =
    zipper


{-| -}
tryMoveRightToLeft : Zipper a -> Zipper a
tryMoveRightToLeft zipper =
    zipper


{-| -}
tryMoveRightToRight : Zipper a -> Zipper a
tryMoveRightToRight zipper =
    zipper


{-| -}
update : (List a -> List b) -> Zipper a -> Zipper b
update f ( left, selected, right ) =
    ( left |> List.reverse |> f |> List.reverse, f selected, f right )


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft fLeft ( left, selected, right ) =
    ( left |> List.reverse |> fLeft |> List.reverse, selected, right )


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, selected, right ) =
    ( left, selected, fRight right )


{-| -}
updateSelected : (List a -> List a) -> Zipper a -> Zipper a
updateSelected fSelected ( left, selected, right ) =
    ( left, fSelected selected, right )
