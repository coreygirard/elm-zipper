module Zipper3.SelectList.Text.Cursor exposing
    ( Zipper(..)
    , empty
    )

{-| A special case of `Zipper3.SelectList.Simple` for when the elements are `Char`, and some helper functions


# Definition

@docs Zipper


# Create

@docs empty

-}


{-| A list type that must contain at least one element
-}
type Zipper
    = CursorLeft ( List Char, List Char, List Char )
    | CursorRight ( List Char, List Char, List Char )
    | CursorNone ( List Char, List Char )


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper
empty =
    CursorNone ( [], [] )
