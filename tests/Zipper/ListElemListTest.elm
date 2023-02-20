module Zipper.ListElemListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListElemList exposing (..)


suite : Test
suite =
    describe "Zipper.ListElemList"
        [ describe "Zipper.ListElemList.sortKeepElem"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 6, 3, 7 ], 4, [ 2, 1, 5, 2, 6, 4 ] )
                        |> Zipper.ListElemList.sortKeepElem
                        |> Expect.equal ( [ 1, 2, 2, 3 ], 4, [ 4, 5, 6, 6, 7 ] )
            ]
        , describe "Zipper.ListElemList.sortKeepIndex"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 6, 3, 7 ], 4, [ 2, 1, 5, 2, 6, 4 ] )
                        |> Zipper.ListElemList.sortKeepIndex
                        |> Expect.equal ( [ 1, 2, 2 ], 3, [ 4, 4, 5, 6, 6, 7 ] )
            ]
        ]
