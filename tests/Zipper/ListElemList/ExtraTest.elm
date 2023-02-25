module Zipper.ListElemList.ExtraTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListElemList exposing (..)
import Zipper.ListElemList.Extra exposing (..)


suite : Test
suite =
    describe "Zipper.ListElemList.Extra"
        [ describe "Zipper.ListElemList.Extra.getAt"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.getAt i zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just 1
                            , Just 2
                            , Just 3
                            , Just 4
                            , Just 5
                            , Just 6
                            , Just 7
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.getAtClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.getAtClamp i zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ 1
                            , 1
                            , 2
                            , 3
                            , 4
                            , 5
                            , 6
                            , 7
                            , 7
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.getAtRelative"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.getAtRelative i zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just 1
                            , Just 2
                            , Just 3
                            , Just 4
                            , Just 5
                            , Just 6
                            , Just 7
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.getAtRelativeClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.getAtRelativeClamp i zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ 1
                            , 1
                            , 2
                            , 3
                            , 4
                            , 5
                            , 6
                            , 7
                            , 7
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.moveToIndex"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.moveToIndex i zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [], 1, [ 2, 3, 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2 ], 3, [ 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4 ], 5, [ 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4, 5 ], 6, [ 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4, 5, 6 ], 7, [] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.moveToIndexRelative"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.moveToIndexRelative i zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [], 1, [ 2, 3, 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2 ], 3, [ 4, 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4 ], 5, [ 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4, 5 ], 6, [ 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3, 4, 5, 6 ], 7, [] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.setAt"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.setAt i 0 zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 0, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 0 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 0, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 0, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.setAtClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.setAtClamp i 0 zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 0, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 0 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 0, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 0, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] )
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.setAtRelative"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.setAtRelative i 0 zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 0, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 0 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 0, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 0, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.setAtRelativeClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.setAtRelativeClamp i 0 zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 0, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 0, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 0 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 0, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 0, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 0, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 0 ] )
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.swapSelectedWithFirst"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Extra.swapSelectedWithFirst
                        |> Expect.equal (fromTuple ( [ 4, 2, 3 ], 1, [ 5, 6, 7 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.Extra.swapSelectedWithFirst
                        |> Expect.equal (fromTuple ( [], 4, [] ))
            ]
        , describe "Zipper.ListElemList.Extra.swapSelectedWithLast"
            [ test "handles basic operation" <|
                \_ ->
                    fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Extra.swapSelectedWithLast
                        |> Expect.equal (fromTuple ( [ 1, 2, 3 ], 7, [ 5, 6, 4 ] ))
            , test "handles singleton" <|
                \_ ->
                    fromTuple ( [], 4, [] )
                        |> Zipper.ListElemList.Extra.swapSelectedWithLast
                        |> Expect.equal (fromTuple ( [], 4, [] ))
            ]
        , describe "Zipper.ListElemList.Extra.swapSelectedWithIndex"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.swapSelectedWithIndex i zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 4, 2, 3 ], 1, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 4, 3 ], 2, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 4 ], 3, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 5, [ 4, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 6, [ 5, 4, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 7, [ 5, 6, 4 ] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.updateAt"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.updateAt i ((+) 10) zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 12, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 13 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 14, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 15, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 16, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.updateAtClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.updateAtClamp i ((+) 10) zipper)
                        (List.range -1 7)
                        |> Expect.equal
                            [ fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 12, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 13 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 14, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 15, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 16, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] )
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.updateAtRelative"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.updateAtRelative i ((+) 10) zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 12, 3 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 13 ], 4, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 14, [ 5, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 15, 6, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 16, 7 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] ))
                            , Nothing
                            ]
            ]
        , describe "Zipper.ListElemList.Extra.updateAtRelativeClamp"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 7 ] )
                    in
                    List.map
                        (\i -> Zipper.ListElemList.Extra.updateAtRelativeClamp i ((+) 10) zipper)
                        (List.range -4 4)
                        |> Expect.equal
                            [ fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 11, 2, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 12, 3 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 13 ], 4, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 14, [ 5, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 15, 6, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 16, 7 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] )
                            , fromTuple ( [ 1, 2, 3 ], 4, [ 5, 6, 17 ] )
                            ]
            ]
        ]
