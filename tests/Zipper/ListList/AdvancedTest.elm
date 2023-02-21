module Zipper.ListList.AdvancedTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Zipper.ListList.Advanced exposing (..)


suite : Test
suite =
    describe "Zipper.ListList.Advanced"
        [ describe "Zipper.ListList.Advanced.selectNth"
            [ test "handles basic operation" <|
                \_ ->
                    ( [ 3, 2, 1 ], [ 4, 5, 6 ] )
                        |> Zipper.ListList.Advanced.selectNth identity identity 1
                        |> Expect.equal (Just ( [ 1 ], [ 2, 3, 4, 5, 6 ] ))
            , test "doesn't convert elements unnecessarily, moving left" <|
                \_ ->
                    ( [ { n = 3, changed = False, typeA = () }
                      , { n = 2, changed = False, typeA = () }
                      , { n = 1, changed = False, typeA = () }
                      ]
                    , [ { n = 4, changed = False, typeB = () }
                      , { n = 5, changed = False, typeB = () }
                      , { n = 6, changed = False, typeB = () }
                      ]
                    )
                        |> Zipper.ListList.Advanced.selectNth
                            (\{ n } -> { n = n, changed = True, typeB = () })
                            (\{ n } -> { n = n, changed = True, typeA = () })
                            1
                        |> Expect.equal
                            (Just
                                ( [ { changed = False, n = 1, typeA = () } ]
                                , [ { changed = True, n = 2, typeB = () }
                                  , { changed = True, n = 3, typeB = () }
                                  , { changed = False, n = 4, typeB = () }
                                  , { changed = False, n = 5, typeB = () }
                                  , { changed = False, n = 6, typeB = () }
                                  ]
                                )
                            )
            , test "doesn't convert elements unnecessarily, moving right" <|
                \_ ->
                    ( [ { n = 3, changed = False, typeA = () }
                      , { n = 2, changed = False, typeA = () }
                      , { n = 1, changed = False, typeA = () }
                      ]
                    , [ { n = 4, changed = False, typeB = () }
                      , { n = 5, changed = False, typeB = () }
                      , { n = 6, changed = False, typeB = () }
                      ]
                    )
                        |> Zipper.ListList.Advanced.selectNth
                            (\{ n } -> { n = n, changed = True, typeB = () })
                            (\{ n } -> { n = n, changed = True, typeA = () })
                            5
                        |> Expect.equal
                            (Just
                                ( [ { changed = True, n = 5, typeA = () }
                                  , { changed = True, n = 4, typeA = () }
                                  , { changed = False, n = 3, typeA = () }
                                  , { changed = False, n = 2, typeA = () }
                                  , { changed = False, n = 1, typeA = () }
                                  ]
                                , [ { changed = False, n = 6, typeB = () }
                                  ]
                                )
                            )
            , test "doesn't convert elements unnecessarily, not moving" <|
                \_ ->
                    ( [ { n = 3, changed = False, typeA = () }
                      , { n = 2, changed = False, typeA = () }
                      , { n = 1, changed = False, typeA = () }
                      ]
                    , [ { n = 4, changed = False, typeB = () }
                      , { n = 5, changed = False, typeB = () }
                      , { n = 6, changed = False, typeB = () }
                      ]
                    )
                        |> Zipper.ListList.Advanced.selectNth
                            (\{ n } -> { n = n, changed = True, typeB = () })
                            (\{ n } -> { n = n, changed = True, typeA = () })
                            3
                        |> Expect.equal
                            (Just
                                ( [ { n = 3, changed = False, typeA = () }
                                  , { n = 2, changed = False, typeA = () }
                                  , { n = 1, changed = False, typeA = () }
                                  ]
                                , [ { n = 4, changed = False, typeB = () }
                                  , { n = 5, changed = False, typeB = () }
                                  , { n = 6, changed = False, typeB = () }
                                  ]
                                )
                            )
            ]
        ]
