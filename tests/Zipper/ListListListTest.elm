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
        , describe "Zipper.ListListList.move" <|
            List.map
                (\{ i, zipper, leftDir, rightDir, expected } ->
                    test i <|
                        \_ ->
                            zipper
                                |> Zipper.ListListList.move leftDir rightDir
                                |> Expect.equal expected
                )
                [ { i = "MoveFirst-MoveFirst"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveFirst
                  , expected = Just <| fromTuple ( [], [], [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] )
                  }
                , { i = "MoveFirst-MoveLeft"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [], [ 1, 2, 3, 4, 5 ], [ 6, 7, 8, 9 ] )
                  }
                , { i = "MoveFirst-MoveLeft-fail1"
                  , zipper = fromTuple ( [], [], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveFirst-MoveNone"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveNone
                  , expected = Just <| fromTuple ( [], [ 1, 2, 3, 4, 5, 6 ], [ 7, 8, 9 ] )
                  }
                , { i = "MoveFirst-MoveRight"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [], [ 1, 2, 3, 4, 5, 6, 7 ], [ 8, 9 ] )
                  }
                , { i = "MoveFirst-MoveRight-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [] )
                  , leftDir = MoveFirst
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveFirst-MoveLast"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveFirst
                  , rightDir = MoveLast
                  , expected = Just <| fromTuple ( [], [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], [] )
                  }
                , { i = "MoveLeft-MoveFirst"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveFirst
                  , expected = Just <| fromTuple ( [ 1, 2 ], [], [ 3, 4, 5, 6, 7, 8, 9 ] )
                  }
                , { i = "MoveLeft-MoveFirst-fail1"
                  , zipper = fromTuple ( [], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveFirst
                  , expected = Nothing
                  }
                , { i = "MoveLeft-MoveLeft"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [ 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8, 9 ] )
                  }
                , { i = "MoveLeft-MoveLeft-fail1"
                  , zipper = fromTuple ( [], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveLeft-MoveLeft-2"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [ 1, 2 ], [], [ 3, 7, 8, 9 ] )
                  }
                , { i = "MoveLeft-MoveNone"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveNone
                  , expected = Just <| fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6 ], [ 7, 8, 9 ] )
                  }
                , { i = "MoveLeft-MoveNone-fail1"
                  , zipper = fromTuple ( [], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveNone
                  , expected = Nothing
                  }
                , { i = "MoveLeft-MoveRight"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6, 7 ], [ 8, 9 ] )
                  }
                , { i = "MoveLeft-MoveRight-fail1"
                  , zipper = fromTuple ( [], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveLeft-MoveRight-fail2"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [] )
                  , leftDir = MoveLeft
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveLeft-MoveLast"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveLast
                  , expected = Just <| fromTuple ( [ 1, 2 ], [ 3, 4, 5, 6, 7, 8, 9 ], [] )
                  }
                , { i = "MoveLeft-MoveLast-fail1"
                  , zipper = fromTuple ( [], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLeft
                  , rightDir = MoveLast
                  , expected = Nothing
                  }
                , { i = "MoveNone-MoveFirst"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveFirst
                  , expected = Just <| fromTuple ( [ 1, 2, 3 ], [], [ 4, 5, 6, 7, 8, 9 ] )
                  }
                , { i = "MoveNone-MoveLeft"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [ 1, 2, 3 ], [ 4, 5 ], [ 6, 7, 8, 9 ] )
                  }
                , { i = "MoveNone-MoveLeft-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveNone-MoveNone"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveNone
                  , expected = Just <| fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  }
                , { i = "MoveNone-MoveRight"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6, 7 ], [ 8, 9 ] )
                  }
                , { i = "MoveNone-MoveRight-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [] )
                  , leftDir = MoveNone
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveNone-MoveLast"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveNone
                  , rightDir = MoveLast
                  , expected = Just <| fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6, 7, 8, 9 ], [] )
                  }
                , { i = "MoveRight-MoveFirst"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveFirst
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4 ], [], [ 5, 6, 7, 8, 9 ] )
                  }
                , { i = "MoveRight-MoveFirst-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveFirst
                  , expected = Nothing
                  }
                , { i = "MoveRight-MoveLeft"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4 ], [ 5 ], [ 6, 7, 8, 9 ] )
                  }
                , { i = "MoveRight-MoveLeft-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 5 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveRight-MoveLeft-fail2"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveRight-MoveNone"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveNone
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6 ], [ 7, 8, 9 ] )
                  }
                , { i = "MoveRight-MoveNone-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveNone
                  , expected = Nothing
                  }
                , { i = "MoveRight-MoveRight"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6, 7 ], [ 8, 9 ] )
                  }
                , { i = "MoveRight-MoveRight-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [] )
                  , leftDir = MoveRight
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveRight-MoveRight-pass2"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 7 ], [], [ 8, 9 ] )
                  }
                , { i = "MoveRight-MoveLast"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveRight
                  , rightDir = MoveLast
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4 ], [ 5, 6, 7, 8, 9 ], [] )
                  }
                , { i = "MoveRight-MoveLast-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [] )
                  , leftDir = MoveRight
                  , rightDir = MoveLast
                  , expected = Nothing
                  }
                , { i = "MoveLast-MoveFirst"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveFirst
                  , expected = Nothing
                  }
                , { i = "MoveLast-MoveLeft"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveLeft
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4, 5 ], [], [ 6, 7, 8, 9 ] )
                  }
                , { i = "MoveLast-MoveLeft-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveLast-MoveLeft-fail2"
                  , zipper = fromTuple ( [], [], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveLeft
                  , expected = Nothing
                  }
                , { i = "MoveLast-MoveNone"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveNone
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4, 5, 6 ], [], [ 7, 8, 9 ] )
                  }
                , { i = "MoveLast-MoveRight"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveRight
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4, 5, 6, 7 ], [], [ 8, 9 ] )
                  }
                , { i = "MoveLast-MoveRight-fail1"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [] )
                  , leftDir = MoveLast
                  , rightDir = MoveRight
                  , expected = Nothing
                  }
                , { i = "MoveLast-MoveLast"
                  , zipper = fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                  , leftDir = MoveLast
                  , rightDir = MoveLast
                  , expected = Just <| fromTuple ( [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], [], [] )
                  }
                ]
        ]
