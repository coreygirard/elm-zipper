module Zipper.StringCharString exposing
    ( Zipper
    , singleton
    , moveLeft
    )

{-| A zipper type that is stores a single selected character, with a list of characters on either side. Probably most useful for terminal-like interfaces where the cursor selects a character rather than lying between characters.

A special case of [`Zipper.ListElemList`](Zipper.ListElemList) for when the elements are `Char`, and some helper functions

  - Special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced)
  - Special case of [`Zipper.ListElemList`](Zipper.ListElemList)


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
    Zipper.ListElemList.singleton elem


{-| Create a new `Zipper`

    singleton 'a' == ( [], 'a', [] )

-}
toStrings : Zipper -> ( String, String, String )
toStrings ( a, b, c ) =
    ( a |> List.reverse |> String.fromList
    , [ b ] |> String.fromList
    , c |> String.fromList
    )


{-| Create a new `Zipper`

    singleton 'a' == ( [], 'a', [] )

-}
toString : Zipper -> String
toString zipper =
    zipper
        |> Zipper.ListElemList.toList
        |> String.fromList


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> moveLeft == Ok ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> moveLeft == Err ( [], 3, [ 4, 5 ] )

-}
moveLeft : Zipper -> Maybe Zipper
moveLeft zipper =
    Zipper.ListElemList.moveLeft zipper


{-| Attempt to move selection to left, return unchanged zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft == ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft == ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper -> Zipper
tryMoveLeft zipper =
    Zipper.ListElemList.moveLeft zipper
        |> Maybe.withDefault zipper
