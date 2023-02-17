module Zipper3.SelectElem.Simple exposing
    ( Zipper
    , singleton
    , moveLeft
    )

{-| A special case of `Zipper3.SelectElem.Zipper` where all elements have the same type.


# Definition

@docs Zipper


# Create

@docs singleton


# Move

@docs moveLeft

-}

import Zipper3.SelectElem


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    Zipper3.SelectElem.Zipper a a


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
singleton : a -> Zipper a
singleton elem =
    ( [], elem, [] )


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> moveLeft == Ok ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> moveLeft == Err ( [], 3, [ 4, 5 ] )

-}
moveLeft : Zipper a -> Result (Zipper a) (Zipper a)
moveLeft zipper =
    Zipper3.SelectElem.moveLeft identity identity zipper
