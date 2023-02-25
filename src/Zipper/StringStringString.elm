module Zipper.StringStringString exposing
    ( Zipper
    , empty
    )

{-| A special case of `Zipper3.SelectList.Simple` for when the elements are `Char`, and some helper functions

  - Special case of [`Zipper.ListListList.Advanced`](Zipper.ListListList.Advanced)
  - Special case of [`Zipper.ListListList`](Zipper.ListListList)


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
