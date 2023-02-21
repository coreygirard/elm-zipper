module Zipper.ListListList exposing
    ( Zipper
    , empty, fromTuple, fromZipperListList, fromZipperListElemList
    , toTuple, toList, toZipperListList, toZipperListElemList
    , length, lengthLeft, lengthSelection, lengthRight, positionLeft, positionRight, positionLeftFromEnd, positionRightFromEnd
    , getLeft, getSelection, getRight, getAtRelativeToLeftSplit, getAtRelativeToRightSplit
    , setLeft, setSelection, setRight, setAtRelativeToLeftSplit, setAtRelativeToRightSplit
    , map, mapLeft, mapSelection, mapRight, IndexMethod, Position, indexedMap, indexedMapLeft, indexedMapSelection, indexedMapRight
    , update, updateLeft, updateSelection, updateRight, updateAtRelativeToLeftSplit, updateAtRelativeToRightSplit
    , filter, filterLeft, filterSelection, filterRight, indexedFilter, indexedFilterLeft, indexedFilterSelection, indexedFilterRight
    , moveLeftToLeft, tryMoveLeftToLeft, moveLeftToRight, tryMoveLeftToRight, moveRightToLeft, tryMoveRightToLeft, moveRightToRight, tryMoveRightToRight
    , insertFirst, insertLast, insertLeftOfLeftSplit, insertRightOfLeftSplit, insertLeftOfRightSplit, insertRightOfRightSplit
    , sort, sortBy, sortWith
    , reverse, reverseLeft, reverseSelected, reverseRight
    , swapTwo
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

-}

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
getAt i zipper =
    getAtRelative (i - position zipper) zipper


{-| -}
getAtRelativeToLeftSplit : Int -> Zipper a -> Maybe a
getAtRelativeToLeftSplit i ( left, right ) =
    if i < 0 then
        left
            |> List.Extra.getAt (List.length left - i)

    else
        right
            |> List.Extra.getAt (i - List.length left)


{-| -}
getAtRelativeToRightSplit : Int -> Zipper a -> Maybe a
getAtRelativeToRightSplit i ( left, right ) =
    if i < 0 then
        left
            |> List.Extra.getAt (List.length left - i)

    else
        right
            |> List.Extra.getAt (i - List.length left)


{-| -}
setLeft : Zipper a -> Zipper a
setLeft zipper =
    zipper


{-| -}
setSelection : Zipper a -> Zipper a
setSelection zipper =
    zipper


{-| -}
setRight : Zipper a -> Zipper a
setRight zipper =
    zipper


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
map : Zipper a -> Zipper a
map zipper =
    zipper


{-| -}
mapLeft : Zipper a -> Zipper a
mapLeft zipper =
    zipper


{-| -}
mapSelection : Zipper a -> Zipper a
mapSelection zipper =
    zipper


{-| -}
mapRight : Zipper a -> Zipper a
mapRight zipper =
    zipper


{-| -}
indexedMap : Zipper a -> Zipper a
indexedMap zipper =
    zipper


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
update : Zipper a -> Zipper a
update zipper =
    zipper


{-| -}
updateLeft : Zipper a -> Zipper a
updateLeft zipper =
    zipper


{-| -}
updateSelection : Zipper a -> Zipper a
updateSelection zipper =
    zipper


{-| -}
updateRight : Zipper a -> Zipper a
updateRight zipper =
    zipper


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

    fromTuple ( [ 2, 1 ], [ 3, 4 ], [ 5, 6 ] )
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
