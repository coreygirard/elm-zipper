module Zipper.ListList exposing
    ( Zipper
    , empty, fromTuple, fromZipperListElemList, fromZipperListListList
    , toTuple, toList, toZipperListElemList, toZipperListListList
    , length, lengthLeft, lengthRight, position
    , getLeft, getRight, getAt, getAtRelative
    , setLeft, setRight, setAt, setAtRelative
    , map, mapLeft, mapRight, IndexMethod(..), Position(..), indexedMap, indexedMapLeft, indexedMapRight
    , update, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative
    , filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast, moveToN
    , insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit
    , sortKeepIndex, sortByKeepIndex, sortWithKeepIndex
    , reverse, reverseLeft, reverseRight
    , swapTwo
    , indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper


# Create

@docs empty, fromTuple, fromZipperListElemList, fromZipperListListList


# To

@docs toTuple, toList, toZipperListElemList, toZipperListListList


# Length

@docs length, lengthLeft, lengthRight, position


# Get

@docs getLeft, getRight, getAt, getAtRelative


# Set

@docs setLeft, setRight, setAt, setAtRelative


# Map

@docs map, mapLeft, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapRight


# Update

@docs update, updateLeft, updateRight, updateAt, tryUpdateAt, updateAtRelative, tryUpdateAtRelative


# Filter

@docs filter, filterLeft, filterRight, indexedFilter, indexedFilterLeft, indexedFilterRight


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight, moveToFirst, moveToLast, moveToN


# Insert

@docs insertFirst, insertLast, insertLeftOfSplit, insertRightOfSplit


# Sort

@docs sortKeepIndex, sortByKeepIndex, sortWithKeepIndex


# Reverse

@docs reverse, reverseLeft, reverseRight


# Swap

@docs swapTwo


# Indexes

@docs indexAbsoluteCheck, indexRelativeCheck, indexAbsoluteToRelative, indexAbsoluteToRelativeCheck, indexRelativeToAbsolute, indexRelativeToAbsoluteCheck

-}

import List.Extra
import Zipper.ListList.Advanced


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


{-| Create an empty zipper

    empty --> ( [], [] )

-}
empty : Zipper a
empty =
    ( [], [] )


{-| -}
fromTuple : ( List a, List a ) -> Zipper a
fromTuple ( left, right ) =
    ( List.reverse left, right )


{-| -}
fromZipperListElemList : ( List a, a, List a ) -> Zipper a
fromZipperListElemList ( left, _, right ) =
    ( left, right )


{-| -}
fromZipperListListList : ( List a, List a, List a ) -> Zipper a
fromZipperListListList ( left, _, right ) =
    ( left, right )


{-| -}
toTuple : Zipper a -> ( List a, List a )
toTuple ( left, right ) =
    ( List.reverse left, right )


{-| -}
toList : Zipper a -> List a
toList ( left, right ) =
    List.reverse left ++ right


{-| -}
toZipperListElemList : a -> Zipper a -> ( List a, a, List a )
toZipperListElemList selected ( left, right ) =
    ( left, selected, right )


{-| -}
toZipperListListList : List a -> Zipper a -> ( List a, List a, List a )
toZipperListListList selection ( left, right ) =
    ( left, selection, right )


{-| -}
length : Zipper a -> Int
length ( left, right ) =
    List.length left + List.length right


{-| -}
lengthLeft : Zipper a -> Int
lengthLeft ( left, _ ) =
    List.length left


{-| -}
lengthRight : Zipper a -> Int
lengthRight ( _, right ) =
    List.length right


{-| -}
position : Zipper a -> Int
position ( left, _ ) =
    List.length left


{-| -}
getLeft : Zipper a -> List a
getLeft ( left, _ ) =
    left


{-| -}
getRight : Zipper a -> List a
getRight ( _, right ) =
    right


{-| -}
getAt : Int -> Zipper a -> Maybe a
getAt i zipper =
    getAtRelative (i - position zipper) zipper


{-| -}
getAtRelative : Int -> Zipper a -> Maybe a
getAtRelative i ( left, right ) =
    if i < 0 then
        left
            |> List.Extra.getAt (List.length left - i)

    else
        right
            |> List.Extra.getAt (i - List.length left)


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft left ( _, right ) =
    ( List.reverse left, right )


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight right ( left, _ ) =
    ( left, right )


{-| -}
setAt : Int -> a -> Zipper a -> Maybe (Zipper a)
setAt i elem ( left, right ) =
    if i < 0 || i >= length ( left, right ) then
        Nothing

    else if i < List.length left then
        Just
            ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
            , right
            )

    else
        Just
            ( left
            , right |> List.Extra.setAt (i - List.length left - 1) elem
            )


