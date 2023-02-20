module Zipper.StringStringString exposing
    ( Zipper
    , empty
    )

{-| A special case of `Zipper3.SelectList.Simple` for when the elements are `Char`, and some helper functions


# Definition

@docs Zipper


# Create

@docs empty

-}

import Zipper.ListListList


{-| A list type that must contain at least one element
-}
type alias Zipper =
    ( List Char, List Char, List Char )


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper
empty =
    ( [], [], [] )


{-| Attempt to move left edge of selection to left

    ( [ 2, 1 ], [ 3, 4 ], [ 5, 6 ] ) |> moveLeftToLeft == Ok ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] )

    ( [], [ 3, 4 ], [ 5, 6 ] ) |> moveLeftToLeft == Err ( [], [ 3, 4 ], [ 5, 6 ] )

-}
moveLeftToLeft : Zipper -> Result Zipper Zipper
moveLeftToLeft zipper =
    Zipper.ListListList.moveLeftToLeft zipper


getLeft : Zipper -> String
getLeft zipper =
    Zipper.ListListList.getLeft zipper
        |> String.fromList