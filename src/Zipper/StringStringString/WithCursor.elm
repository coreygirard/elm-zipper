module Zipper.StringStringString.WithCursor exposing
    ( Zipper(..)
    , empty
    )

{-| A special case of `Zipper3.SelectList.Simple` for when the elements are `Char`, and some helper functions


# Definition

@docs Zipper


# Create

@docs empty

-}

import List.Extra


{-| A list type that must contain at least one element
-}
type Zipper
    = CursorLeft ( List Char, ( Char, List Char ), List Char )
    | CursorRight ( List Char, ( List Char, Char ), List Char )
    | CursorNone ( List Char, List Char )


{-| Create a new `Zipper`

    empty --> ( [], [] )

-}
empty : Zipper
empty =
    CursorNone ( [], [] )


arrowLeft : Zipper -> Zipper
arrowLeft zipper =
    case zipper of
        CursorLeft ( a, ( b1, b2 ), c ) ->
            CursorNone ( a, [ b1 ] ++ b2 ++ c )

        CursorRight ( a, ( b1, b2 ), c ) ->
            CursorNone ( a, b1 ++ [ b2 ] ++ c )

        CursorNone ( head :: tail, c ) ->
            CursorNone ( tail, head :: c )

        CursorNone ( [], _ ) ->
            zipper


arrowLeftWithShift : Zipper -> Zipper
arrowLeftWithShift zipper =
    case zipper of
        CursorNone ( [], _ ) ->
            zipper

        CursorNone ( head :: tail, c ) ->
            CursorLeft ( tail, ( head, [] ), c )

        CursorLeft ( [], _, _ ) ->
            zipper

        CursorLeft ( head :: tail, ( b1, b2 ), c ) ->
            CursorLeft ( tail, ( head, b1 :: b2 ), c )

        CursorRight ( a, ( b1, b2 ), c ) ->
            case List.Extra.unconsLast b1 of
                Just ( last, rest ) ->
                    CursorRight ( a, ( rest, last ), b2 :: c )

                Nothing ->
                    CursorNone ( a, b2 :: c )


arrowRight : Zipper -> Zipper
arrowRight zipper =
    case zipper of
        CursorLeft ( a, ( b1, b2 ), c ) ->
            CursorNone ( [ b1 ] ++ b2 ++ a, c )

        CursorRight ( a, ( b1, b2 ), c ) ->
            CursorNone ( b1 ++ [ b2 ] ++ a, c )

        CursorNone ( a, head :: tail ) ->
            CursorNone ( head :: a, tail )

        CursorNone ( _, [] ) ->
            zipper


arrowRightWithShift : Zipper -> Zipper
arrowRightWithShift zipper =
    case zipper of
        CursorNone ( _, [] ) ->
            zipper

        CursorNone ( a, head :: tail ) ->
            CursorRight ( tail, ( [], head ), tail )

        CursorRight ( _, _, [] ) ->
            zipper

        CursorRight ( a, ( b1, b2 ), head :: tail ) ->
            CursorRight ( a, ( b1 ++ [ b2 ], head ), tail )

        CursorLeft ( a, ( b1, head :: tail ), c ) ->
            CursorLeft ( b1 :: a, ( head, tail ), c )

        CursorLeft ( a, ( b1, [] ), c ) ->
            CursorNone ( b1 :: a, c )


typeKey : Char -> Zipper -> Zipper
typeKey key zipper =
    case zipper of
        CursorLeft ( a, _, c ) ->
            CursorNone ( key :: a, c )

        CursorRight ( a, _, c ) ->
            CursorNone ( key :: a, c )

        CursorNone ( a, c ) ->
            CursorNone ( key :: a, c )
