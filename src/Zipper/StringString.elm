module Zipper.StringString exposing
    ( Zipper
    , toStrings
    )

{-| A library for a template type.


# Definition

@docs Zipper


# Create

@docs toStrings

-}

import Zipper.ListList


{-| A list type that must contain at least one element
-}
type alias Zipper =
    ( List Char, List Char )


{-| Create a new `Zipper2`

    make "hello" == ( "hello", "hello" )

-}
toStrings : Zipper -> ( String, String )
toStrings ( left, right ) =
    ( String.fromList left, String.fromList right )
