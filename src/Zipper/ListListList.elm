module Zipper.ListListList exposing
    ( Zipper
    , empty
    , getLeft
    , moveLeftToLeft
    )

{-| A special case of `Zipper3.SelectList.Zipper` where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringStringString`](Zipper.StringStringString)

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper


# Create

@docs empty


# Get

@docs getLeft


# Move

@docs moveLeftToLeft

-}

import Zipper.ListListList.Advanced as Adv


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, List a, List a )


{-| Create a new `Zipper`

    empty --> ( [], [], [] )

-}
empty : Zipper a
empty =
    ( [], [], [] )


{-| Attempt to move left edge of selection to left

    ( [ 2, 1 ], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Ok ( [ 1 ], [ 2, 3, 4 ], [ 5, 6 ] )

    ( [], [ 3, 4 ], [ 5, 6 ] )
        |> moveLeftToLeft
        --> Err ( [], [ 3, 4 ], [ 5, 6 ] )

-}
moveLeftToLeft : Zipper a -> Result (Zipper a) (Zipper a)
moveLeftToLeft zipper =
    Adv.moveLeftToLeft identity zipper


{-| Set selection to last element
-}
getLeft : Zipper a -> List a
getLeft zipper =
    Adv.getLeft zipper