{-| -}
setAtRelative : Int -> a -> Zipper a -> Maybe (Zipper a)
setAtRelative i elem ( left, right ) =
    if i < 0 || i >= length ( left, right ) then
        Nothing

    else if i < List.length left then
        Just
            ( left |> List.reverse |> List.Extra.setAt i elem |> List.reverse
            , right
            )

    else
        Just
            ( left
            , right |> List.Extra.setAt (i - List.length left - 1) elem
            )


{-| -}
map : (a -> b) -> Zipper a -> Zipper b
map f ( left, right ) =
    ( List.map f left, List.map f right )


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft f ( left, right ) =
    ( List.map f left, right )


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight f ( left, right ) =
    ( left, List.map f right )


{-|

    fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] )
        |> indexedMap FromFirst (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], [ 2, 3, 4, 5 ] )

    fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] )
        |> indexedMap FromLast (\_ i _ -> i)
        --> fromTuple ( [ 5, 4 ], [ 3, 2, 1, 0 ] )

    fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] )
        |> indexedMap FromSplit (\_ i _ -> i)
        --> fromTuple ( [ 1, 0 ], [ 0, 1, 2, 3 ] )

    fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ] )
        |> indexedMap FromEdges (\_ i _ -> i)
        --> fromTuple ( [ 0, 1 ], [ 3, 2, 1, 0 ] )

-}
indexedMap : IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMap indexMethod f (( left, right ) as zipper) =
    ( List.map2 (\i elem -> f Left i elem) (getIndexesLeftHelper_ indexMethod zipper) left
    , List.map2 (\i elem -> f Right i elem) (getIndexesRightHelper_ indexMethod zipper) right
    )


{-| -}
indexedMapLeft : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapLeft indexMethod f (( left, right ) as zipper) =
    ( List.map2 (\i elem -> f Left i elem) (getIndexesLeftHelper_ indexMethod zipper) left
    , right
    )


{-| -}
indexedMapRight : IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a
indexedMapRight indexMethod f (( left, right ) as zipper) =
    ( left
    , List.map2 (\i elem -> f Right i elem) (getIndexesRightHelper_ indexMethod zipper) right
    )


{-| -}
getIndexesLeftHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesLeftHelper_ indexMethod ( left, right ) =
    case indexMethod of
        FromFirst ->
            List.range 0 (List.length left - 1) |> List.reverse

        FromLast ->
            List.range (List.length right) (List.length right + List.length left)

        FromSplit ->
            List.range 0 (List.length left - 1)

        FromEdges ->
            List.map2
                min
                (List.range 0 (List.length left - 1) |> List.reverse)
                (List.range (List.length right + 1) (List.length right + 1 + List.length left))


{-| -}
getIndexesRightHelper_ : IndexMethod -> Zipper a -> List Int
getIndexesRightHelper_ indexMethod ( left, right ) =
    case indexMethod of
        FromFirst ->
            List.range (List.length left) (List.length right + List.length left)

        FromLast ->
            List.range 0 (List.length right - 1) |> List.reverse

        FromSplit ->
            List.range 0 (List.length right - 1)

        FromEdges ->
            List.map2
                min
                (List.range (List.length left + 1) (List.length right + 1 + List.length left))
                (List.range 0 (List.length right - 1) |> List.reverse)


{-| -}
update : (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b
update fLeft fRight ( left, right ) =
    ( fLeft left, fRight right )


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft fLeft ( left, right ) =
    ( fLeft left, right )


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight fRight ( left, right ) =
    ( left, fRight right )


{-| -}
updateAt : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAt i f ( left, right ) =
    updateAtRelative (i - List.length left) f ( left, right )


{-| -}
tryUpdateAt : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAt i f ( left, right ) =
    tryUpdateAtRelative (i - List.length left) f ( left, right )


{-| -}
updateAtRelative : Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)
updateAtRelative i f ( left, right ) =
    case compare i 0 of
        EQ ->
            Nothing

        LT ->
            case List.Extra.getAt (i * -1) left of
                Just _ ->
                    Just ( List.Extra.updateAt (i * -1) f left, right )

                Nothing ->
                    Nothing

        GT ->
            case List.Extra.getAt i right of
                Just _ ->
                    Just ( left, List.Extra.updateAt i f right )

                Nothing ->
                    Nothing


{-| -}
tryUpdateAtRelative : Int -> (a -> a) -> Zipper a -> Zipper a
tryUpdateAtRelative i f zipper =
    updateAtRelative i f zipper
        |> Maybe.withDefault zipper


