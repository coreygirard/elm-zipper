module Zipper.ListElemListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListElemList exposing (..)


suite : Test
suite =
    describe "Zipper.ListElemList"
        [ describe "Zipper.ListElemList.updateAt"
            [ test "handles out of bounds left" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt -1 ((+) 10)
                        |> Expect.equal Nothing
            , test "handles left edge of left section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 0 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] )))
            , test "handles right edge of left section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 2 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 13 ], 4, [ 5, 6, 7 ] )))
            , test "handles selected " <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 3 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], 14, [ 5, 6, 7 ] )))
            , test "handles left edge of right section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 4 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], 4, [ 15, 6, 7 ] )))
            , test "handles right edge of right section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 6 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] )))
            , test "handles out of bounds right" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.updateAt 7 ((+) 10)
                        |> Expect.equal Nothing
            ]
        , describe "Zipper.ListElemList.sortKeepElem"
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
        , describe "Zipper.ListElemList.absoluteIndexToPosDists"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                    in
                    List.map
                        (Zipper.ListElemList.absoluteIndexToPosDists zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just ( Left, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Left, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Left, { fromLeft = 2, fromRight = 0 } )
                            , Just ( Selected, { fromLeft = 0, fromRight = 0 } )
                            , Just ( Right, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Right, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Right, { fromLeft = 2, fromRight = 0 } )
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.relativeIndexToPosDists"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                    in
                    List.map
                        (Zipper.ListElemList.relativeIndexToPosDists zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just ( Left, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Left, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Left, { fromLeft = 2, fromRight = 0 } )
                            , Just ( Selected, { fromLeft = 0, fromRight = 0 } )
                            , Just ( Right, { fromLeft = 0, fromRight = 2 } )
                            , Just ( Right, { fromLeft = 1, fromRight = 1 } )
                            , Just ( Right, { fromLeft = 2, fromRight = 0 } )
                            , Nothing
                            ]
            ]
        ]
