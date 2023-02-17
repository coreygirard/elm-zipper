module Zipper2.Text exposing
    ( Zipper
    , toStrings
    )

{-| A library for a template type.


# Definition

@docs Zipper


# Create

@docs toStrings

-}

import Zipper2


{-| A list type that must contain at least one element
-}
type alias Zipper =
    Zipper2.Zipper Char


{-| Create a new `Zipper2`

    make "hello" == ( "hello", "hello" )

-}
toStrings : Zipper -> ( String, String )
toStrings ( left, right ) =
    ( String.fromList left, String.fromList right )
