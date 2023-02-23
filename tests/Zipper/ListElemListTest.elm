module Zipper.ListElemListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListElemList exposing (..)


suite : Test
suite =
    describe "Zipper.ListElemList"
        [ describe "Zipper.ListElemList.absoluteIndexToPosDists"
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
        , describe "Zipper.ListElemList.filter"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.filter (\n -> modBy 2 n == 0)
                        |> Expect.equal ( [ 2 ], Just 4, [ 6 ] )
            , test "handles selection failing test" <|
                \_ ->
                    ( [ 1, 2, 3 ], 3, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.filter (\n -> modBy 2 n == 0)
                        |> Expect.equal ( [ 2 ], Nothing, [ 6 ] )
            ]
        , describe "Zipper.ListElemList.fromListAndIndex"
            [ test "handles basic operation" <|
                \_ ->
                    [ 1, 2, 3, 4, 5, 6, 7 ]
                        |> Zipper.ListElemList.fromListAndIndex 3
                        |> Expect.equal (Just ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] ))
            , test "handles invalid input" <|
                \_ ->
                    [ 1, 2 ]
                        |> Zipper.ListElemList.fromListAndIndex 2
                        |> Expect.equal Nothing
            ]
        , describe "Zipper.ListElemList.fromZipperListListList"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                        |> Zipper.ListElemList.fromZipperListListList List.sum
                        |> Expect.equal ( [ 1, 2, 3 ], 15, [ 7, 8, 9 ] )
            ]
        , describe "Zipper.ListElemList.getFirst"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.getFirst
                        |> Expect.equal 1
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.getFirst
                        |> Expect.equal 4
            ]
        , describe "Zipper.ListElemList.indexAbsoluteCheck"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListElemList.fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.indexAbsoluteCheck zipper i)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just Left
                            , Just Left
                            , Just Left
                            , Just Selected
                            , Just Right
                            , Just Right
                            , Just Right
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.indexRangesFromEdges"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                        |> Zipper.ListElemList.indexRangesFromEdges
                        |> Expect.equal
                            { left = [ 2, 1, 0 ]
                            , selected = 3
                            , right = [ 2, 1, 0 ]
                            }
            ]
        , describe "Zipper.ListElemList.indexRangesFromFirst"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                        |> Zipper.ListElemList.indexRangesFromFirst
                        |> Expect.equal
                            { left = [ 2, 1, 0 ]
                            , selected = 3
                            , right = [ 4, 5, 6 ]
                            }
            ]
        , describe "Zipper.ListElemList.indexRangesFromLast"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                        |> Zipper.ListElemList.indexRangesFromLast
                        |> Expect.equal
                            { left = [ 4, 5, 6 ]
                            , selected = 3
                            , right = [ 2, 1, 0 ]
                            }
            ]
        , describe "Zipper.ListElemList.indexRangesFromSelection"
            [ test "handles basic operation" <|
                \_ ->
                    Zipper.ListElemList.fromTuple ( [ 0, 0, 0 ], 0, [ 0, 0, 0 ] )
                        |> Zipper.ListElemList.indexRangesFromSelection
                        |> Expect.equal
                            { left = [ -1, -2, -3 ]
                            , selected = 0
                            , right = [ 1, 2, 3 ]
                            }
            ]
        , describe "Zipper.ListElemList.indexRelativeCheck"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListElemList.fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.indexRelativeCheck zipper i)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just Left
                            , Just Left
                            , Just Left
                            , Just Selected
                            , Just Right
                            , Just Right
                            , Just Right
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.indexRelativeToAbsoluteCheck"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            Zipper.ListElemList.fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.indexRelativeToAbsoluteCheck zipper i)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just 0
                            , Just 1
                            , Just 2
                            , Just 3
                            , Just 4
                            , Just 5
                            , Just 6
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.insertFirst"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.insertFirst 0
                        |> Expect.equal (fromTuple ( [ 0, 1, 2, 3 ], 4, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.insertFirst 0
                        |> Expect.equal (fromTuple ( [ 0 ], 4, [] ))
            ]
        , describe "Zipper.ListElemList.insertLast"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.insertLast 0
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7, 0 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.insertLast 0
                        |> Expect.equal (fromTuple ( [], 4, [ 0 ] ))
            ]
        , describe "Zipper.ListElemList.insertLeftOfSelected"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.insertLeftOfSelected 0
                        |> Expect.equal (fromTuple ( [ 1, 2, 3, 0 ], 4, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.insertLeftOfSelected 0
                        |> Expect.equal (fromTuple ( [ 0 ], 4, [] ))
            ]
        , describe "Zipper.ListElemList.insertRightOfSelected"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.insertRightOfSelected 0
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 4, [ 0, 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.insertRightOfSelected 0
                        |> Expect.equal (fromTuple ( [], 4, [ 0 ] ))
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
        , describe "Zipper.ListElemList.setFirst"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.setFirst 0
                        |> Expect.equal (fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.setFirst 0
                        |> Expect.equal (fromTuple ( [], 0, [] ))
            ]
        , describe "Zipper.ListElemList.setLast"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.setLast 0
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.setLast 0
                        |> Expect.equal (fromTuple ( [], 0, [] ))
            ]
        , describe "Zipper.ListElemList.setLeft"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.setLeft [ 11, 12 ]
                        |> Expect.equal (fromTuple ( [ 11, 12 ], 4, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.setLeft [ 11, 12 ]
                        |> Expect.equal (fromTuple ( [ 11, 12 ], 4, [] ))
            ]
        , describe "Zipper.ListElemList.setRight"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.setRight [ 15, 16 ]
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 4, [ 15, 16 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.setRight [ 15, 16 ]
                        |> Expect.equal (fromTuple ( [], 4, [ 15, 16 ] ))
            ]
        , describe "Zipper.ListElemList.setSelected"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.setSelected 0
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.setSelected 0
                        |> Expect.equal (fromTuple ( [], 0, [] ))
            ]
        , describe "Zipper.ListElemList.sortKeepElem"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 6, 3, 7 ], 4, [ 2, 1, 5, 2, 6, 4 ] )
                        |> Zipper.ListElemList.sortKeepElem
                        |> Expect.equal (fromTuple ( [ 1, 2, 2, 3 ], 4, [ 4, 5, 6, 6, 7 ] ))
            ]
        , describe "Zipper.ListElemList.sortKeepIndex"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 6, 3, 7 ], 4, [ 2, 1, 5, 2, 6, 4 ] )
                        |> Zipper.ListElemList.sortKeepIndex
                        |> Expect.equal (fromTuple ( [ 1, 2, 2 ], 3, [ 4, 4, 5, 6, 6, 7 ] ))
            ]
        ]
