module Zipper.ListElemList.Advanced exposing
    ( Zipper
    , singleton
    , fromZipperListList, toZipperListList
    , getLeft, getSelected, getRight
    , setLeft, setSelected, setRight, dropLeft, dropLeftToNonemptyList, dropRight, dropRightToNonemptyList
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight
    , map, mapLeft, mapSelected, mapRight
    )

{-| A zipper with a single selected element.

Note: if you don't need to transform elements when they move between selected and deselected, you should use [`Zipper.ListElemList`](Zipper.ListElemList) instead. It has a simpler API.


# Definition

@docs Zipper


# Create

@docs singleton


# To/from other Zipper types

@docs fromZipperListList, toZipperListList


# Get

@docs getLeft, getSelected, getRight


# Set

@docs setLeft, setSelected, setRight, dropLeft, dropLeftToNonemptyList, dropRight, dropRightToNonemptyList


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight


# Mapping

@docs map, mapLeft, mapSelected, mapRight

-}

import List.Extra
import Result.Extra
import Zipper.ListList.Advanced


{-| A list type that must contain at least one element
-}
type alias Zipper a b c =
    ( List a, b, List c )


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
singleton : b -> Zipper a b c
singleton elem =
    ( [], elem, [] )


{-| Attempt to move selection to left
-}
moveLeft : (a -> b) -> (b -> c) -> Zipper a b c -> Result (Zipper a b c) (Zipper a b c)
moveLeft fAB fBC zipper =
    case zipper of
        ( head :: tail, selected, right ) ->
            Ok ( tail, fAB head, fBC selected :: right )

        ( [], selected, right ) ->
            Err zipper


