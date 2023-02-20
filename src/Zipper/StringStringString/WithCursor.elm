module Zipper.StringStringString.WithCursor exposing
    ( Zipper(..)
    , empty
    , arrowLeft, arrowLeftWithShift, arrowRight, arrowRightWithShift, typeKey
    )

{-| A special case of `Zipper3.SelectList.Simple` for when the elements are `Char`, and some helper functions


# Definition

@docs Zipper


# Create

@docs empty


# Apply key

@docs arrowLeft, arrowLeftWithShift, arrowRight, arrowRightWithShift, typeKey

-}

import List.Extra


{-| A list type that must contain at least one element
-}
type Zipper
    = CursorLeft ( List Char, ( Char, List Char ), List Char )
    | CursorRight ( List Char, ( List Char, Char ), List Char )
    | CursorNone ( List Char, List Char )


{-| Create a new `Zipper`

    empty --> CursorNone ( [], [] )

-}
empty : Zipper
empty =
    CursorNone ( [], [] )


{-| Matches what happens when hitting the arrow left key _without_ holding Shift.

    -- shown as String instead of List Char for readability
    CursorNone ( "ab", "cd" )
        |> arrowLeft
        == CursorNone ( "a", "bcd" )

    CursorNone ( "", "cd" )
        |> arrowLeft
        == CursorNone ( "", "cd" )

    CursorLeft ( "ab", "cde", "fg" )
        |> arrowLeft
        == CursorNone ( "ab", "cdefg" )

    CursorRight ( "ab", "cde", "fg" )
        |> arrowLeft
        == CursorNone ( "ab", "cdefg" )

-}
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


{-| Matches what happens when hitting the arrow left key _while_ holding Shift.

    -- shown as String instead of List Char for readability
    CursorNone ( "ab", "cd" )
        |> arrowLeftWithShift
        == CursorLeft ( "a", "b", "cd" )

    CursorNone ( "", "cd" )
        |> arrowLeftWithShift
        == CursorNone ( "", "cd" )

    CursorLeft ( "ab", "cde", "fg" )
        |> arrowLeftWithShift
        == CursorLeft ( "a", "bcde", "fg" )

    CursorLeft ( "", "cde", "fg" )
        |> arrowLeftWithShift
        == CursorLeft ( "", "cde", "fg" )

    CursorRight ( "ab", "cde", "fg" )
        |> arrowLeftWithShift
        == CursorNone ( "ab", "cd", "efg" )

-}
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


{-| Matches what happens when hitting the arrow right key _without_ holding Shift.

    -- shown as String instead of List Char for readability
    CursorNone ( "ab", "cd" )
        |> arrowRight
        == CursorNone ( "abc", "d" )

    CursorNone ( "ab", "" )
        |> arrowRight
        == CursorNone ( "ab", "" )

    CursorLeft ( "ab", "cde", "fg" )
        |> arrowRight
        == CursorNone ( "abcde", "fg" )

    CursorRight ( "ab", "cde", "fg" )
        |> arrowRight
        == CursorNone ( "abcde", "fg" )

-}
arrowRight : Zipper -> Zipper
arrowRight zipper =
    case zipper of
        CursorLeft ( a, ( b1, b2 ), c ) ->
            CursorNone ( (List.reverse <| [ b1 ] ++ b2) ++ a, c )

        CursorRight ( a, ( b1, b2 ), c ) ->
            CursorNone ( (List.reverse <| b1 ++ [ b2 ]) ++ a, c )

        CursorNone ( a, head :: tail ) ->
            CursorNone ( head :: a, tail )

        CursorNone ( _, [] ) ->
            zipper


{-| Matches what happens when hitting the arrow right key _while_ holding Shift.

    -- shown as String instead of List Char for readability
    CursorNone ( "ab", "cd" )
        |> arrowRightWithShift
        == CursorLeft ( "a", "b", "cd" )

    CursorNone ( "ab", "" )
        |> arrowRightWithShift
        == CursorNone ( "", "cd" )

    CursorLeft ( "ab", "cde", "fg" )
        |> arrowRightWithShift
        == CursorLeft ( "abc", "de", "fg" )

    CursorRight ( "ab", "cde", "" )
        |> arrowRightWithShift
        == CursorLeft ( "ab", "cde", "" )

    CursorRight ( "ab", "cde", "fg" )
        |> arrowRightWithShift
        == CursorNone ( "ab", "cdef", "g" )

-}
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


{-| Matches what happens when hitting a non-arrow key

    -- shown as String instead of List Char for readability
    CursorNone ( "ab", "cd" )
        |> arrowRightWithShift "z"
        == CursorNone ( "abz", "cd" )

    CursorLeft ( "ab", "cde", "fg" )
        |> arrowRightWithShift
        == CursorNone ( "abz", "fg" )

    CursorRight ( "ab", "cde", "fg" )
        |> arrowRightWithShift
        == CursorNone ( "abz", "fg" )

-}
typeKey : Char -> Zipper -> Zipper
typeKey key zipper =
    case zipper of
        CursorLeft ( a, _, c ) ->
            CursorNone ( key :: a, c )

        CursorRight ( a, _, c ) ->
            CursorNone ( key :: a, c )

        CursorNone ( a, c ) ->
            CursorNone ( key :: a, c )
