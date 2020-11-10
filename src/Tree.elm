module Tree exposing (Tree, contains, empty, insert, map, max, min, singleton, toOrderedList)


type Tree comparable
    = Empty
    | Node comparable (Tree comparable) (Tree comparable)


empty : Tree comparable
empty =
    Empty


singleton : comparable -> Tree comparable
singleton x =
    Node x Empty Empty


insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
        Empty ->
            singleton x

        Node y left right ->
            if x < y then
                Node y (insert x left) right

            else if x > y then
                Node y left (insert x right)

            else
                tree


toOrderedList : Tree comparable -> List comparable
toOrderedList tree =
    case tree of
        Empty ->
            []

        Node x left right ->
            (toOrderedList left ++ [ x ]) ++ toOrderedList right


max : Tree comparable -> Maybe comparable
max tree =
    case tree of
        Empty ->
            Nothing

        Node x _ Empty ->
            Just x

        Node y left right ->
            max right


min : Tree comparable -> Maybe comparable
min tree =
    case tree of
        Empty ->
            Nothing

        Node x Empty _ ->
            Just x

        Node y left right ->
            min left


map : (comparable -> comparable) -> Tree comparable -> Tree comparable
map f tree =
    case tree of
        Empty ->
            Empty

        Node x left right ->
            Node (f x) (map f left) (map f right)


contains : comparable -> Tree comparable -> Bool
contains v tree =
    case tree of
        Empty ->
            False

        Node x left right ->
            if x == v then
                True

            else if v > x then
                contains v right

            else
                contains v left
