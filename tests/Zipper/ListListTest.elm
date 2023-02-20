module Zipper.ListListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)


suite : Test
suite =
    describe "Zipper.ListList"
        [ describe "Zipper.ListList.empty"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListList.empty
                        |> Expect.equal ( [], [] )
            ]
        ]
