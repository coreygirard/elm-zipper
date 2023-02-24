module Zipper.ListElemList.AdvancedTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListElemList.Advanced exposing (..)


suite : Test
suite =
    describe "Zipper.ListElemList.Advanced"
        [ describe "Zipper.ListElemList.Advanced.moveLeftUntil"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftUntil identity identity (\_ n _ -> n == 2)
                        |> Expect.equal (Just ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))
            , test "handles no matches" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftUntil identity identity (\_ n _ -> n == 100)
                        |> Expect.equal Nothing
            , test "handles match at end" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftUntil identity identity (\_ n _ -> n == 1)
                        |> Expect.equal (Just ( [], 1, [ 2, 3, 4, 5, 6, 7 ] ))
            ]
        , describe "Zipper.ListElemList.Advanced.moveLeftN"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftN identity identity identity identity 2
                        |> Expect.equal (Just ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))
            , test "handles 0" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftN identity identity identity identity 0
                        |> Expect.equal (Just ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] ))
            , test "handles number at end" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftN identity identity identity identity 3
                        |> Expect.equal (Just ( [], 1, [ 2, 3, 4, 5, 6, 7 ] ))
            , test "handles number beyond end" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftN identity identity identity identity 4
                        |> Expect.equal Nothing
            ]
        , describe "Zipper.ListElemList.Advanced.moveLeftNNonnegative"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftNNonnegative identity identity 2
                        |> Expect.equal (Just ( [ 1 ], 2, [ 3, 4, 5, 6, 7 ] ))
            , test "handles 0" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftNNonnegative identity identity 0
                        |> Expect.equal (Just ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] ))
            , test "handles number at end" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftNNonnegative identity identity 3
                        |> Expect.equal (Just ( [], 1, [ 2, 3, 4, 5, 6, 7 ] ))
            , test "handles number beyond end" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveLeftNNonnegative identity identity 4
                        |> Expect.equal Nothing
            ]
        , describe "Zipper.ListElemList.Advanced.moveToIndex"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveToIndex identity identity identity identity 5
                        |> Expect.equal (Just ( [ 5, 4, 3, 2, 1 ], 6, [ 7 ] ))
            , test "handles out-of-bounds (high)" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveToIndex identity identity identity identity 10
                        |> Expect.equal Nothing
            , test "handles negative number" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.moveToIndex identity identity identity identity -1
                        |> Expect.equal Nothing
            ]
        , describe "Zipper.ListElemList.Advanced.getAt"
            [ test "handles out-of-range negative" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity -1
                        |> Expect.equal Nothing
            , test "handles first element" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 0
                        |> Expect.equal (Just 1)
            , test "handles before selection" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 2
                        |> Expect.equal (Just 3)
            , test "handles selected element" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 3
                        |> Expect.equal (Just 4)
            , test "handles after selection" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 4
                        |> Expect.equal (Just 5)
            , test "handles last element" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 6
                        |> Expect.equal (Just 7)
            , test "handles out-of-range high" <|
                \_ ->
                    ( [ 3, 2, 1 ], 4, [ 5, 6, 7 ] )
                        |> Zipper.ListElemList.Advanced.getAt identity identity identity 7
                        |> Expect.equal Nothing
            ]
        ]
