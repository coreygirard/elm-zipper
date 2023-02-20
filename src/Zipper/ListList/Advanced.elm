module Zipper.ListList.Advanced exposing
    ( Zipper
    , empty
    , moveToRight, moveToLeft, tryMoveToRight, tryMoveToLeft
    )

{-| A library for a template type.


# Definition

@docs Zipper


# Create

@docs empty


# Modify

@docs moveToRight, moveToLeft, tryMoveToRight, tryMoveToLeft

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


map : (a1 -> a2) -> (b1 -> b2) -> Zipper a1 b1 -> Zipper a2 b2
map fA fB ( left, right ) =
    ( List.map fA left, List.map fB right )


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
