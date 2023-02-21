# elm-zipper

For most uses, look at `Zipper.ListElemList`, `Zipper.ListList` and `Zipper.ListListList` first.


There are a few general kinds of functions.

---

## Empty/singleton

Create the most basic zipper possible

---

## Create

Create from various sources, including tuples, etc.

---

## From zipper

Create a zipper by modifying a zipper of another kind

---

## To zipper

Convert to a zipper of another kind

---

## To list

Convert a zipper to a list or non-empty list in some way

---

## Length

Get the length of the zipper, or a component. Also functions to get the position of the selection/split

---

## Get

Functions that return some component of the zipper.

---

## Set

Functions that replace some component of the zipper

---

## Map

Functions that map over some component of the zipper. Mapping over elements of type List is done element-by-element

---

## Update

Functions that apply a function to some component of the zipper. Mapping over elements of type List is done as one object.

---

## Filter

Functions that filter list components.

---

## Select/move

Functions that preserve the elements and order of a zipper, but change the location of the selection/split

---

## Insert

Functions that insert new elements.

---

## Sort

Functions that sort the existing elements.

---

## Reverse

Reverse various portions of the zipper, or the entire zipper

---

## Swap

Functions that swap two elements, often involving the selection, the first, the last, or the elements to either side of the selection
