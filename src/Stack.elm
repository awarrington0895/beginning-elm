module Stack exposing (Stack, pop, push, top, empty, toList)

type Stack a = Stack (List a)

push : a -> Stack a -> Stack a
push value (Stack stack) =
    Stack (value :: stack)


pop : Stack a -> (Maybe a, Stack a)
pop (Stack stack) =
    case stack of
        [] ->
            (Nothing, empty)

        head :: tail ->
            (Just head, Stack tail)

toList : Stack a -> List a
toList (Stack stack) =
    stack

top : Stack a -> Maybe a
top (Stack stack) =
    List.head stack

empty : Stack a
empty =
    Stack []