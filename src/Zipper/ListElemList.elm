module Zipper.ListElemList exposing
    ( Zipper
    , singleton
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight
    , map
    )

{-| A special case of [`Zipper.ListElemList.Advanced`](Zipper.ListElemList.Advanced) where all elements have the same type.

If you're working with Chars, check out [`Zipper.StringCharString`](Zipper.StringCharString)


# Definition

@docs Zipper


# Create

@docs singleton


# Move

@docs moveLeft, tryMoveLeft, moveRight, tryMoveRight


# Map

@docs map

-}

import Zipper.ListElemList.Advanced as Adv


{-| A list type that must contain at least one element
-}
type alias Zipper a =
    ( List a, a, List a )


{-| Create a new `Zipper`

    singleton 0 --> ([],0,[])

-}
singleton : a -> Zipper a
singleton elem =
    ( [], elem, [] )


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> moveLeft == Ok ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> moveLeft == Err ( [], 3, [ 4, 5 ] )

-}
moveLeft : Zipper a -> Result (Zipper a) (Zipper a)
moveLeft zipper =
    Adv.moveLeft identity identity zipper


{-| Attempt to move selection to left, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    Adv.tryMoveLeft identity identity zipper


{-| Attempt to move selection to right

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> moveRight --> Ok ( [ 3, 2, 1 ], 4, [ 5 ] )

    ( [ 1, 2 ], 3, [] ) |> moveRight --> Err ( [ 1, 2 ], 3, [] )

-}
moveRight : Zipper a -> Result (Zipper a) (Zipper a)
moveRight zipper =
    Adv.moveRight identity identity zipper


{-| Attempt to move selection to right, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveRight --> ( [ 3,2,1 ], 4, [  5 ] )

    ( [ 1, 2 ], 3, [] ) |> tryMoveRight --> ( [1,2], 3, [  ] )

-}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    Adv.tryMoveRight identity identity zipper


{-| Map a function over all elements

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> map ((+) 10) --> ( [ 12,11 ], 13, [ 14, 15 ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f zipper =
    Adv.map f f f zipper


getLeft : Zipper a -> List a
getLeft =
    Adv.getLeft


getSelected : Zipper a -> a
getSelected =
    Adv.getSelected


getRight : Zipper a -> List a
getRight =
    Adv.getRight


setLeft : List a -> Zipper a -> Zipper a
setLeft =
    Adv.setLeft


setSelected : a -> Zipper a -> Zipper a
setSelected =
    Adv.setSelected


setRight : List a -> Zipper a -> Zipper a
setRight =
    Adv.setRight


mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft =
    Adv.mapLeft


mapSelected : (a -> a) -> Zipper a -> Zipper a
mapSelected =
    Adv.mapSelected


mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight =
    Adv.mapRight
