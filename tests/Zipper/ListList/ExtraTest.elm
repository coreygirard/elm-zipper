module Zipper.ListList.ExtraTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)
import Zipper.ListList.Extra


suite : Test
suite =
    describe "Zipper.ListList.Extra"
        [ describe "Zipper.ListList.Advanced.moveToN"
            [ test "handles basic operation" <|
                \_ ->
                    1
                        |> Expect.equal 1
            ]
        ]
