module Zipper.ListList.Advanced exposing
    ( Zipper
    , empty
    , reverse, length, lengthLeft, lengthRight, position
    , getLeft, getRight
    , setLeft, setRight
    , insertAtFirst, insertAtLast, insertToLeft, insertToRight
    , updateLeft, updateRight
    , moveToRight, moveToLeft, tryMoveToRight, tryMoveToLeft, selectNth
    , map, mapLeft, mapRight
    )

{-| A library for a template type.

**Note**: If all zipper elements are of the same type, use [`Zipper.ListList`](Zipper.ListList) instead. It has a simpler API.

  - General case of [`Zipper.ListList`](Zipper.ListList)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper


# Create

@docs empty


# Utilities

@docs reverse, length, lengthLeft, lengthRight, position


# Get

@docs getLeft, getRight


# Set

@docs setLeft, setRight


# Insert

@docs insertAtFirst, insertAtLast, insertToLeft, insertToRight


# Update

@docs updateLeft, updateRight


# Move

@docs moveToRight, moveToLeft, tryMoveToRight, tryMoveToLeft, selectNth


# Map

@docs map, mapLeft, mapRight

-}

import Result.Extra


{-| A list type that must contain at least one element
-}
type alias Zipper a b =
    ( List a, List b )


{-| Create a new `Zipper`
-}
empty : Zipper a b
empty =
    ( [], [] )


{-| -}
map : (a1 -> a2) -> (b1 -> b2) -> Zipper a1 b1 -> Zipper a2 b2
map fA fB ( left, right ) =
    ( List.map fA left, List.map fB right )


{-| -}
reverse : Zipper a b -> Zipper b a
reverse ( left, right ) =
    ( right, left )


{-| -}
length : Zipper a b -> Int
length ( left, right ) =
    List.length left + List.length right


{-| -}
lengthLeft : Zipper a b -> Int
lengthLeft ( left, _ ) =
    List.length left


{-| -}
lengthRight : Zipper a b -> Int
lengthRight ( _, right ) =
    List.length right


{-| -}
position : Zipper a b -> Int
position ( left, _ ) =
    List.length left


{-| Attempt to move split to left
-}
moveToLeft : (a -> b) -> Zipper a b -> Result (Zipper a b) (Zipper a b)
moveToLeft fAB zipper =
    case zipper of
        ( head :: tail, after ) ->
            Ok ( tail, fAB head :: after )

        ( [], after ) ->
            Err zipper


{-| Attempt to move split to left, return unchanged zipper on failure
-}
tryMoveToLeft : (a -> b) -> Zipper a b -> Zipper a b
tryMoveToLeft fAB zipper =
    moveToLeft fAB zipper
        |> Result.Extra.merge


{-| Attempt to move split to right
-}
moveToRight : (b -> a) -> Zipper a b -> Result (Zipper a b) (Zipper a b)
moveToRight fBA zipper =
    case zipper of
        ( before, head :: tail ) ->
            Ok ( fBA head :: before, tail )

        ( before, [] ) ->
            Err zipper


{-| Attempt to move split to right, return unchanged zipper on failure
-}
tryMoveToRight : (b -> a) -> Zipper a b -> Zipper a b
tryMoveToRight fBA zipper =
    moveToRight fBA zipper
        |> Result.Extra.merge


{-| -}
getLeft : Zipper a b -> List a
getLeft ( left, _ ) =
    List.reverse left


{-| -}
getRight : Zipper a b -> List b
getRight ( _, right ) =
    right


{-| -}
setLeft : List a -> Zipper a b -> Zipper a b
setLeft left ( _, right ) =
    ( List.reverse left, right )


{-| -}
setRight : List b -> Zipper a b -> Zipper a b
setRight right ( left, _ ) =
    ( left, right )


{-| -}
updateLeft : (List a -> List a) -> Zipper a b -> Zipper a b
updateLeft f ( left, right ) =
    ( left |> List.reverse |> f |> List.reverse, right )


{-| -}
updateRight : (List b -> List b) -> Zipper a b -> Zipper a b
updateRight f ( left, right ) =
    ( left, f right )


