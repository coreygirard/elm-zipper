module Zipper.ListElemList exposing
    ( Zipper
    , singleton
    , moveLeft, tryMoveLeft, moveRight, tryMoveRight
    , map
    , sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex
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


# Sort

@docs sortKeepElem, sortByKeepElem, sortWithKeepElem, sortKeepIndex, sortByKeepIndex, sortWithKeepIndex

-}

import List.Extra
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


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
toList : Zipper a -> List a
toList ( a, b, c ) =
    List.reverse a ++ [ b ] ++ c


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
length : Zipper a -> Int
length =
    Adv.length


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
lengthLeft : Zipper a -> Int
lengthLeft =
    Adv.lengthLeft


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
lengthRight : Zipper a -> Int
lengthRight =
    Adv.lengthRight


{-| Create a new `Zipper`

    singleton 0 --> ( [], 0, [] )

-}
position : Zipper a -> Int
position =
    Adv.position


{-| Attempt to move selection to left

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> moveLeft
        --> Just ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] )
        |> moveLeft
        --> Nothing

-}
moveLeft : Zipper a -> Maybe (Zipper a)
moveLeft zipper =
    Adv.moveLeft identity identity zipper


{-| Attempt to move selection to left, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [ 1 ], 2, [ 3, 4, 5 ] )

    ( [], 3, [ 4, 5 ] ) |> tryMoveLeft --> ( [], 3, [ 4, 5 ] )

-}
tryMoveLeft : Zipper a -> Zipper a
tryMoveLeft zipper =
    Adv.tryMoveLeft identity identity zipper


moveLeftUntil : (a -> Bool) -> Zipper a -> Maybe (Zipper a)
moveLeftUntil f zipper =
    Adv.moveLeftUntil identity identity (\_ elem _ -> f elem) zipper


{-| Attempt to move selection to right

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> moveRight
        --> Just ( [ 3, 2, 1 ], 4, [ 5 ] )

    ( [ 1, 2 ], 3, [] )
        |> moveRight
        --> Nothing

-}
moveRight : Zipper a -> Maybe (Zipper a)
moveRight zipper =
    Adv.moveRight identity identity zipper


{-| Attempt to move selection to right, returning unmodified zipper on failure

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> tryMoveRight
        --> ( [ 3, 2, 1 ], 4, [ 5 ] )

    ( [ 1, 2 ], 3, [] )
        |> tryMoveRight
        --> ( [ 1, 2 ], 3, [] )

-}
tryMoveRight : Zipper a -> Zipper a
tryMoveRight zipper =
    Adv.tryMoveRight identity identity zipper


{-| Map a function over all elements

    ( [ 2, 1 ], 3, [ 4, 5 ] )
        |> map ((+) 10)
        --> ( [ 12, 11 ], 13, [ 14, 15 ] )

-}
map : (a -> b) -> Zipper a -> Zipper b
map f zipper =
    Adv.map f f f zipper


{-| -}
getLeft : Zipper a -> List a
getLeft =
    Adv.getLeft


{-| -}
getSelected : Zipper a -> a
getSelected =
    Adv.getSelected


{-| -}
getRight : Zipper a -> List a
getRight =
    Adv.getRight


{-| -}
setLeft : List a -> Zipper a -> Zipper a
setLeft =
    Adv.setLeft


{-| -}
setSelected : a -> Zipper a -> Zipper a
setSelected =
    Adv.setSelected


{-| -}
setRight : List a -> Zipper a -> Zipper a
setRight =
    Adv.setRight


{-| -}
mapLeft : (a -> a) -> Zipper a -> Zipper a
mapLeft =
    Adv.mapLeft


{-| -}
mapRight : (a -> a) -> Zipper a -> Zipper a
mapRight =
    Adv.mapRight


{-| -}
updateLeft : (List a -> List a) -> Zipper a -> Zipper a
updateLeft =
    Adv.updateLeft


{-| -}
updateSelected : (a -> a) -> Zipper a -> Zipper a
updateSelected =
    Adv.updateSelected


{-| -}
updateRight : (List a -> List a) -> Zipper a -> Zipper a
updateRight =
    Adv.updateRight


{-| Set selection to first element
-}
selectFirst : Zipper a -> Zipper a
selectFirst zipper =
    Adv.selectFirst identity identity zipper


{-| Set selection to Nth element
-}
selectNth : Int -> Zipper a -> Maybe (Zipper a)
selectNth n ( before, selected, after ) =
    let
        allElems =
            toList ( before, selected, after )
    in
    case List.Extra.getAt n allElems of
        Just elemN ->
            Just
                ( allElems |> List.take n
                , elemN
                , allElems |> List.drop (n + 1)
                )

        Nothing ->
            Nothing


{-| Set selection to last element
-}
selectLast : Zipper a -> Zipper a
selectLast zipper =
    Adv.selectLast identity identity zipper


{-| Set selection to Nth element
-}
trySelectNth : Int -> Zipper a -> Zipper a
trySelectNth n ( before, selected, after ) =
    let
        allElems =
            toList ( before, selected, after )
    in
    case List.Extra.getAt n allElems of
        Just elemN ->
            ( allElems |> List.take n
            , elemN
            , allElems |> List.drop (n + 1)
            )

        Nothing ->
            ( before, selected, after )


