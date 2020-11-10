module Queue exposing (Queue, dequeue, empty, enqueue, fromList, front, map, rear)

import Array exposing (Array)


type Queue a
    = Queue (Array a)


empty : Queue a
empty =
    Queue Array.empty


enqueue : a -> Queue a -> Queue a
enqueue value (Queue queue) =
    Queue (Array.push value queue)


dequeue : Queue a -> Queue a
dequeue (Queue queue) =
    Array.slice 1 (Array.length queue) queue
        |> Queue


front : Queue a -> Maybe a
front (Queue queue) =
    Array.get 0 queue


rear : Queue a -> Maybe a
rear (Queue queue) =
    Array.get (getLastIndex queue) queue


fromList : List a -> Queue a
fromList list =
    Array.fromList list
        |> Queue


map : (a -> b) -> Queue a -> Queue b
map func (Queue queue) =
    Array.map func queue
        |> Queue


getLastIndex : Array a -> Int
getLastIndex arr =
    Array.length arr - 1
