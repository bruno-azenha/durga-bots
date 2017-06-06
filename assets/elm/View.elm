module View exposing (..)

import Bot.View exposing (botView)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    section
        []
        [ headerView
        , div []
            [ botView model ]
        ]


headerView : Html Msg
headerView =
    header
        [ class "jumbotron" ]
        [ h1
            []
            [ text "Phoenix and Elm: A real use case" ]
        ]
