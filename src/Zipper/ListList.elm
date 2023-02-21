module Zipper.ListList exposing
    ( Zipper
    , empty
    )

{-| A library for a template type.

If you're working with Chars, check out [`Zipper.StringString`](Zipper.StringString)

  - Special case of [`Zipper.ListList.Advanced`](Zipper.ListList.Advanced)
  - General case of [`Zipper.StringString`](Zipper.StringString)


# Definition

@docs Zipper


# Create

@docs empty

-}

import Zipper.ListList.Advanced


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, List a )


{-| Create a new `Zipper2`

    empty --> ( [], [] )

-}
empty : Zipper a
empty =
    ( [], [] )
