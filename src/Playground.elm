module Playground exposing
    ( Character
    , Greeting(..)
    , arya
    , getAdultAge
    , main
    , sansa
    , sayHello
    , signUp
    )

import Html exposing (Html, text)
import MyList exposing (..)
import Regex


type Greeting
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


sayHello : Greeting -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "How y'all doin'?"

        Hola ->
            "Hola amigo!"

        Namaste message ->
            message

        NumericalHi value1 value2 ->
            value1 + value2 |> String.fromInt


welcomeMessage : Bool -> String
welcomeMessage isLoggedIn =
    case isLoggedIn of
        True ->
            "Welcome to my awesome site!"

        False ->
            "Please log in."


escapeEarth myVelocity mySpeed =
    if myVelocity > 11.186 then
        "Godspeed"

    else if mySpeed == 7.67 then
        "Stay in orbit"

    else
        "Come back"


signUp : String -> String -> Result String String
signUp email ageStr =
    case String.toInt ageStr of
        Nothing ->
            Err "Age must be an integer."

        Just age ->
            let
                emailPattern =
                    "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                regex =
                    Maybe.withDefault Regex.never <|
                        Regex.fromString emailPattern

                isValidEmail =
                    Regex.contains regex email
            in
            if age < 13 then
                Err "You need to be at least 13 years old to sign up."

            else if isValidEmail then
                Ok "Your account has been created successfully!"

            else
                Err "You entered an invalid email."


type alias Character =
    { name : String
    , age : Maybe Int
    }


sansa : Character
sansa =
    { name = "Sansa"
    , age = Just 19
    }


arya : Character
arya =
    { name = "Arya"
    , age = Nothing
    }


getAdultAge : Character -> Maybe Int
getAdultAge character =
    case character.age of
        Nothing ->
            Nothing

        Just age ->
            if age >= 18 then
                Just age

            else
                Nothing


list1 : MyList a
list1 =
    Empty


list2 : MyList number
list2 =
    Node 9 Empty


main : Html msg
main =
    isEmpty list2
        |> Debug.toString
        |> text
