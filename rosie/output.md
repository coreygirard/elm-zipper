# Create

### empty
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L206) | `Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L236) | `Zipper a` |

### fromListAndIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L247) | `Int -> List a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L224) | `Int -> List a -> Maybe (Zipper a)` |

### fromTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L263) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L239) | `( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L262) | `( List a, List a, List a ) -> Zipper a` |

### fromZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L251) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L274) | `(a -> List a) -> ( List a, a, List a ) -> Zipper a` |

### fromZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L275) | `a -> ( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L286) | `List a -> ( List a, List a ) -> Zipper a` |

### fromZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L287) | `(List a -> a) -> ( List a, List a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L263) | `( List a, List a, List a ) -> Zipper a` |

### singleton
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L686) | `a -> Zipper a` |




# Definition

### Lengths
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |

### Position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### RelativeIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### Section
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### Zipper
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |




# Filter

### filter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L226) | `(a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L218) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L248) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L85) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L94) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L94) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L94) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L100) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L103) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L112) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L103) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L112) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L121) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L381) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L299) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L338) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L159) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L184) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L196) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L174) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L198) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L221) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L246) | `(Position -> a -> Bool) -> Zipper a -> Zipper a` |




# Get

### getAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L116) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L135) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L130) | `Int -> Zipper a -> Maybe a` |

### getAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L136) | `Int -> Zipper a -> a` |

### getAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L143) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L169) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L151) | `Int -> Zipper a -> a` |

### getAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L150) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L180) | `RelativeIndex -> Zipper a -> Maybe a` |

### getFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L303) | `Zipper a -> a` |

### getLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L324) | `Zipper a -> a` |

### getLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L341) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L275) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L298) | `Zipper a -> List a` |

### getRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L353) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L287) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L310) | `Zipper a -> List a` |

### getSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L365) | `Zipper a -> a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L322) | `Zipper a -> List a` |




# Indexes

### calcIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L140) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L140) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L148) | `Zipper a -> Int -> Maybe Position` |

### calcIndexLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L168) | `Lengths -> Int -> Position` |

### calcIndexRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L194) | `Lengths -> Int -> Position` |

### calcIndexSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L181) | `Lengths -> Int -> Position` |

### calcIndexes
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L196) | `Zipper a -> { left : List Position, selected : Position, right : List Position }` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L181) | `Zipper a -> { left : List Position, right : List Position }` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L207) | `Zipper a -> { left : List Position, selected : List Position, right : List Position }` |

### indexRelativeLeftToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L393) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeRightToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L425) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L436) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L362) | `Zipper a -> RelativeIndex -> Int` |




# Insert

### insertFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L448) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L383) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L440) | `a -> Zipper a -> Zipper a` |

### insertLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L460) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L395) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L446) | `a -> Zipper a -> Zipper a` |

### insertLeftOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L452) | `a -> Zipper a -> Zipper a` |

### insertLeftOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L458) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L472) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L407) | `a -> Zipper a -> Zipper a` |

### insertRightOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L464) | `a -> Zipper a -> Zipper a` |

### insertRightOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L470) | `a -> Zipper a -> Zipper a` |

### insertRightOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L484) | `a -> Zipper a -> Zipper a` |

### insertRightOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L419) | `a -> Zipper a -> Zipper a` |




# Length

### length
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L496) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L431) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L476) | `Zipper a -> Int` |

### lengthLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L508) | `Zipper a -> Int` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L274) | `Zipper a -> Int` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L337) | `Zipper a -> Int` |

### lengthRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L520) | `Zipper a -> Int` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L286) | `Zipper a -> Int` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L343) | `Zipper a -> Int` |

### lengthSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L349) | `Zipper a -> Int` |

### position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L594) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L521) | `Zipper a -> Int` |

### positionFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L334) | `Zipper a -> Int` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L364) | `Zipper a -> Int` |

### positionLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L549) | `Zipper a -> Int` |

### positionLeftFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L412) | `Zipper a -> Int` |

### positionRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L555) | `Zipper a -> Int` |

### positionRightFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L418) | `Zipper a -> Int` |




# Map

### indexedMap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L404) | `(Position -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L333) | `(Position -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L363) | `(Position -> a -> b) -> Zipper a -> Zipper b` |

### indexedMapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L189) | `(Position -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L213) | `(Position -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L267) | `(Position -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L202) | `(Position -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L226) | `(Position -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L286) | `(Position -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L215) | `(Position -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L305) | `(Position -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L237) | `(Position -> a -> b) -> (Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L256) | `(Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L324) | `(Position -> a -> b) -> (Position -> a -> b) -> (Position -> a -> b) -> Zipper a -> Zipper b` |

### map
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L532) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L443) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L482) | `(a -> b) -> Zipper a -> Zipper b` |

### mapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L250) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L298) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L355) | `(a -> a) -> Zipper a -> Zipper a` |

### mapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L256) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L310) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L361) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L367) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L268) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L322) | `(a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L373) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |




# Move

### moveBothToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L491) | `Zipper a -> Zipper a` |

### moveBothToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L497) | `Zipper a -> Zipper a` |

### moveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L548) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L459) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L503) | `Zipper a -> Zipper a` |

### moveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L519) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L382) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L525) | `Zipper a -> Zipper a` |

### moveLeftToRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L388) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L280) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L328) | `(List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L564) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L480) | `Zipper a -> Maybe (Zipper a)` |

### moveRightToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L531) | `Zipper a -> Zipper a` |

### moveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L537) | `Zipper a -> Zipper a` |

### moveRightToLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L394) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L543) | `Zipper a -> Zipper a` |

### moveRightToRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L400) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L292) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L334) | `(List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L576) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L497) | `Zipper a -> Zipper a` |

### moveToIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L308) | `Int -> Zipper a -> Maybe (Zipper a)` |

### moveToIndexRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L328) | `Int -> Zipper a -> Maybe (Zipper a)` |

### moveToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L588) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L509) | `Zipper a -> Zipper a` |

### moveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L341) | `Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L406) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L843) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L638) | `Zipper a -> Zipper a` |

### tryMoveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L619) | `Zipper a -> Zipper a` |

### tryMoveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L625) | `Zipper a -> Zipper a` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L859) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L656) | `Zipper a -> Zipper a` |

### tryMoveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L631) | `Zipper a -> Zipper a` |

### tryMoveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L637) | `Zipper a -> Zipper a` |

### tryMoveToIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L568) | `Int -> Zipper a -> Zipper a` |

### tryMoveToIndexRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L576) | `Int -> Zipper a -> Zipper a` |

### tryMoveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L508) | `Int -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L506) | `Int -> Int -> Zipper a -> Zipper a` |




# Reverse

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L606) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L533) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L561) | `Zipper a -> Zipper a` |

### reverseLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L340) | `Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L370) | `Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L424) | `Zipper a -> Zipper a` |

### reverseRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L346) | `Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L376) | `Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L430) | `Zipper a -> Zipper a` |

### reverseSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L436) | `Zipper a -> Zipper a` |




# Set

### setAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L352) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L388) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L442) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L378) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L388) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L415) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L394) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L468) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L474) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L618) | `a -> Zipper a -> Zipper a` |

### setLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L635) | `a -> Zipper a -> Zipper a` |

### setLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L652) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L545) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L567) | `List a -> Zipper a -> Zipper a` |

### setRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L664) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L557) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L573) | `List a -> Zipper a -> Zipper a` |

### setSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L676) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L579) | `List a -> Zipper a -> Zipper a` |

### trySetAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L583) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L463) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L513) | `Int -> a -> Zipper a -> Zipper a` |

### trySetAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L590) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L476) | `RelativeIndex -> a -> Zipper a -> Zipper a` |

### trySetAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L520) | `RelativeIndex -> a -> Zipper a -> Zipper a` |

### trySetAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L527) | `RelativeIndex -> a -> Zipper a -> Zipper a` |




# Sort

### sortByKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L400) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortByKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L420) | `(a -> comparable) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L421) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortByKeepIndexes
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L480) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L748) | `Zipper comparable -> Zipper comparable` |

### sortKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L775) | `Zipper comparable -> Zipper comparable` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L569) | `Zipper comparable -> Zipper comparable` |

### sortKeepIndexes
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L585) | `Zipper comparable -> Zipper comparable` |

### sortWithKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L478) | `(a -> a -> Order) -> Zipper a -> Zipper a` |

### sortWithKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L498) | `(a -> a -> Order) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L431) | `(a -> a -> Order) -> Zipper a -> Zipper a` |

### sortWithKeepIndexes
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L490) | `(a -> a -> Order) -> Zipper a -> Zipper a` |




# Swap

### swap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L510) | `Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L441) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L500) | `Zipper a -> Zipper a` |

### swapSelectedWithFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L516) | `Zipper a -> Zipper a` |

### swapSelectedWithIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L538) | `Int -> Zipper a -> Maybe (Zipper a)` |

### swapSelectedWithLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L527) | `Zipper a -> Zipper a` |

### trySwap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L515) | `Int -> Int -> Zipper a -> Zipper a` |

### trySwapSelectedWithIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L597) | `Int -> Zipper a -> Zipper a` |




# To

### toList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L794) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L585) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L595) | `Zipper a -> List a` |

### toTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L807) | `Zipper a -> ( List a, a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L598) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L601) | `Zipper a -> ( List a, List a, List a )` |

### toZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L610) | `a -> Zipper a -> ( List a, a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L607) | `(List a -> a) -> Zipper a -> ( List a, a, List a )` |

### toZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L819) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L613) | `Zipper a -> ( List a, List a )` |

### toZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L831) | `(a -> List a) -> Zipper a -> ( List a, List a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L622) | `List a -> Zipper a -> ( List a, List a, List a )` |




# Update

### tryUpdateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L604) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L483) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L534) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L611) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L500) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L541) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L548) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### update
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L871) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L670) | `(List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L643) | `(List a -> List b) -> Zipper a -> Zipper b` |

### updateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L618) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L521) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L575) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L644) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L654) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L556) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L660) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L601) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L607) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L886) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L575) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L655) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L898) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L587) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L661) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L910) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L667) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L666) | `(List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Extra.elm#L601) | `(List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Extra.elm#L555) | `(List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |




