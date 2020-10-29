module Signup exposing (User)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


initialModel : User
initialModel =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }



-- view : User -> Html msg
-- view user =
--     div []
--         [ h1 [ style "padding-left" "3cm" ] [ text "Sign up" ]
--         , styledForm []
--             [ div []
--                 [ text "Name"
--                 , styledInput [ id "name", type_ "text" ] []
--                 ]
--             , div []
--                 [ text "Email"
--                 , styledInput [ id "email", type_ "email" ] []
--                 ]
--             , div []
--                 [ text "Password"
--                 , styledInput [ id "password", type_ "password" ] []
--                 ]
--             , div []
--                 [ styledButton [ type_ "submit" ]
--                     [ text "Create my account" ]
--                 ]
--             ]
--         ]


view : User -> Html msg
view user =
    div []
        [ h1 [] [ text "Sign up" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text" ] []
                ]
            , div []
                [ text "Email"
                , input [ id "email", type_ "email" ] []
                ]
            , div []
                [ text "Password"
                , input [ id "password", type_ "password" ] []
                ]
            , div []
                [ button [ type_ "submit" ]
                    [ text "Create my account" ]
                ]
            ]
        ]


-- styledForm : List (Attribute msg) -> List (Html msg) -> Html msg
-- styledForm =
--     styled Html.Styled.form
--         [ borderRadius (px 5)
--         , backgroundColor (hex "#f2f2f2")
--         , padding (px 20)
--         , Css.width (px 300)
--         ]


-- styledInput : List (Attribute msg) -> List (Html msg) -> Html msg
-- styledInput =
--     styled Html.Styled.input
--         [ display block
--         , Css.width (px 260)
--         , padding2 (px 12) (px 20)
--         , margin2 (px 8) (px 0)
--         , border (px 0)
--         , borderRadius (px 4)
--         ]


-- styledButton : List (Attribute msg) -> List (Html msg) -> Html msg
-- styledButton =
--     styled Html.Styled.button
--         [ Css.width (px 300)
--         , backgroundColor (hex "#397cd5")
--         , color (hex "#fff")
--         , padding2 (px 14) (px 20)
--         , marginTop (px 10)
--         , border (px 0)
--         , borderRadius (px 4)
--         , fontSize (px 16)
--         ]



-- formStyle : List (Attribute msg)
-- formStyle =
--     [ style "border-radius" "5px"
--     , style "background-color" "#f2f2f2"
--     , style "padding" "20px"
--     , style "width" "300px"
--     ]
-- inputStyle : List (Attribute msg)
-- inputStyle =
--     [ style "display" "block"
--     , style "width" "260px"
--     , style "padding" "12px 20px"
--     , style "margin" "8px 0"
--     , style "border" "none"
--     , style "border-radius" "4px"
--     ]
-- buttonStyle : List (Attribute msg)
-- buttonStyle =
--     [ style "width" "300px"
--     , style "background-color" "#397cd5"
--     , style "color" "white"
--     , style "padding" "14px 20px"
--     , style "margin-top" "10px"
--     , style "border" "none"
--     , style "border-radius" "4px"
--     , style "font-size" "16px"
--     ]
-- main : VirtualDom.Node msg
-- main =
--     toUnstyled <| view initialModel


main : Html msg
main =
    view initialModel
