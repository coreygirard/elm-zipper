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
                            [ Just ( Left, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Left, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Left, { fromLeft = 2, fromRight = 0 } )
                            , Just ( Selected, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Selected, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Selected, { fromLeft = 2, fromRight = 0 } )
                            , Just ( Right, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Right, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Right, { fromLeft = 2, fromRight = 0 } )
                            ]
            , describe "Zipper.ListListList.indexRanges"
                [ test "handles basic operation" <|
                    \_ ->
                        Zipper.ListListList.fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )
                            |> Zipper.ListListList.indexRanges
                            |> Expect.equal
                                { fromFirst =
                                    { left = [ 0, 1, 2 ]
                                    , selected = [ 3, 4, 5 ]
                                    , right = [ 6, 7, 8 ]
                                    }
                                , fromLast =
                                    { left = [ 8, 7, 6 ]
                                    , selected = [ 5, 4, 3 ]
                                    , right = [ 2, 1, 0 ]
                                    }
                                , fromLeftSplit =
                                    { left = [ -3, -2, -1 ]
                                    , selected = [ 1, 2, 3 ]
                                    , right = [ 4, 5, 6 ]
                                    }
                                , fromRightSplit =
                                    { left = [ -6, -5, -4 ]
                                    , selected = [ -3, -2, -1 ]
                                    , right = [ 1, 2, 3 ]
                                    }
                                }
                ]
            ]
        ]
