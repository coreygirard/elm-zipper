module Zipper.ListListListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListListList exposing (..)


suite : Test
suite =
    describe "Zipper.ListListList"
        [ describe "Zipper.ListListList.absoluteIndexToPosDists"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListListList.fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )
                    in
                    List.map
                        (Zipper.ListListList.absoluteIndexToPosDists zipper)
                        (List.range 0 8)
                        |> Expect.equal
                            [ Just ( Left, { fromLeft = 0, fromRight = 3 } )
                            , Just ( Left, { fromLeft = 1, fromRight = 2 } )
                            , Just ( Left, { fromLeft = 2, fromRight = 1 } )
                            , Just ( Selection, { fromLeft = 0, fromRight = 3 } )
                            , Just ( Selection, { fromLeft = 1, fromRight = 2 } )
                            , Just ( Selection, { fromLeft = 2, fromRight = 1 } )
                            , Just ( Right, { fromLeft = 0, fromRight = 3 } )
                            , Just ( Right, { fromLeft = 1, fromRight = 2 } )
                            , Just ( Right, { fromLeft = 2, fromRight = 1 } )
                            ]
            ]
        ]
