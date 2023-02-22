# Create

### empty
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L144) | `Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L139) | `Zipper a` |

### fromTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L167) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L155) | `( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L145) | `( List a, List a, List a ) -> Zipper a` |

### fromZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L167) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L157) | `(a -> List a) -> ( List a, a, List a ) -> Zipper a` |

### fromZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L875) | `a -> ( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L151) | `List a -> ( List a, List a ) -> Zipper a` |

### fromZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L899) | `(List a -> a) -> ( List a, List a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L179) | `( List a, List a, List a ) -> Zipper a` |

### singleton
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L161) | `a -> Zipper a` |




# Definition

### RelativeIndex
| filepath | signature |
| :--- | :--- |
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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L748) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L635) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L546) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L998) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L653) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L564) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1007) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L659) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L582) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L573) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L757) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L647) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L555) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1016) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L665) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L591) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1029) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L681) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L610) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1040) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L695) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L640) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L625) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |




# Get

### getAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L812) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L323) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L253) | `Int -> Zipper a -> Maybe a` |

### getAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L818) | `Int -> Zipper a -> a` |

### getAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L824) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L346) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L840) | `Int -> Zipper a -> a` |

### getAtRelativeToLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L269) | `Int -> Zipper a -> Maybe a` |

### getAtRelativeToRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L281) | `Int -> Zipper a -> Maybe a` |

### getFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L315) | `Zipper a -> a` |

### getLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L354) | `Zipper a -> a` |

### getLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L326) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L288) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L235) | `Zipper a -> List a` |

### getRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L338) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L300) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L247) | `Zipper a -> List a` |

### getSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L332) | `Zipper a -> a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L241) | `Zipper a -> List a` |




# Indexes

### Dists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](/) | `[ERROR]` |

### absoluteIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1319) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1053) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1073) | `Zipper a -> Int -> Maybe ( Position, Dists )` |

### indexAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1139) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L884) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L800) | `Zipper a -> Int -> Maybe Position` |

### indexAbsoluteToRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1199) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L939) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1224) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L970) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L891) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L936) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L922) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L949) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexRanges
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1098) | ` Zipper a -> { fromFirst : { left : List Int , right : List Int } , fromLast : { left : List Int , right : List Int } , fromSplit : { left : List Int , right : List Int } , fromEdges : { left : List Int , right : List Int } }` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1127) | ` Zipper a -> { fromFirst : { left : List Int , selected : List Int , right : List Int } , fromLast : { left : List Int , selected : List Int , right : List Int } , fromLeftSplit : { left : List Int , selected : List Int , right : List Int } , fromRightSplit : { left : List Int , selected : List Int , right : List Int } }` |

### indexRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1164) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L914) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L837) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L979) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeLeftToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1026) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L866) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeRightToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1011) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeRightToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1039) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1256) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1000) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1281) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1032) | `Zipper a -> RelativeIndex -> Maybe Int` |

### relativeIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1294) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1045) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |




# Insert

### insertFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1051) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L747) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L713) | `a -> Zipper a -> Zipper a` |

### insertLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1057) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L785) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L719) | `a -> Zipper a -> Zipper a` |

### insertLeftOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L725) | `a -> Zipper a -> Zipper a` |

### insertLeftOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L737) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1063) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L791) | `a -> Zipper a -> Zipper a` |

### insertRightOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L731) | `a -> Zipper a -> Zipper a` |

### insertRightOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L743) | `a -> Zipper a -> Zipper a` |

### insertRightOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1069) | `a -> Zipper a -> Zipper a` |

### insertRightOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L797) | `a -> Zipper a -> Zipper a` |




# Length

### length
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L185) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L240) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L187) | `Zipper a -> Int` |

### lengthLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L191) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L252) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L193) | `Zipper a -> Int` |

### lengthRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L197) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L264) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L205) | `Zipper a -> Int` |

### lengthSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L199) | `Zipper a -> Int` |

### position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L203) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L276) | `Zipper a -> Int` |

### positionLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L211) | `Zipper a -> Int` |

### positionLeftFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L223) | `Zipper a -> Int` |

### positionRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L217) | `Zipper a -> Int` |

### positionRightFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L229) | `Zipper a -> Int` |




