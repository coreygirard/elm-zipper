module Zipper.ListList.ExtraTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)
import Zipper.ListList.Extra


suite : Test
suite =
    describe "Zipper.ListList.Extra"
        [ describe "Zipper.ListList.Extra.indexRanges"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ] )
                        |> Zipper.ListList.Extra.indexRanges
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