{-| -}
filter : (a -> Bool) -> Zipper a -> Zipper a
filter f ( left, right ) =
    ( List.filter f left, List.filter f right )


{-| -}
filterLeft : (a -> Bool) -> Zipper a -> Zipper a
filterLeft f ( left, right ) =
    ( List.filter f left, right )


{-| -}
filterRight : (a -> Bool) -> Zipper a -> Zipper a
filterRight f ( left, right ) =
    ( left, List.filter f right )


{-| -}
indexedFilter : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilter indexMethod f (( left, right ) as zipper) =
    ( List.map2 (\i elem -> ( f Left i elem, elem )) (getIndexesLeftHelper_ indexMethod zipper) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , List.map2 (\i elem -> ( f Right i elem, elem )) (getIndexesRightHelper_ indexMethod zipper) right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedFilterLeft : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterLeft indexMethod f (( left, right ) as zipper) =
    ( left
    , List.map2 (\i elem -> ( f Right i elem, elem )) (getIndexesRightHelper_ indexMethod zipper) right
        |> List.filter Tuple.first
        |> List.map Tuple.second
    )


{-| -}
indexedFilterRight : IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a
indexedFilterRight indexMethod f (( left, right ) as zipper) =
    ( List.map2 (\i elem -> ( f Left i elem, elem )) (getIndexesLeftHelper_ indexMethod zipper) left
        |> List.filter Tuple.first
        |> List.map Tuple.second
    , right
    )


{-| -}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft ( left, right ) =
    case left of
        head :: tail ->
            Just ( tail, head :: right )

        [] ->
            Nothing


{-| -}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    zipper
        |> moveLeft
        |> Maybe.withDefault zipper


{-| -}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight ( left, right ) =
    case right of
        head :: tail ->
            Just ( head :: left, tail )

        [] ->
            Nothing


{-| -}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    zipper
        |> moveRight
        |> Maybe.withDefault zipper


{-| -}
insertFirst : a -> Zipper a -> Zipper a
insertFirst elem ( left, right ) =
    ( left ++ [ elem ], right )


{-| Set selection to first element
-}
moveToFirst : Zipper a -> Zipper a
moveToFirst ( left, right ) =
    ( [], List.reverse left ++ right )


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


{-| Set selection to last element
-}
moveToLast : Zipper a -> Zipper a
moveToLast ( left, right ) =
    ( List.reverse right ++ left, [] )


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


{-| -}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> moveToFirst
        |> updateRight List.sort
        |> moveToN (position zipper)
        |> Maybe.withDefault zipper


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
reverse : Zipper a -> Zipper a
reverse ( left, right ) =
    ( List.reverse right, List.reverse left )


{-| -}
reverseLeft : Zipper a -> Zipper a
reverseLeft ( left, right ) =
    ( List.reverse left, right )


{-| -}
reverseRight : Zipper a -> Zipper a
reverseRight ( left, right ) =
    ( left, List.reverse right )


{-| -}
swapTwo : Int -> Int -> Zipper a -> Maybe (Zipper a)
swapTwo i j zipper =
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


{-| -}
indexAbsoluteCheck : Zipper a -> Int -> Maybe Position
indexAbsoluteCheck ( left, right ) i =
    if i >= 0 && i < length ( left, [] ) then
        Just Left

    else if i >= length ( left, [] ) && i < length ( left, right ) then
        Just Right

    else
        Nothing


{-| -}
indexRelativeCheck : Zipper a -> Int -> Maybe Position
indexRelativeCheck ( left, right ) i =
    if i == 0 then
        Nothing

    else if i > 0 && i < List.length right then
        Just Right

    else if i < 0 && i > (List.length left * -1) then
        Just Left

    else
        Nothing


{-| -}
indexAbsoluteToRelative : Zipper a -> Int -> Int
indexAbsoluteToRelative ( left, _ ) i =
    i * -1 + List.length left


{-| -}
indexAbsoluteToRelativeCheck : Zipper a -> Int -> Maybe Int
indexAbsoluteToRelativeCheck zipper i =
    indexAbsoluteToRelative zipper i
        |> (\j ->
                if indexAbsoluteCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )


{-| -}
indexRelativeToAbsolute : Zipper a -> Int -> Int
indexRelativeToAbsolute ( left, _ ) i =
    (i - List.length left) * -1


{-| -}
indexRelativeToAbsoluteCheck : Zipper a -> Int -> Maybe Int
indexRelativeToAbsoluteCheck zipper i =
    indexRelativeToAbsolute zipper i
        |> (\j ->
                if indexRelativeCheck zipper j == Nothing then
                    Nothing

                else
                    Just j
           )