{-| Attempt to move selection to left, returning unmodified zipper on failure
-}
tryMoveLeft : (a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c
tryMoveLeft fAB fBC zipper =
    moveLeft fAB fBC zipper
        |> Result.Extra.merge


{-| Attempt to move selection to right
-}
moveRight : (b -> a) -> (c -> b) -> Zipper a b c -> Result (Zipper a b c) (Zipper a b c)
moveRight fBA fCB zipper =
    case zipper of
        ( left, selected, head :: tail ) ->
            Ok ( fBA selected :: left, fCB head, tail )

        ( left, selected, [] ) ->
            Err zipper


{-| Attempt to move selection to right, returning unmodified zipper on failure
-}
tryMoveRight : (b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c
tryMoveRight fBA fCB zipper =
    moveRight fBA fCB zipper
        |> Result.Extra.merge


{-| Set selection to first element
-}
selectFirst : (a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c
selectFirst fAB fBC ( before, selected, after ) =
    case List.Extra.unconsLast before of
        Just ( last, rest ) ->
            ( []
            , fAB last
            , List.map (fAB >> fBC) rest ++ [ fBC selected ] ++ after
            )

        Nothing ->
            ( before, selected, after )


{-| Set selection to last element
-}
selectLast : (b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c
selectLast fBA fCB ( before, selected, after ) =
    case List.Extra.unconsLast after of
        Just ( last, rest ) ->
            ( List.map (fCB >> fBA) rest ++ [ fBA selected ] ++ before
            , fCB last
            , []
            )

        Nothing ->
            ( before, selected, after )


{-| To [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper) by dropping selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> toZipperListList
    --> ([2,1], [4,5])

-}
toZipperListList : Zipper a b c -> Zipper.ListList.Advanced.Zipper a c
toZipperListList ( left, _, right ) =
    ( left, right )


{-| From [`Zipper.ListList.Zipper`](Zipper.ListList#Zipper), by providing selected element.

    ( [ 2, 1 ],  [ 4, 5 ] )
    |> fromZipperListList 3
    --> ([2,1], 3, [4,5])

-}
fromZipperListList : b -> Zipper.ListList.Advanced.Zipper a c -> Zipper a b c
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| Set left side of zipper to the empty list

    ( [ 2, 1 ],  3, [ 4, 5 ] )
    |> dropLeft
    --> ( [], 3, [4, 5] )

-}
dropLeft : Zipper a b c -> Zipper a b c
dropLeft ( _, selected, right ) =
    ( [], selected, right )


{-| Convert zipper to a nonempty list by dropping all left elements. Fully compatible with [coreygirard/elm-nonempty-list](https://package.elm-lang.org/packages/coreygirard/elm-nonempty-list/latest/)

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> dropLeftToNonemptyList
    --> ( 3, [4, 5] )

-}
dropLeftToNonemptyList : Zipper a b c -> ( b, List c )
dropLeftToNonemptyList ( _, selected, right ) =
    ( selected, right )


{-| Set left side of zipper to the empty list

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> dropRight
    --> ( [ 2, 1 ], 3, [] )

-}
dropRight : Zipper a b c -> Zipper a b c
dropRight ( left, selected, _ ) =
    ( left, selected, [] )


{-| Convert zipper to a nonempty list by dropping all left elements. Fully compatible with [coreygirard/elm-nonempty-list](https://package.elm-lang.org/packages/coreygirard/elm-nonempty-list/latest/). Note that the relative order of elements changes to fit the nonempty list type.

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> dropRightToNonemptyList
    --> ( 3, [ 1, 2 ] )

-}
dropRightToNonemptyList : Zipper a b c -> ( b, List a )
dropRightToNonemptyList ( left, selected, _ ) =
    ( selected, List.reverse left )


{-| Replace left elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> setLeft ['a','b']
    --> ( [ 'b', 'a' ], 3, [ 4, 5 ] )

-}
setLeft : List a2 -> Zipper a1 b c -> Zipper a2 b c
setLeft left ( _, selected, right ) =
    ( List.reverse left, selected, right )


{-| Replace selected element

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> setSelected 'c'
    --> ( [ 2, 1 ], 'c', [ 4, 5 ] )

-}
setSelected : b2 -> Zipper a b1 c -> Zipper a b2 c
setSelected selected ( left, _, right ) =
    ( left, selected, right )


{-| Replace right elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
    |> setRight [ 'd', 'e' ]
    --> ( [ 2, 1 ], 3, [ 'd', 'e' ] )

-}
setRight : List c2 -> Zipper a b c1 -> Zipper a b c2
setRight right ( left, selected, _ ) =
    ( left, selected, right )


{-| Return left elements

    getLeft ( [ 2, 1 ], 3, [ 4, 5 ] ) --> [ 1, 2 ]

-}
getLeft : Zipper a b c -> List a
getLeft ( left, _, _ ) =
    List.reverse left


{-| Return selected element

    getSelected ( [ 2, 1 ], 3, [ 4, 5 ] ) --> 3

-}
getSelected : Zipper a b c -> b
getSelected ( _, selected, _ ) =
    selected


{-| Return right elements

    getRight ( [ 2, 1 ], 3, [ 4, 5 ] ) --> [ 4, 5 ]

-}
getRight : Zipper a b c -> List c
getRight ( _, _, right ) =
    right


{-| Set selection to last element
-}
map : (a1 -> a2) -> (b1 -> b2) -> (c1 -> c2) -> Zipper a1 b1 c1 -> Zipper a2 b2 c2
map fA fB fC ( left, selected, right ) =
    ( List.map fA left, fB selected, List.map fC right )


{-| Set selection to last element
-}
mapSelected : (b1 -> b2) -> Zipper a b1 c -> Zipper a b2 c
mapSelected f ( left, selected, right ) =
    ( left, f selected, right )


{-| Set selection to last element
-}
mapLeft : (a1 -> a2) -> Zipper a1 b c -> Zipper a2 b c
mapLeft f ( left, selected, right ) =
    ( List.map f left, selected, right )


{-| Set selection to last element
-}
mapRight : (c1 -> c2) -> Zipper a b c1 -> Zipper a b c2
mapRight f ( left, selected, right ) =
    ( left, selected, List.map f right )
