module Zipper3.SelectList exposing
    ( Zipper
    , empty
    , moveLeftToLeft
    )

{-| A zipper with a list of selected elements.

Note: if you don't need to transform elements when they move between selected and deselected, you should use `Zipper3.SelectList.Simple` instead. It has a cleaner API allowed by this special case.


# Definition

@docs Zipper


# Create

@docs empty


# Move

@docs moveLeftToLeft

-}


{-| A list type that must contain at least one element
-}
type alias Zipper a b =
    ( List b, List a, List b )


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper a b
empty =
    ( [], [], [] )


{-| Attempt to move left edge of selection to left
-}
moveLeftToLeft : (a -> b) -> (b -> a) -> Zipper a b -> Result (Zipper a b) (Zipper a b)
moveLeftToLeft fAB fBA zipper =
    case zipper of
        ( head :: tail, selected, right ) ->
            Ok ( tail, fBA head :: selected, right )

        ( [], selected, right ) ->
            Err zipper
