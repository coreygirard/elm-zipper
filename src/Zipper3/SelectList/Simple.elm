module Zipper3.SelectList.Simple exposing
    ( Zipper
    , empty
    , moveLeftToLeft
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.


# Definition

@docs Zipper


# Create

@docs empty


# Move

@docs moveLeftToLeft

-}

import Zipper3.SelectList


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    Zipper3.SelectList.Zipper a a


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper a
empty =
    ( [], [], [] )


{-| Attempt to move left edge of selection to left

    ( [ 2, 1 ], [ 3, 4 ], [ 5, 6 ] ) |> moveLeftToLeft == Ok ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] )

    ( [], [ 3, 4 ], [ 5, 6 ] ) |> moveLeftToLeft == Err ( [], [ 3, 4 ], [ 5, 6 ] )

-}
moveLeftToLeft : Zipper a -> Result (Zipper a) (Zipper a)
moveLeftToLeft zipper =
    Zipper3.SelectList.moveLeftToLeft identity identity zipper
