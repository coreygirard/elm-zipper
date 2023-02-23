module Zipper.ListListList.ExtraTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListListList exposing (..)
import Zipper.ListListList.Extra


suite : Test
suite =
    describe "Zipper.ListListList.Extra"
        [ describe "Zipper.ListListList.Extra.absoluteIndexToPosDists"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )
                    in
                    List.map
                        (Zipper.ListListList.Extra.absoluteIndexToPosDists zipper)
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
            , describe "Zipper.ListListList.Extra.indexRanges"
                [ test "handles basic operation" <|
                    \_ ->
                        fromTuple ( [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] )
                            |> Zipper.ListListList.Extra.indexRanges
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
        , describe "Zipper.ListListList.Extra.updateAt"
            [ test "handles out of bounds left" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt -1 ((+) 10)
                        |> Expect.equal Nothing
            , test "handles left edge of left section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 0 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 11, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )))
            , test "handles right edge of left section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 2 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 13 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )))
            , test "handles left edge of selected section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 3 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], [ 14, 5, 6 ], [ 7, 8, 9 ] )))
            , test "handles right edge of selected section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 5 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 16 ], [ 7, 8, 9 ] )))
            , test "handles left edge of right section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 6 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 17, 8, 9 ] )))
            , test "handles right edge of right section" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 8 ((+) 10)
                        |> Expect.equal (Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 19 ] )))
            , test "handles out of bounds right" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListListList.Extra.updateAt 9 ((+) 10)
                        |> Expect.equal Nothing
            ]
        ]
