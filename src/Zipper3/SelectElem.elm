module Zipper3.SelectElem exposing
    ( Zipper
    , singleton
    , moveLeft
    )

{-| A zipper with a single selected element.

Note: if you don't need to transform elements when they move between selected and deselected, you should use `Zipper3.SelectElem.Simple` instead. It has a cleaner API allowed by this special case.


# Definition

@docs Zipper


# Create

@docs singleton


# Move

@docs moveLeft

-}


{-| A list type that must contain at least one element
-}
type alias Zipper a b =
    ( List b, a, List b )


{-| Create a new `Zipper`

    make 0 == ( [], 0, [] )

-}
singleton : a -> Zipper a b
singleton elem =
    ( [], elem, [] )


{-| Attempt to move selection to left
-}
moveLeft : (a -> b) -> (b -> a) -> Zipper a b -> Result (Zipper a b) (Zipper a b)
moveLeft fAB fBA zipper =
    case zipper of
        ( head :: tail, selected, right ) ->
            Ok ( tail, fBA head, fAB selected :: right )

        ( [], selected, right ) ->
            Err zipper
