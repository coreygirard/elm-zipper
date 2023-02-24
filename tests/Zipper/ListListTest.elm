module Zipper.ListListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)


suite : Test
suite =
    describe "Zipper.ListList"
        [ describe "Zipper.ListList.absoluteIndexToPosDists"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListList.fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ] )
                    in
                    List.map
                        (Zipper.ListList.absoluteIndexToPosDists zipper)
                        (List.range -1 6)
                        |> Expect.equal
                            [ Nothing
                            , Just ( Left, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Left, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Left, { fromLeft = 2, fromRight = 0 } )
                            , Just ( Right, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Right, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Right, { fromLeft = 2, fromRight = 0 } )
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListList.empty"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListList.empty
                        |> Expect.equal ( [], [] )
            ]
        , describe "Zipper.ListList.fromListAndIndex"
            [ test "handles basic operation" <|
                \_ ->
                    List.map
                        (\i -> Zipper.ListList.fromListAndIndex i [ 1, 2, 3, 4, 5 ])
                        (List.range -1 6)
                        |> Expect.equal
                            [ Nothing
                            , Just ( [], [ 1, 2, 3, 4, 5 ] )
                            , Just ( [ 1 ], [ 2, 3, 4, 5 ] )
                            , Just ( [ 1, 2 ], [ 3, 4, 5 ] )
                            , Just ( [ 1, 2, 3 ], [ 4, 5 ] )
                            , Just ( [ 1, 2, 3, 4 ], [ 5 ] )
                            , Just ( [ 1, 2, 3, 4, 5 ], [] )
                            , Nothing
                            ]
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
