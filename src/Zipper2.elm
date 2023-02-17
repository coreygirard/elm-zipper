module Zipper2 exposing
    ( Zipper
    , empty
    )

{-| A library for a template type.


# Definition

@docs Zipper


# Create

@docs empty

-}

--import List.Extra


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, List a )


{-| Create a new `Zipper2`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper a
empty =
    ( [], [] )
