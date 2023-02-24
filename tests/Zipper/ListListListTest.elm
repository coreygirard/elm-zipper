module Zipper.ListListListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListListList exposing (..)


suite : Test
suite =
    describe "Zipper.ListListList"
        [ describe "Zipper.ListListList.calcIndex"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                    in
                    List.map
                        (\i -> Zipper.ListListList.calcIndex zipper i)
                        (List.range -1 9)
                        |> Expect.equal
                            [ Nothing
                            , Just
                                { first = 0
                                , last = 8
                                , leftEdge = 0
                                , leftSplit = LeftIndex 2
                                , rightEdge = 2
                                , rightSplit = LeftIndex 5
                                , section = Left
                                }
                            , Just
                                { first = 1
                                , last = 7
                                , leftEdge = 1
                                , leftSplit = LeftIndex 1
                                , rightEdge = 1
                                , rightSplit = LeftIndex 4
                                , section = Left
                                }
                            , Just
                                { first = 2
                                , last = 6
                                , leftEdge = 2
                                , leftSplit = LeftIndex 0
                                , rightEdge = 0
                                , rightSplit = LeftIndex 3
                                , section = Left
                                }
                            , Just
                                { first = 3
                                , last = 5
                                , leftEdge = 0
                                , leftSplit = RightIndex 0
                                , rightEdge = 2
                                , rightSplit = LeftIndex 2
                                , section = Selected
                                }
                            , Just
                                { first = 4
                                , last = 4
                                , leftEdge = 1
                                , leftSplit = RightIndex 1
                                , rightEdge = 1
                                , rightSplit = LeftIndex 1
                                , section = Selected
                                }
                            , Just
                                { first = 5
                                , last = 3
                                , leftEdge = 2
                                , leftSplit = RightIndex 2
                                , rightEdge = 0
                                , rightSplit = LeftIndex 0
                                , section = Selected
                                }
                            , Just
                                { first = 6
                                , last = 2
                                , leftEdge = 0
                                , leftSplit = RightIndex 3
                                , rightEdge = 2
                                , rightSplit = RightIndex 0
                                , section = Right
                                }
                            , Just
                                { first = 7
                                , last = 1
                                , leftEdge = 1
                                , leftSplit = RightIndex 4
                                , rightEdge = 1
                                , rightSplit = RightIndex 1
                                , section = Right
                                }
                            , Just
                                { first = 8
                                , last = 0
                                , leftEdge = 2
                                , leftSplit = RightIndex 5
                                , rightEdge = 0
                                , rightSplit = RightIndex 2
                                , section = Right
                                }
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListListList.calcIndexes"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListListList.fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )
                        |> Zipper.ListListList.calcIndexes
                        |> Expect.equal
                            { left =
                                [ { first = 0
                                  , last = 8
                                  , leftEdge = 0
                                  , rightEdge = 2
                                  , leftSplit = LeftIndex 2
                                  , rightSplit = LeftIndex 5
                                  , section = Left
                                  }
                                , { first = 1
                                  , last = 7
                                  , leftEdge = 1
                                  , rightEdge = 1
                                  , leftSplit = LeftIndex 1
                                  , rightSplit = LeftIndex 4
                                  , section = Left
                                  }
                                , { first = 2
                                  , last = 6
                                  , leftEdge = 2
                                  , rightEdge = 0
                                  , leftSplit = LeftIndex 0
                                  , rightSplit = LeftIndex 3
                                  , section = Left
                                  }
                                ]
                            , selected =
                                [ { first = 3
                                  , last = 5
                                  , leftEdge = 0
                                  , rightEdge = 2
                                  , leftSplit = RightIndex 0
                                  , rightSplit = LeftIndex 2
                                  , section = Selected
                                  }
                                , { first = 4
                                  , last = 4
                                  , leftEdge = 1
                                  , rightEdge = 1
                                  , leftSplit = RightIndex 1
                                  , rightSplit = LeftIndex 1
                                  , section = Selected
                                  }
                                , { first = 5
                                  , last = 3
                                  , leftEdge = 2
                                  , rightEdge = 0
                                  , leftSplit = RightIndex 2
                                  , rightSplit = LeftIndex 0
                                  , section = Selected
                                  }
                                ]
                            , right =
                                [ { first = 6
                                  , last = 2
                                  , leftEdge = 0
                                  , rightEdge = 2
                                  , leftSplit = RightIndex 3
                                  , rightSplit = RightIndex 0
                                  , section = Right
                                  }
                                , { first = 7
                                  , last = 1
                                  , leftEdge = 1
                                  , rightEdge = 1
                                  , leftSplit = RightIndex 4
                                  , rightSplit = RightIndex 1
                                  , section = Right
                                  }
                                , { first = 8
                                  , last = 0
                                  , leftEdge = 2
                                  , rightEdge = 0
                                  , leftSplit = RightIndex 5
                                  , rightSplit = RightIndex 2
                                  , section = Right
                                  }
                                ]
                            }
            ]
        ]