{-| -}
mapLeft : (a -> a) -> Zipper a b -> Zipper a b
mapLeft f ( left, right ) =
    ( List.map f left, right )


{-| -}
mapRight : (b -> b) -> Zipper a b -> Zipper a b
mapRight f ( left, right ) =
    ( left, List.map f right )


{-| -}
insertAtFirst : a -> Zipper a b -> Zipper a b
insertAtFirst elem ( left, right ) =
    ( left ++ [ elem ], right )


{-| -}
insertAtLast : b -> Zipper a b -> Zipper a b
insertAtLast elem ( left, right ) =
    ( left, right ++ [ elem ] )


{-| -}
insertToLeft : a -> Zipper a b -> Zipper a b
insertToLeft elem ( left, right ) =
    ( [ elem ] ++ left, right )


{-| -}
insertToRight : b -> Zipper a b -> Zipper a b
insertToRight elem ( left, right ) =
    ( left, [ elem ] ++ right )


type Position
    = BeforeSplit
    | AfterSplit


{-| -}
indexedMapRelative :
    (Position -> Int -> a1 -> a2)
    -> (Position -> Int -> b1 -> b2)
    -> Zipper a1 b1
    -> Zipper a2 b2
indexedMapRelative fA fB ( left, right ) =
    ( List.indexedMap (\i elem -> fA BeforeSplit (i * -1) elem) left
    , List.indexedMap (\i elem -> fB AfterSplit i elem) right
    )


{-| -}
filter : (a -> Bool) -> (b -> Bool) -> Zipper a b -> Zipper a b
filter fA fB ( left, right ) =
    ( List.filter fA left
    , List.filter fB right
    )


{-| -}
splitAtFirst : (a -> b) -> Zipper a b -> Zipper a b
splitAtFirst fAB ( left, right ) =
    ( [], (left |> List.reverse |> List.map fAB) ++ right )


maybeAssert : (a -> Bool) -> a -> Maybe a
maybeAssert fPred data =
    if fPred data then
        Just data

    else
        Nothing


{-| Attempt to move the split by specifying the length of the resulting left list. If the split would be invalid, eg `n < 0` or `n > length zipper`, returns `Nothing`.

    ( [ 2, 1 ], [ 3, 4 ] )
        |> selectNth identity identity -1
        == Nothing

    ( [ 2, 1 ], [ 3, 4 ] )
        |> selectNth identity identity 1
        == Just ( [ 1 ], [ 2, 3, 4 ] )

    ( [ 2, 1 ], [ 3, 4 ] )
        |> selectNth identity identity 4
        == Just ( [ 4, 3, 2, 1 ], [] )

-}
selectNth : (a -> b) -> (b -> a) -> Int -> Zipper a b -> Maybe (Zipper a b)
selectNth fAB fBA n ( left, right ) =
    if n < 0 then
        Nothing

    else if n > length ( left, right ) then
        Nothing

    else
        let
            position_ =
                position ( left, right )
        in
        case compare n position_ of
            EQ ->
                Just ( left, right )

            LT ->
                moveToLeftN fAB (position_ - n) ( left, right )

            GT ->
                moveToRightN fBA (n - position_) ( left, right )


{-| -}
moveToLeftN : (a -> b) -> Int -> Zipper a b -> Maybe (Zipper a b)
moveToLeftN f n ( left, right ) =
    if n <= 0 then
        Just ( left, right )

    else
        case left of
            head :: tail ->
                moveToLeftN f (n - 1) ( tail, f head :: right )

            [] ->
                Nothing


{-| -}
moveToRightN : (b -> a) -> Int -> Zipper a b -> Maybe (Zipper a b)
moveToRightN f n ( left, right ) =
    if n <= 0 then
        Just ( left, right )

    else
        case right of
            head :: tail ->
                moveToRightN f (n - 1) ( f head :: left, tail )

            [] ->
                Nothing


{-| -}
splitAtLast : (b -> a) -> Zipper a b -> Zipper a b
splitAtLast fBA ( left, right ) =
    ( (right |> List.reverse |> List.map fBA) ++ left, [] )
