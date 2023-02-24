module Zipper.ListListTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList exposing (..)


suite : Test
suite =
    describe "Zipper.ListList"
        [ describe "Zipper.ListList.empty"
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
        ]
