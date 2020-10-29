module MyListTests exposing (..)

import MyList exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Random

sumTests : Test
sumTests =
  describe "custom sum"
    [ test "returns 0 when empty" <|
        \_ ->
          sum Empty |> Expect.equal 0
    
    , test "return 2 for known set" <|
        \_ ->
          sum (Node 1 (Node 1 Empty))
            |> Expect.equal 2
    ]