# Map

### IndexMethod
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### Position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### indexedMap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L905) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L485) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L388) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |

### indexedMapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L914) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L498) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L401) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L932) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L511) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L427) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L923) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L414) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### map
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L287) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L422) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L352) | `(a -> b) -> Zipper a -> Zipper b` |

### mapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L452) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L446) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L370) | `(a -> a) -> Zipper a -> Zipper a` |

### mapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L458) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L458) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L382) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L376) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L299) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L434) | `(a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L361) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |




# Move

### moveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L219) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L709) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L665) | `Zipper a -> Result (Zipper a) (Zipper a)` |

### moveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L677) | `Zipper a -> Zipper a` |

### moveLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L237) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L253) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L728) | `Zipper a -> Maybe (Zipper a)` |

### moveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L689) | `Zipper a -> Zipper a` |

### moveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L701) | `Zipper a -> Zipper a` |

### moveRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L275) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L754) | `Zipper a -> Zipper a` |

### moveToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L779) | `Zipper a -> Zipper a` |

### moveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L761) | `Int -> Zipper a -> Maybe (Zipper a)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L231) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L720) | `Zipper a -> Zipper a` |

### tryMoveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L671) | `Zipper a -> Zipper a` |

### tryMoveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L683) | `Zipper a -> Zipper a` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L269) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L739) | `Zipper a -> Zipper a` |

### tryMoveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L695) | `Zipper a -> Zipper a` |

### tryMoveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L707) | `Zipper a -> Zipper a` |




# Reverse

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L600) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L833) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L749) | `Zipper a -> Zipper a` |

### reverseLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1075) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L839) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L755) | `Zipper a -> Zipper a` |

### reverseRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1081) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L845) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L767) | `Zipper a -> Zipper a` |

### reverseSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L761) | `Zipper a -> Zipper a` |




# Set

### setAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L405) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L391) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L311) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L434) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L440) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L403) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L446) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelativeToLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L340) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeToRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L346) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L365) | `a -> Zipper a -> Zipper a` |

### setLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L394) | `a -> Zipper a -> Zipper a` |

### setLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L376) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L367) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L293) | `List a -> Zipper a -> Zipper a` |

### setRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L388) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L379) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L305) | `List a -> Zipper a -> Zipper a` |

### setSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L382) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L299) | `List a -> Zipper a -> Zipper a` |




# Sort

### sortByKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L626) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortByKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L678) | `(a -> comparable) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L813) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L606) | `Zipper comparable -> Zipper comparable` |

### sortKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L666) | `Zipper comparable -> Zipper comparable` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L803) | `Zipper comparable -> Zipper comparable` |

### sortWithKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L646) | `(a -> a -> Order) -> Zipper a -> Zipper a` |

### sortWithKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L690) | `(a -> a -> Order) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L823) | `(a -> a -> Order) -> Zipper a -> Zipper a` |




# Swap

### swap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1087) | `Int -> Zipper a -> Maybe (Zipper a)` |

### swapToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L766) | `Zipper a -> Zipper a` |

### swapToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L777) | `Zipper a -> Zipper a` |

### swapTwo
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1114) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L851) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L773) | `Zipper a -> Zipper a` |




# To

### toList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L179) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L204) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L169) | `Zipper a -> List a` |

### toTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L173) | `Zipper a -> ( List a, a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L192) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L163) | `Zipper a -> ( List a, List a, List a )` |

### toZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L216) | `a -> Zipper a -> ( List a, a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L181) | `(List a -> a) -> Zipper a -> ( List a, a, List a )` |

### toZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L863) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L175) | `Zipper a -> ( List a, List a )` |

### toZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L887) | `(a -> List a) -> Zipper a -> ( List a, List a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L228) | `List a -> Zipper a -> ( List a, List a, List a )` |




# Update

### tryUpdateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L579) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L622) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### update
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L464) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L529) | `(List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L440) | `(List a -> List b) -> Zipper a -> Zipper b` |

### updateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L500) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L573) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L484) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L529) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L535) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L599) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L541) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelativeToLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L520) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeToRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L533) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L482) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L555) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L452) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L494) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L567) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L464) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L488) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L458) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L473) | `(List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L543) | `(List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L446) | `(List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |




