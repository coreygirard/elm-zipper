# Create

### empty
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L167) | `Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L191) | `Zipper a` |

### fromListAndIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L218) | `Int -> List a -> Maybe (Zipper a)` |

### fromTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L229) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L214) | `( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L242) | `( List a, List a, List a ) -> Zipper a` |

### fromZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L226) | `( List a, a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L248) | `(a -> List a) -> ( List a, a, List a ) -> Zipper a` |

### fromZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L241) | `a -> ( List a, List a ) -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L254) | `List a -> ( List a, List a ) -> Zipper a` |

### fromZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L253) | `(List a -> a) -> ( List a, List a, List a ) -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L238) | `( List a, List a, List a ) -> Zipper a` |

### singleton
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L984) | `a -> Zipper a` |




# Definition

### Dists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |

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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L205) | `(a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L179) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L197) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L138) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L185) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L206) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L147) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L191) | `(a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L215) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L224) | `(a -> Bool) -> Zipper a -> Zipper a` |

### filterSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L156) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> ( List a, Maybe a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L203) | `(a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L233) | `(a -> Bool) -> (a -> Bool) -> (a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilter
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L401) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L414) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L474) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L289) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L430) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L493) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L304) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L444) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L508) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |

### indexedFilterSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L523) | `IndexMethod -> (Position -> Int -> a -> Bool) -> Zipper a -> Zipper a` |




# Get

### getAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L169) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L261) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L260) | `Int -> Zipper a -> Maybe a` |

### getAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L175) | `Int -> Zipper a -> a` |

### getAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L181) | `Int -> Zipper a -> Maybe a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L284) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L198) | `Int -> Zipper a -> a` |

### getAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L298) | `RelativeIndex -> Zipper a -> Maybe a` |

### getAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L325) | `RelativeIndex -> Zipper a -> Maybe a` |

### getFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L269) | `Zipper a -> a` |

### getLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L290) | `Zipper a -> a` |

### getLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L301) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L305) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L331) | `Zipper a -> List a` |

### getRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L307) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L317) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L337) | `Zipper a -> List a` |

### getSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L313) | `Zipper a -> a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L343) | `Zipper a -> List a` |




# Indexes

### Dists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](/) | `[ERROR]` |
| [Zipper/ListElemList/Extra.elm](/) | `[ERROR]` |
| [Zipper/ListList.elm](/) | `[ERROR]` |
| [Zipper/ListListList.elm](/) | `[ERROR]` |

### absoluteIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L174) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L107) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L140) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L156) | `Zipper a -> Int -> Maybe ( Position, Dists )` |

### indexAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L338) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L226) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L340) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L370) | `Zipper a -> Int -> Maybe Position` |

### indexAbsoluteToRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L363) | `Zipper a -> Int -> Int` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L251) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L370) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L388) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L276) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L401) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L403) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L417) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexAbsoluteToRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L447) | `Zipper a -> Int -> RelativeIndex` |

### indexAbsoluteToRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L461) | `Zipper a -> Int -> Maybe RelativeIndex` |

### indexRanges
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L539) | ` Zipper a -> { fromFirst : { left : List Int , right : List Int } , fromLast : { left : List Int , right : List Int } , fromSplit : { left : List Int , right : List Int } , fromEdges : { left : List Int , right : List Int } }` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L613) | ` Zipper a -> { fromFirst : { left : List Int , selected : List Int , right : List Int } , fromLast : { left : List Int , selected : List Int , right : List Int } , fromLeftSplit : { left : List Int , selected : List Int , right : List Int } , fromRightSplit : { left : List Int , selected : List Int , right : List Int } }` |

### indexRangesFromEdges
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L516) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L374) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |

### indexRangesFromFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L536) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L394) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |

### indexRangesFromLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L553) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L411) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |

### indexRangesFromSelection
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L570) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L428) | `Zipper a -> { left : List Int, selected : Int, right : List Int }` |

### indexRelativeCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L605) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L463) | `Zipper a -> Int -> Maybe Position` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L628) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L728) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeLeftToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L753) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeLeftToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L768) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeRightCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L802) | `Zipper a -> RelativeIndex -> Maybe Position` |

### indexRelativeRightToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L827) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeRightToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L842) | `Zipper a -> RelativeIndex -> Maybe Int` |

### indexRelativeToAbsolute
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L640) | `Zipper a -> Int -> Int` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L498) | `Zipper a -> Int -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L653) | `Zipper a -> RelativeIndex -> Int` |

### indexRelativeToAbsoluteCheck
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L665) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L523) | `Zipper a -> Int -> Maybe Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L685) | `Zipper a -> RelativeIndex -> Maybe Int` |

### relativeIndexLeftToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1087) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |

### relativeIndexRightToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1095) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |

### relativeIndexToPosDists
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L865) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L617) | `Zipper a -> Int -> Maybe ( Position, Dists )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L902) | `Zipper a -> RelativeIndex -> Maybe ( Position, Dists )` |




# Insert

### insertFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L678) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L698) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L855) | `a -> Zipper a -> Zipper a` |

### insertLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L684) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L704) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L861) | `a -> Zipper a -> Zipper a` |

### insertLeftOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L867) | `a -> Zipper a -> Zipper a` |

### insertLeftOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L873) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L690) | `a -> Zipper a -> Zipper a` |

### insertLeftOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L710) | `a -> Zipper a -> Zipper a` |

### insertRightOfLeftSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L879) | `a -> Zipper a -> Zipper a` |

### insertRightOfRightSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L885) | `a -> Zipper a -> Zipper a` |

### insertRightOfSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L696) | `a -> Zipper a -> Zipper a` |

### insertRightOfSplit
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L716) | `a -> Zipper a -> Zipper a` |




# Length

### length
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L702) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L728) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L891) | `Zipper a -> Int` |

### lengthLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L708) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L740) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L897) | `Zipper a -> Int` |

### lengthRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L714) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L752) | `Zipper a -> Int` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L903) | `Zipper a -> Int` |

### lengthSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L909) | `Zipper a -> Int` |

### position
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L853) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L878) | `Zipper a -> Int` |

### positionFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L611) | `Zipper a -> Int` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L890) | `Zipper a -> Int` |

### positionLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1039) | `Zipper a -> Int` |

### positionLeftFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1045) | `Zipper a -> Int` |

### positionRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1051) | `Zipper a -> Int` |

### positionRightFromEnd
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1057) | `Zipper a -> Int` |




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
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L448) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L479) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L538) | `IndexMethod -> (Position -> Int -> a -> b) -> Zipper a -> Zipper b` |

### indexedMapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L319) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L492) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L551) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L332) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L505) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L564) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### indexedMapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L345) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L577) | `IndexMethod -> (Position -> Int -> a -> a) -> Zipper a -> Zipper a` |

### map
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L726) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L764) | `(a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L915) | `(a -> b) -> Zipper a -> Zipper b` |

### mapLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L536) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L776) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L924) | `(a -> a) -> Zipper a -> Zipper a` |

### mapRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L542) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L788) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L930) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L936) | `(a -> a) -> Zipper a -> Zipper a` |

### mapSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L554) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L800) | `(a -> b) -> (a -> b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L942) | `(a -> b) -> (a -> b) -> (a -> b) -> Zipper a -> Zipper b` |




# Move

### moveBothToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L951) | `Zipper a -> Zipper a` |

### moveBothToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L957) | `Zipper a -> Zipper a` |

### moveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L766) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L806) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L963) | `Zipper a -> Zipper a` |

### moveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L979) | `Zipper a -> Maybe (Zipper a)` |

### moveLeftToLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L985) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L991) | `Zipper a -> Zipper a` |

### moveLeftToRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L997) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L566) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L817) | `(List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L794) | `Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L823) | `Zipper a -> Maybe (Zipper a)` |

### moveRightToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1003) | `Zipper a -> Zipper a` |

### moveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1009) | `Zipper a -> Zipper a` |

### moveRightToLeftUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1015) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1021) | `Zipper a -> Zipper a` |

### moveRightToRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1027) | `(List a -> List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveRightUntil
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L578) | `(List a -> a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L834) | `(List a -> List a -> Bool) -> Zipper a -> Maybe (Zipper a)` |

### moveToFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L813) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L841) | `Zipper a -> Zipper a` |

### moveToIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L585) | `Int -> Zipper a -> Maybe (Zipper a)` |

### moveToIndexRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L605) | `Int -> Zipper a -> Maybe (Zipper a)` |

### moveToLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L820) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L848) | `Zipper a -> Zipper a` |

### moveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L855) | `Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1033) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |

### tryMoveLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1239) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1120) | `Zipper a -> Zipper a` |

### tryMoveLeftToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1222) | `Zipper a -> Zipper a` |

### tryMoveLeftToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1228) | `Zipper a -> Zipper a` |

### tryMoveRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1255) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1128) | `Zipper a -> Zipper a` |

### tryMoveRightToLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1234) | `Zipper a -> Zipper a` |

### tryMoveRightToRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1240) | `Zipper a -> Zipper a` |

### tryMoveToIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L851) | `Int -> Zipper a -> Zipper a` |

### tryMoveToIndexRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L859) | `Int -> Zipper a -> Zipper a` |

### tryMoveToN
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1137) | `Int -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1246) | `Int -> Int -> Zipper a -> Zipper a` |




# Reverse

### reverse
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L871) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L896) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1063) | `Zipper a -> Zipper a` |

### reverseLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L623) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L910) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1069) | `Zipper a -> Zipper a` |

### reverseRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L629) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L916) | `Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1075) | `Zipper a -> Zipper a` |

### reverseSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1081) | `Zipper a -> Zipper a` |




# Set

### setAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L635) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L928) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1103) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L664) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L674) | `Int -> a -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L940) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L680) | `Int -> a -> Zipper a -> Zipper a` |

### setAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1132) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1138) | `RelativeIndex -> a -> Zipper a -> Maybe (Zipper a)` |

### setFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L940) | `a -> Zipper a -> Zipper a` |

### setLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L951) | `a -> Zipper a -> Zipper a` |

### setLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L962) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L959) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1144) | `List a -> Zipper a -> Zipper a` |

### setRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L968) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L971) | `List a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1150) | `List a -> Zipper a -> Zipper a` |

### setSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L974) | `a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1156) | `List a -> Zipper a -> Zipper a` |

### trySetAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L866) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1078) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1253) | `Int -> a -> Zipper a -> Zipper a` |

### trySetAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L873) | `Int -> a -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1090) | `RelativeIndex -> a -> Zipper a -> Zipper a` |

### trySetAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1260) | `RelativeIndex -> a -> Zipper a -> Zipper a` |

### trySetAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1267) | `RelativeIndex -> a -> Zipper a -> Zipper a` |




# Sort

### sortByKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L686) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortByKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L706) | `(a -> comparable) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L977) | `(a -> comparable) -> Zipper a -> Zipper a` |

### sortKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1078) | `Zipper comparable -> Zipper comparable` |

### sortKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1099) | `Zipper comparable -> Zipper comparable` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L987) | `Zipper comparable -> Zipper comparable` |

### sortWithKeepElem
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L764) | `(a -> a -> Order) -> Zipper a -> Zipper a` |

### sortWithKeepIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L784) | `(a -> a -> Order) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L997) | `(a -> a -> Order) -> Zipper a -> Zipper a` |




# Swap

### swap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L796) | `Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1007) | `Int -> Int -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1192) | `Zipper a -> Zipper a` |

### swapSelectedWithFirst
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L802) | `Zipper a -> Zipper a` |

### swapSelectedWithIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L824) | `Int -> Zipper a -> Maybe (Zipper a)` |

### swapSelectedWithLast
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L813) | `Zipper a -> Zipper a` |

### trySwap
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1144) | `Int -> Int -> Zipper a -> Zipper a` |

### trySwapSelectedWithIndex
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L880) | `Int -> Zipper a -> Zipper a` |




# To

### toList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1197) | `Zipper a -> List a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1029) | `Zipper a -> List a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1198) | `Zipper a -> List a` |

### toTuple
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1203) | `Zipper a -> ( List a, a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1042) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1204) | `Zipper a -> ( List a, List a, List a )` |

### toZipperListElemList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1054) | `a -> Zipper a -> ( List a, a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1210) | `(List a -> a) -> Zipper a -> ( List a, a, List a )` |

### toZipperListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1215) | `Zipper a -> ( List a, List a )` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1216) | `Zipper a -> ( List a, List a )` |

### toZipperListListList
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1227) | `(a -> List a) -> Zipper a -> ( List a, List a, List a )` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1066) | `List a -> Zipper a -> ( List a, List a, List a )` |




# Update

### tryUpdateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L887) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1097) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1274) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L894) | `Int -> (a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1113) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1281) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### tryUpdateAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1288) | `RelativeIndex -> (a -> a) -> Zipper a -> Zipper a` |

### update
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1312) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1156) | `(List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1295) | `(List a -> List b) -> Zipper a -> Zipper b` |

### updateAt
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L901) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1162) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1339) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L930) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelative
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L940) | `Int -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1182) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeClamp
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L946) | `Int -> (a -> a) -> Zipper a -> Zipper a` |

### updateAtRelativeLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1368) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateAtRelativeRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1374) | `RelativeIndex -> (a -> a) -> Zipper a -> Maybe (Zipper a)` |

### updateLeft
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1372) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1201) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1301) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateRight
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1378) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1213) | `(List a -> List a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1307) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSelected
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList.elm#L1384) | `(a -> a) -> Zipper a -> Zipper a` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1313) | `(List a -> List a) -> Zipper a -> Zipper a` |

### updateSeparately
| filepath | signature |
| :--- | :--- |
| [Zipper/ListElemList/Extra.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListElemList/Extra.elm#L952) | `(List a -> List b) -> (a -> b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListList.elm#L1227) | `(List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |
| [Zipper/ListListList.elm](https://github.com/coreygirard/elm-zipper/blob/main/src/Zipper/ListListList.elm#L1319) | `(List a -> List b) -> (List a -> List b) -> (List a -> List b) -> Zipper a -> Zipper b` |




