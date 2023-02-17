module Zipper2Test exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper2 exposing (..)


suite : Test
suite =
    describe "Zipper2"
        [ describe "Zipper2.empty"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper2.empty
                        |> Expect.equal ( [], [] )
            ]
        ]
