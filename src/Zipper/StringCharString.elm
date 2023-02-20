module Zipper.StringCharString exposing
    ( Zipper
    , singleton
    , moveLeft
    )

{-| A zipper type that is stores a single selected character, with a list of characters on either side. Probably most useful for terminal-like interfaces where the cursor selects a character rather than lying between characters.

A special case of [`Zipper.ListElemList`](Zipper.ListElemList) for when the elements are `Char`, and some helper functions


# Definition

@docs Zipper


# Create

@docs singleton


# Move

@docs moveLeft

-}

import Result.Extra
import Zipper.ListElemList


{-| A list type that must contain at least one element
-}
type alias Zipper =
    ( List Char, Char, List Char )


{-| Create a new `Zipper`

    singleton 'a' == ( [], 'a', [] )

-}
singleton : Char -> Zipper
singleton elem =
    ( [], elem, [] )


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> moveLeft == Ok ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> moveLeft == Err ( [], 3, [ 4, 5 ] )

-}
moveLeft : Zipper -> Result Zipper Zipper
moveLeft zipper =
    Zipper.ListElemList.moveLeft zipper


{-| Attempt to move selection to left, return unchanged zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft == ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft == ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper -> Zipper
tryMoveLeft zipper =
    Zipper.ListElemList.moveLeft zipper
        |> Result.Extra.merge
