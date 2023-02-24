module Zipper.ListListList.ExtraTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListListList exposing (..)
import Zipper.ListListList.Extra


suite : Test
suite =
    describe "Zipper.ListListList.Extra"
        [ describe "Zipper.ListListList.Extra.updateAt"
            [ test "handles basic operation" <|
                \_ ->
                    let
                        zipper =
                            fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] )
                    in
                    List.map
                        (\i -> Zipper.ListListList.Extra.updateAt i ((+) 10) zipper)
                        (List.range -1 9)
                        |> Expect.equal
                            [ Nothing
                            , Just (fromTuple ( [ 11, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 12, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 13 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 14, 5, 6 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 4, 15, 6 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 16 ], [ 7, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 17, 8, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 18, 9 ] ))
                            , Just (fromTuple ( [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 19 ] ))
                            , Nothing
                            ]
            ]
        ]
