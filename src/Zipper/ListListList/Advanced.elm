module Zipper.ListListList.Advanced exposing
    ( Zipper
    , empty
    , fromZipperListList, toZipperListList, fromZipperListElemList, toZipperListElemList
    , getLeft
    , moveLeftToLeft, moveLeftToLeftUntil
    )

{-| A zipper with a list of selected elements.

**Note**: If all zipper elements are of the same type, use [`Zipper.ListListList`](Zipper.ListListList) instead. It has a simpler API.

  - General case of [`Zipper.ListListList`](Zipper.ListListList)
  - General case of [`Zipper.StringStringString`](Zipper.StringStringString)


# Definition

@docs Zipper


# Create

@docs empty


# From/to other Zippers

@docs fromZipperListList, toZipperListList, fromZipperListElemList, toZipperListElemList


# Get

@docs getLeft


# Move

@docs moveLeftToLeft, moveLeftToLeftUntil

-}

import Zipper.ListElemList.Advanced
import Zipper.ListList.Advanced


{-| A list type that must contain at least one element
-}
type alias Zipper a b c =
    ( List a, List b, List c )


{-| Create a new `Zipper`

    make "hello" == ( "hello", "hello" )

-}
empty : Zipper a b c
empty =
    ( [], [], [] )


{-| Attempt to move left edge of selection to left
-}
moveLeftToLeft : (a -> b) -> Zipper a b c -> Maybe (Zipper a b c)
moveLeftToLeft fAB zipper =
    case zipper of
        ( head :: tail, selected, right ) ->
            Just ( tail, fAB head :: selected, right )

        ( [], selected, right ) ->
            Nothing


{-| -}
moveLeftToLeftUntil : (a -> b) -> (List a -> List b -> List c -> Bool) -> Zipper a b c -> Maybe (Zipper a b c)
moveLeftToLeftUntil fAB f zipper =
    case moveLeftToLeft fAB zipper of
        Nothing ->
            Nothing

        Just ( left, selected, right ) ->
            if f left selected right then
                Just ( left, selected, right )

            else
                moveLeftToLeftUntil fAB f ( left, selected, right )


{-| Set selection to last element
-}
fromZipperListElemList : (b1 -> List b2) -> Zipper.ListElemList.Advanced.Zipper a b1 c -> Zipper a b2 c
fromZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| Set selection to last element
-}
toZipperListElemList : (List b1 -> b2) -> Zipper a b1 c -> Zipper.ListElemList.Advanced.Zipper a b2 c
toZipperListElemList f ( left, selected, right ) =
    ( left, f selected, right )


{-| Set selection to last element
-}
fromZipperListList : List b -> Zipper.ListList.Advanced.Zipper a c -> Zipper a b c
fromZipperListList selected ( left, right ) =
    ( left, selected, right )


{-| Set selection to last element
-}
toZipperListList : Zipper a b c -> Zipper.ListList.Advanced.Zipper a c
toZipperListList ( left, _, right ) =
    ( left, right )


{-| Set selection to last element
-}
getLeft : Zipper a b c -> List a
getLeft ( left, _, _ ) =
    List.reverse left
