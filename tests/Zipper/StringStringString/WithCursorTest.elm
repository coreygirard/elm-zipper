module Zipper.StringStringString.WithCursorTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)
import Zipper.StringStringString.WithCursor exposing (Zipper(..))


suite : Test
suite =
    describe "Zipper.StringStringString.WithCursor"
        [ describe "Zipper.StringStringString.WithCursor.empty"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.StringStringString.WithCursor.empty
                        |> Expect.equal (CursorNone ( [], [] ))
            ]
        , describe "Zipper.StringStringString.WithCursor.arrowLeft"
            [ test "handles: CursorNone (\"ab\", \"cd\")" <|
                \_ ->
                    CursorNone ( [ 'b', 'a' ], [ 'c', 'd' ] )
                        |> Zipper.StringStringString.WithCursor.arrowLeft
                        |> Expect.equal (CursorNone ( [ 'a' ], [ 'b', 'c', 'd' ] ))
            , test "handles: CursorNone (\"\", \"cd\")" <|
                \_ ->
                    CursorNone ( [], [ 'c', 'd' ] )
                        |> Zipper.StringStringString.WithCursor.arrowLeft
                        |> Expect.equal (CursorNone ( [], [ 'c', 'd' ] ))
            , test "handles: CursorLeft (\"ab\", \"cde\", \"fg\")" <|
                \_ ->
                    CursorLeft ( [ 'b', 'a' ], ( 'c', [ 'd', 'e' ] ), [ 'f', 'g' ] )
                        |> Zipper.StringStringString.WithCursor.arrowLeft
                        |> Expect.equal (CursorNone ( [ 'b', 'a' ], [ 'c', 'd', 'e', 'f', 'g' ] ))
            , test "handles: CursorRight (\"ab\", \"cde\", \"fg\")" <|
                \_ ->
                    CursorRight ( [ 'b', 'a' ], ( [ 'c', 'd' ], 'e' ), [ 'f', 'g' ] )
                        |> Zipper.StringStringString.WithCursor.arrowLeft
                        |> Expect.equal (CursorNone ( [ 'b', 'a' ], [ 'c', 'd', 'e', 'f', 'g' ] ))
            ]
        , describe "Zipper.StringStringString.WithCursor.arrowRight"
            [ test "handles: CursorNone (\"ab\", \"cd\")" <|
                \_ ->
                    CursorNone ( [ 'b', 'a' ], [ 'c', 'd' ] )
                        |> Zipper.StringStringString.WithCursor.arrowRight
                        |> Expect.equal (CursorNone ( [ 'c', 'b', 'a' ], [ 'd' ] ))
            , test "handles: CursorNone (\"ab\", \"\")" <|
                \_ ->
                    CursorNone ( [ 'b', 'a' ], [] )
                        |> Zipper.StringStringString.WithCursor.arrowRight
                        |> Expect.equal (CursorNone ( [ 'b', 'a' ], [] ))
            , test "handles: CursorLeft (\"ab\", \"cde\", \"fg\")" <|
                \_ ->
                    CursorLeft ( [ 'b', 'a' ], ( 'c', [ 'd', 'e' ] ), [ 'f', 'g' ] )
                        |> Zipper.StringStringString.WithCursor.arrowRight
                        |> Expect.equal (CursorNone ( [ 'e', 'd', 'c', 'b', 'a' ], [ 'f', 'g' ] ))
            , test "handles: CursorRight (\"ab\", \"cde\", \"fg\")" <|
                \_ ->
                    CursorRight ( [ 'b', 'a' ], ( [ 'c', 'd' ], 'e' ), [ 'f', 'g' ] )
                        |> Zipper.StringStringString.WithCursor.arrowRight
                        |> Expect.equal (CursorNone ( [ 'e', 'd', 'c', 'b', 'a' ], [ 'f', 'g' ] ))
            ]
        ]
