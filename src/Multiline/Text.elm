module Multiline.Text exposing
    ( Zipper
    , empty
    )

{-| TODO: investigate using ports to get the cursor positions in a textbox


# Definition

@docs Zipper


# Create

@docs empty

-}

--import List.Extra


{-| A list type that must contain at least one element
-}
type Zipper
    = CursorNone
        { beforeLines : List (List Char)
        , beforeFragment : List Char
        , afterFragment : List Char
        , afterLines : List (List Char)
        }
    | CursorSingleLine
        Cursor
        { beforeLines : List (List Char)
        , beforeFragment : List Char
        , selection : List Char
        , afterFragment : List Char
        , afterLines : List (List Char)
        }
    | CursorMultiLine
        Cursor
        { beforeLines : List (List Char)
        , beforeFragment : List Char
        , selectionLeftFragment : List Char
        , selectionLines : List (List Char)
        , selectionRightFragment : List Char
        , afterFragment : List Char
        , afterLines : List (List Char)
        }


type Cursor
    = CursorLeft
    | CursorRight


{-| Create a new `Zipper2`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper
empty =
    CursorNone
        { beforeLines = []
        , beforeFragment = []
        , afterFragment = []
        , afterLines = []
        }
