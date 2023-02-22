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
        , describe "Zipper.List.indexRanges"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListList.fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ] )
                        |> Zipper.ListList.indexRanges
                        |> Expect.equal
                            { fromFirst =
                                { left = [ 2, 1, 0 ]
                                , right = [ 3, 4, 5 ]
                                }
                            , fromLast =
                                { left = [ 3, 4, 5 ]
                                , right = [ 2, 1, 0 ]
                                }
                            , fromSplit =
                                { left = [ -1, -2, -3 ]
                                , right = [ 1, 2, 3 ]
                                }
                            , fromEdges =
                                { left = [ 2, 1, 0 ]
                                , right = [ 2, 1, 0 ]
                                }
                            }
            ]
        ]