{-| -}
reverse : Zipper a -> Zipper a
reverse ( left, selected, right ) =
    ( List.reverse right, selected, List.reverse left )


{-| -}
sortKeepElem : Zipper comparable -> Zipper comparable
sortKeepElem ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> elem > selected) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> elem < selected) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith compare
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith compare
    )


{-| -}
sortByKeepElem : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepElem f ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> f elem > f selected) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> f elem < f selected) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith (\a b -> compare (f a) (f b))
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith (\a b -> compare (f a) (f b))
    )


{-| -}
sortWithKeepElem : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepElem f ( before, selected, after ) =
    let
        ( beforeToAfter, newBefore ) =
            List.partition (\elem -> f selected elem == LT) before

        ( afterToBefore, newAfter ) =
            List.partition (\elem -> f selected elem == GT) after
    in
    ( List.reverse afterToBefore
        ++ newBefore
        |> List.Extra.stableSortWith f
    , selected
    , beforeToAfter
        ++ newAfter
        |> List.Extra.stableSortWith f
    )


{-| -}
sortKeepIndex : Zipper comparable -> Zipper comparable
sortKeepIndex zipper =
    zipper
        |> selectFirst
        |> updateRight List.sort
        |> sortFirstPair_
        |> updateRight List.sort
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortByKeepIndex : (a -> comparable) -> Zipper a -> Zipper a
sortByKeepIndex f zipper =
    zipper
        |> selectFirst
        |> updateRight (List.sortBy f)
        |> sortFirstPairBy_ f
        |> updateRight (List.sortBy f)
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortWithKeepIndex : (a -> a -> Order) -> Zipper a -> Zipper a
sortWithKeepIndex f zipper =
    zipper
        |> selectFirst
        |> updateRight (List.sortWith f)
        |> sortFirstPairWith_ f
        |> updateRight (List.sortWith f)
        |> selectNth (position zipper)
        |> Maybe.withDefault zipper


{-| -}
sortFirstPair_ : Zipper comparable -> Zipper comparable
sortFirstPair_ ( before, selected, after ) =
    case after of
        head :: tail ->
            if head < selected then
                ( before, head, selected :: tail )

            else
                ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
sortFirstPairBy_ : (a -> comparable) -> Zipper a -> Zipper a
sortFirstPairBy_ f ( before, selected, after ) =
    case after of
        head :: tail ->
            if f head < f selected then
                ( before, head, selected :: tail )

            else
                ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
sortFirstPairWith_ : (a -> a -> Order) -> Zipper a -> Zipper a
sortFirstPairWith_ f ( before, selected, after ) =
    case after of
        head :: tail ->
            case f head selected of
                LT ->
                    ( before, head, selected :: tail )

                _ ->
                    ( before, selected, after )

        [] ->
            ( before, selected, after )


{-| -}
indexedMap : (Int -> a -> b) -> Zipper a -> Zipper b
indexedMap f ( before, selected, after ) =
    let
        beforeIndexes =
            List.range 0 (List.length before) |> List.reverse

        selectedIndex =
            List.length before

        afterIndexes =
            List.range (List.length before + 1) (length ( before, selected, after ))
    in
    ( List.map2 f beforeIndexes before
    , f selectedIndex selected
    , List.map2 f afterIndexes after
    )


type Position
    = BeforeSelected
    | Selected
    | AfterSelected


{-| -}
indexedMapRelative : (Position -> Int -> a -> b) -> Zipper a -> Zipper b
indexedMapRelative f ( before, selected, after ) =
    ( List.indexedMap (\i elem -> f BeforeSelected (i * -1) elem) before
    , f Selected 0 selected
    , List.indexedMap (\i elem -> f AfterSelected i elem) before
    )


{-| -}
swapToFirst : Zipper a -> Zipper a
swapToFirst ( before, selected, after ) =
    case before of
        head :: tail ->
            ( tail ++ [ selected ], head, after )

        [] ->
            ( [], selected, after )


{-| -}
swapToLast : Zipper a -> Zipper a
swapToLast ( before, selected, after ) =
    case List.Extra.unconsLast after of
        Just ( last, rest ) ->
            ( before, last, rest ++ [ selected ] )

        Nothing ->
            ( before, selected, [] )


{-| -}
insertAtFirst : a -> Zipper a -> Zipper a
insertAtFirst elem ( before, selected, after ) =
    ( before ++ [ elem ], selected, after )


{-| -}
insertAtLast : a -> Zipper a -> Zipper a
insertAtLast elem ( before, selected, after ) =
    ( before, selected, after ++ [ elem ] )


{-| -}
insertToLeft : a -> Zipper a -> Zipper a
insertToLeft elem ( before, selected, after ) =
    ( [ elem ] ++ before, selected, after )


{-| -}
insertToRight : a -> Zipper a -> Zipper a
insertToRight elem ( before, selected, after ) =
    ( before, selected, [ elem ] ++ after )
