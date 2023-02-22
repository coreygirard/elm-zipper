# Create

### empty
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L144) | `Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L139) | `Zipper a` |

### fromListAndIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L173) | `List a -> Int -> Maybe (Zipper a)` |

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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L887) | `a -> ( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L151) | `List a -> ( List a, List a ) -> Zipper a` |

### fromZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L911) | `(List a -> a) -> ( List a, List a, List a ) -> Zipper a` |
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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L760) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L647) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L569) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1010) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L665) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L587) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1019) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L671) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L605) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L596) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L769) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L659) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L578) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1028) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L677) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L614) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1041) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L693) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L633) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1052) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L707) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L663) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L648) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |




# Get

### getAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L824) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L335) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L253) | `Int -> Zipper a -> Maybe a` |

### getAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L830) | `Int -> Zipper a -> a` |

### getAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L836) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L358) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L852) | `Int -> Zipper a -> a` |

### getAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L287) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L310) | `RelativeIndex -> Zipper a -> Maybe a` |

### getFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L327) | `Zipper a -> a` |

### getLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L366) | `Zipper a -> a` |

### getLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L338) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L300) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L235) | `Zipper a -> List a` |

### getRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L350) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L312) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L247) | `Zipper a -> List a` |

### getSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L344) | `Zipper a -> a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L241) | `Zipper a -> List a` |




# Indexes

### Dists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### absoluteIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1331) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1071) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1166) | `Zipper a -> Int -> Maybe ( Position, Dists )` |

### indexAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1151) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L902) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L877) | `Zipper a -> Int -> Maybe Position` |

### indexAbsoluteToRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1211) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L957) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1236) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L988) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L968) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1013) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L999) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1026) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexRanges
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1116) | ` Zipper a -> { fromFirst : { left : List Int , right : List Int } , fromLast : { left : List Int , right : List Int } , fromSplit : { left : List Int , right : List Int } , fromEdges : { left : List Int , right : List Int } }` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1220) | ` Zipper a -> { fromFirst : { left : List Int , selected : List Int , right : List Int } , fromLast : { left : List Int , selected : List Int , right : List Int } , fromLeftSplit : { left : List Int , selected : List Int , right : List Int } , fromRightSplit : { left : List Int , selected : List Int , right : List Int } }` |

### indexRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1176) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L932) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L914) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1056) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeLeftToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1103) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L943) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeRightToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1088) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeRightToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1116) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1268) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1018) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1293) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1050) | `Zipper a -> RelativeIndex -> Maybe Int` |

### relativeIndexLeftToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1129) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |

### relativeIndexRightToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1137) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |

### relativeIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1306) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1063) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |




# Insert

### insertFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1063) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L765) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L760) | `a -> Zipper a -> Zipper a` |

### insertLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1069) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L803) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L766) | `a -> Zipper a -> Zipper a` |

### insertLeftOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L772) | `a -> Zipper a -> Zipper a` |

### insertLeftOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L784) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1075) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L809) | `a -> Zipper a -> Zipper a` |

### insertRightOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L778) | `a -> Zipper a -> Zipper a` |

### insertRightOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L790) | `a -> Zipper a -> Zipper a` |

### insertRightOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1081) | `a -> Zipper a -> Zipper a` |

### insertRightOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L815) | `a -> Zipper a -> Zipper a` |




# Length

### length
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L191) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L240) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L187) | `Zipper a -> Int` |

### lengthLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L197) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L252) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L193) | `Zipper a -> Int` |

### lengthRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L203) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L264) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L205) | `Zipper a -> Int` |

### lengthSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L199) | `Zipper a -> Int` |

### position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L209) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L276) | `Zipper a -> Int` |

### positionFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L215) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L288) | `Zipper a -> Int` |

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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L917) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L497) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L411) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |

### indexedMapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L926) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L510) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L424) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L944) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L523) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L450) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L935) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L437) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### map
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L299) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L434) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L375) | `(a -> b) -> Zipper a -> Zipper b` |

### mapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L464) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L458) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L393) | `(a -> a) -> Zipper a -> Zipper a` |

### mapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L470) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L470) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L405) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L399) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L311) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L446) | `(a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L384) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |




# Move

### moveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L231) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L721) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L688) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L706) | `Zipper a -> Zipper a` |

### moveLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L249) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L265) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L746) | `Zipper a -> Maybe (Zipper a)` |

### moveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L718) | `Zipper a -> Zipper a` |

### moveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L730) | `Zipper a -> Zipper a` |

### moveRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L287) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L560) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L772) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L742) | `Zipper a -> Zipper a` |

### moveToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L587) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L797) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L748) | `Zipper a -> Zipper a` |

### moveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L567) | `Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L779) | `Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L754) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L243) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L732) | `Zipper a -> Zipper a` |

### tryMoveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L694) | `Zipper a -> Zipper a` |

### tryMoveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L712) | `Zipper a -> Zipper a` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L281) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L757) | `Zipper a -> Zipper a` |

### tryMoveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L724) | `Zipper a -> Zipper a` |

### tryMoveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L736) | `Zipper a -> Zipper a` |




# Reverse

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L612) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L851) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L796) | `Zipper a -> Zipper a` |

### reverseLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1087) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L857) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L802) | `Zipper a -> Zipper a` |

### reverseRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1093) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L863) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L814) | `Zipper a -> Zipper a` |

### reverseSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L808) | `Zipper a -> Zipper a` |




# Set

### setAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L417) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L403) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L334) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L446) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L452) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L415) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L458) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L363) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L369) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L377) | `a -> Zipper a -> Zipper a` |

### setLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L406) | `a -> Zipper a -> Zipper a` |

### setLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L388) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L379) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L316) | `List a -> Zipper a -> Zipper a` |

### setRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L400) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L391) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L328) | `List a -> Zipper a -> Zipper a` |

### setSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L394) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L322) | `List a -> Zipper a -> Zipper a` |




# Sort

### sortByKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L638) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortByKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L690) | `(a -> comparable) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L831) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L618) | `Zipper comparable -> Zipper comparable` |

### sortKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L678) | `Zipper comparable -> Zipper comparable` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L821) | `Zipper comparable -> Zipper comparable` |

### sortWithKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L658) | `(a -> a -> Order) -> Zipper a -> Zipper a` |

### sortWithKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L702) | `(a -> a -> Order) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L841) | `(a -> a -> Order) -> Zipper a -> Zipper a` |




# Swap

### swap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1126) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L869) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L820) | `Zipper a -> Zipper a` |

### swapSelectedWithFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L778) | `Zipper a -> Zipper a` |

### swapSelectedWithLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L789) | `Zipper a -> Zipper a` |

### swapSelectedWithN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1099) | `Int -> Zipper a -> Maybe (Zipper a)` |




# To

### toList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L185) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L204) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L169) | `Zipper a -> List a` |

### toTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L179) | `Zipper a -> ( List a, a, List a )` |
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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L875) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L175) | `Zipper a -> ( List a, List a )` |

### toZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L899) | `(a -> List a) -> Zipper a -> ( List a, List a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L228) | `List a -> Zipper a -> ( List a, List a, List a )` |




# Update

### tryUpdateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L591) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L634) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### update
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L476) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L541) | `(List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L463) | `(List a -> List b) -> Zipper a -> Zipper b` |

### updateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L512) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L585) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L507) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L541) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L547) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L611) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L553) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L543) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L556) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L494) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L567) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L475) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L506) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L579) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L487) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L500) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L481) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L485) | `(List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L555) | `(List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L469) | `(List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |




