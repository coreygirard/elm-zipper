# Apply key

### arrowLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L67) | `Zipper -> Zipper` |

### arrowLeftWithShift
| filepath | signature |
| :--- | :--- |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L107) | `Zipper -> Zipper` |

### arrowRight
| filepath | signature |
| :--- | :--- |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L151) | `Zipper -> Zipper` |

### arrowRightWithShift
| filepath | signature |
| :--- | :--- |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L191) | `Zipper -> Zipper` |

### typeKey
| filepath | signature |
| :--- | :--- |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L229) | `Char -> Zipper -> Zipper` |




# Create

### empty
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L144) | `Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L78) | `Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L139) | `Zipper a` |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L58) | `Zipper a b c` |
| [Zipper/StringStringString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString.elm#L49) | `Zipper` |
| [Zipper/StringStringString/WithCursor.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString/WithCursor.elm#L42) | `Zipper` |

### fromTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L167) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L106) | `( List a, b, List c ) -> Zipper a b c` |
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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L365) | `b -> ( List a, List c ) -> Zipper a b c` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L151) | `List a -> ( List a, List a ) -> Zipper a` |

### fromZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L899) | `(List a -> a) -> ( List a, List a, List a ) -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L389) | `(List b1 -> b2) -> ( List a, List b1, List c ) -> Zipper a b2 c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L179) | `( List a, List a, List a ) -> Zipper a` |

### singleton
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L161) | `a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L100) | `b -> Zipper a b c` |
| [Zipper/StringCharString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringCharString.elm#L46) | `Char -> Zipper` |

### toStrings
| filepath | signature |
| :--- | :--- |
| [Zipper/StringString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringString.elm#L37) | `Zipper -> ( String, String )` |




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
| [Zipper/ListElemList/Advanced.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListList/Advanced.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList/Advanced.elm](/) | `[ERROR]` |
| [Zipper/StringCharString.elm](/) | `[ERROR]` |
| [Zipper/StringString.elm](/) | `[ERROR]` |
| [Zipper/StringStringString.elm](/) | `[ERROR]` |
| [Zipper/StringStringString/WithCursor.elm](/) | `[ERROR]` |




# Filter

### filter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L748) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L643) | `(a -> Bool) -> (c -> Bool) -> Zipper a b c -> Zipper a b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L635) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L546) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L998) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L653) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L555) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1007) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L659) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L573) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L564) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L757) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L647) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### indexedFilter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1016) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L665) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L582) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1029) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L681) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L601) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1040) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L695) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L631) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L616) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |




# From/to other Zippers

### fromZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L77) | `(b1 -> List b2) -> Zipper.ListElemList.Advanced.Zipper a b1 c -> Zipper a b2 c` |

### fromZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L91) | `List b -> Zipper.ListList.Advanced.Zipper a c -> Zipper a b c` |

### toZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L84) | `(List b1 -> b2) -> Zipper a b1 c -> Zipper.ListElemList.Advanced.Zipper a b2 c` |

### toZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L98) | `Zipper a b c -> Zipper.ListList.Advanced.Zipper a c` |




# Get

### getAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L812) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L530) | `(a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> Maybe d` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L323) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L253) | `Int -> Zipper a -> Maybe a` |

### getAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L818) | `Int -> Zipper a -> a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L536) | `(a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> d` |

### getAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L824) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L542) | `(a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> Maybe d` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L346) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L840) | `Int -> Zipper a -> a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L561) | `(a -> d) -> (b -> d) -> (c -> d) -> Int -> Zipper a b c -> d` |

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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L460) | `Zipper a b c -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L288) | `Zipper a -> List a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L160) | `Zipper a b -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L235) | `Zipper a -> List a` |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L105) | `Zipper a b c -> List a` |
| [Zipper/StringStringString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString.elm#L71) | `Zipper -> String` |

### getRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L338) | `Zipper a -> List a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L482) | `Zipper a b c -> List c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L300) | `Zipper a -> List a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L166) | `Zipper a b -> List b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L247) | `Zipper a -> List a` |

### getSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L332) | `Zipper a -> a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L471) | `Zipper a b c -> b` |
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
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1052) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1064) | `Zipper a -> Int -> Maybe ( Position, Dists )` |

### indexAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1139) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L884) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L791) | `Zipper a -> Int -> Maybe Position` |

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
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L882) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L927) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L913) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L940) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexRanges
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1097) | ` Zipper a -> { fromFirst : { left : List Int , right : List Int } , fromLast : { left : List Int , right : List Int } , fromSplit : { left : List Int , right : List Int } , fromEdges : { left : List Int , right : List Int } }` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1118) | ` Zipper a -> { fromFirst : { left : List Int , selected : List Int , right : List Int } , fromLast : { left : List Int , selected : List Int , right : List Int } , fromLeftSplit : { left : List Int , selected : List Int , right : List Int } , fromRightSplit : { left : List Int , selected : List Int , right : List Int } }` |

### indexRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1164) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L914) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L828) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L970) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeLeftToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1017) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L857) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeRightToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1002) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeRightToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1030) | `Zipper a -> RelativeIndex -> Maybe Int` |

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
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1044) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |




# Insert

### insertAtFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L652) | `a -> Zipper a b c -> Zipper a b c` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L208) | `a -> Zipper a b -> Zipper a b` |

### insertAtLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L658) | `c -> Zipper a b c -> Zipper a b c` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L214) | `b -> Zipper a b -> Zipper a b` |

### insertFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1051) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L747) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L704) | `a -> Zipper a -> Zipper a` |

### insertLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1057) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L785) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L710) | `a -> Zipper a -> Zipper a` |

### insertLeftOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L716) | `a -> Zipper a -> Zipper a` |

### insertLeftOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L728) | `a -> Zipper a -> Zipper a` |

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
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L722) | `a -> Zipper a -> Zipper a` |

### insertRightOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L734) | `a -> Zipper a -> Zipper a` |

### insertRightOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1069) | `a -> Zipper a -> Zipper a` |

### insertRightOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L797) | `a -> Zipper a -> Zipper a` |

### insertToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L664) | `a -> Zipper a b c -> Zipper a b c` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L220) | `a -> Zipper a b -> Zipper a b` |

### insertToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L670) | `c -> Zipper a b c -> Zipper a b c` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L226) | `b -> Zipper a b -> Zipper a b` |




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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L611) | ` (Position -> Int -> a1 -> a2) -> (Int -> b1 -> b2) -> (Position -> Int -> c1 -> c2) -> Zipper a1 b1 c1 -> Zipper a2 b2 c2` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L485) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L388) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |

### indexedMapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L914) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L498) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L401) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L629) | ` (Position -> Int -> a1 -> a2) -> (b1 -> b2) -> (Position -> Int -> c1 -> c2) -> Zipper a1 b1 c1 -> Zipper a2 b2 c2` |

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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L489) | `(a1 -> a2) -> (b1 -> b2) -> (c1 -> c2) -> Zipper a1 b1 c1 -> Zipper a2 b2 c2` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L422) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L84) | `(a1 -> a2) -> (b1 -> b2) -> Zipper a1 b1 -> Zipper a2 b2` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L352) | `(a -> b) -> Zipper a -> Zipper b` |

### mapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L452) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L496) | `(a1 -> a2) -> Zipper a1 b c -> Zipper a2 b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L446) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L196) | `(a -> a) -> Zipper a b -> Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L370) | `(a -> a) -> Zipper a -> Zipper a` |

### mapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L458) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L503) | `(c1 -> c2) -> Zipper a b c1 -> Zipper a b c2` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L458) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L202) | `(b -> b) -> Zipper a b -> Zipper a b` |
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
| [Zipper/StringCharString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringCharString.elm#L83) | `Zipper -> Maybe Zipper` |

### moveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L656) | `Zipper a -> Result (Zipper a) (Zipper a)` |
| [Zipper/ListListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList/Advanced.elm#L65) | `(a -> b) -> Zipper a b c -> Result (Zipper a b c) (Zipper a b c)` |
| [Zipper/StringStringString.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/StringStringString.elm#L65) | `Zipper -> Result Zipper Zipper` |

### moveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L668) | `Zipper a -> Zipper a` |

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
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L680) | `Zipper a -> Zipper a` |

### moveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L692) | `Zipper a -> Zipper a` |

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

### moveToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L121) | `(a -> b) -> Zipper a b -> Result (Zipper a b) (Zipper a b)` |

### moveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L761) | `Int -> Zipper a -> Maybe (Zipper a)` |

### moveToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L141) | `(b -> a) -> Zipper a b -> Result (Zipper a b) (Zipper a b)` |

### selectNth
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L286) | `(a -> b) -> (b -> a) -> Int -> Zipper a b -> Maybe (Zipper a b)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L231) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L720) | `Zipper a -> Zipper a` |

### tryMoveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L662) | `Zipper a -> Zipper a` |

### tryMoveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L674) | `Zipper a -> Zipper a` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L269) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L739) | `Zipper a -> Zipper a` |

### tryMoveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L686) | `Zipper a -> Zipper a` |

### tryMoveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L698) | `Zipper a -> Zipper a` |

### tryMoveToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L133) | `(a -> b) -> Zipper a b -> Zipper a b` |

### tryMoveToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L153) | `(b -> a) -> Zipper a b -> Zipper a b` |




# Move (rename?)

### moveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L151) | `(a -> b) -> (b -> c) -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveLeftN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L228) | `(a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveLeftNNonnegative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L247) | `(a -> b) -> (b -> c) -> Int -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L184) | `(a -> b) -> (b -> c) -> (List a -> b -> List c -> Bool) -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L278) | `(b -> a) -> (c -> b) -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveRightN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L241) | `(a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveRightNNonnegative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L262) | `(b -> a) -> (c -> b) -> Int -> Zipper a b c -> Maybe (Zipper a b c)` |

### moveRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L213) | `(b -> a) -> (c -> b) -> (List a -> b -> List c -> Bool) -> Zipper a b c -> Maybe (Zipper a b c)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L163) | `(a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L290) | `(b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c` |




# Reverse

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L600) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L833) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L740) | `Zipper a -> Zipper a` |

### reverseLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1075) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L839) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L746) | `Zipper a -> Zipper a` |

### reverseRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1081) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L845) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L758) | `Zipper a -> Zipper a` |

### reverseSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L752) | `Zipper a -> Zipper a` |




# Select (rename?)

### selectFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L298) | `(a -> b) -> (b -> c) -> Zipper a b c -> Zipper a b c` |

### selectLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L333) | `(b -> a) -> (c -> b) -> Zipper a b c -> Zipper a b c` |

### selectNth
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L313) | `(a -> b) -> (b -> c) -> (c -> b) -> (b -> a) -> Int -> Zipper a b c -> Maybe (Zipper a b c)` |




# Set

### setAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L405) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L581) | `Zipper a b c -> Zipper a b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L391) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L311) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L434) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L587) | `Zipper a b c -> Zipper a b c` |

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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L425) | `List a2 -> Zipper a1 b c -> Zipper a2 b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L367) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L172) | `List a -> Zipper a b -> Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L293) | `List a -> Zipper a -> Zipper a` |

### setRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L388) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L449) | `List c2 -> Zipper a b c1 -> Zipper a b c2` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L379) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L178) | `List b -> Zipper a b -> Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L305) | `List a -> Zipper a -> Zipper a` |

### setSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L382) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L437) | `b2 -> Zipper a b1 c -> Zipper a b2 c` |
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
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L764) | `Zipper a -> Zipper a` |




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




# To other types

### toNonemptyListDropLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L401) | `Zipper a b c -> ( b, List c )` |

### toNonemptyListDropRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L413) | `Zipper a b c -> ( b, List a )` |

### toTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L136) | `Zipper a b c -> ( List a, b, List c )` |

### toZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L353) | `Zipper a b c -> ( List a, List c )` |

### toZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L377) | `(b1 -> List b2) -> Zipper a b1 c -> ( List a, List b2, List c )` |




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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L593) | `Zipper a b c -> Zipper a b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L573) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L484) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L529) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L599) | `Zipper a b c -> Zipper a b c` |

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
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L510) | `(List a1 -> List a2) -> Zipper a1 b c -> Zipper a2 b c` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L555) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L184) | `(List a -> List a) -> Zipper a b -> Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L452) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L494) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L524) | `(List c1 -> List c2) -> Zipper a b c1 -> Zipper a b c2` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L567) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L190) | `(List b -> List b) -> Zipper a b -> Zipper a b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L464) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L488) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L517) | `(b1 -> b2) -> Zipper a b1 c -> Zipper a b2 c` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L458) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L473) | `(List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L543) | `(List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L446) | `(List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |




# Utilities

### length
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L112) | `Zipper a b c -> Int` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L96) | `Zipper a b -> Int` |

### lengthLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L118) | `Zipper a b c -> Int` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L102) | `Zipper a b -> Int` |

### lengthRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L124) | `Zipper a b c -> Int` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L108) | `Zipper a b -> Int` |

### position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Advanced.elm#L130) | `Zipper a b c -> Int` |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L114) | `Zipper a b -> Int` |

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList/Advanced.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList/Advanced.elm#L90) | `Zipper a b -> Zipper b a` |




