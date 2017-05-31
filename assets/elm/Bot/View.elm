module Bot.View exposing (botView)

import Node.View exposing (nodeView)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)


botView : Model -> Html Msg
botView model =
    div
        [ id "home_index" ]
        [ div
            []
            [ bot model ]
        ]


bot : Model -> Html Msg
bot model =
    if not(List.isEmpty(model.bot.nodes)) then
        model.bot.nodes
            |> List.map nodeView
            |> div [ class "node-wrapper" ]
    else
        let
            classes =
                classList
                    [ ( "warning", True ) ]
        in
            div
                [ classes ]
                [ span
                    [ class "fa-stack" ]
                    [ i [ class "fa fa-meh-o fa-stack-2x" ] [] ]
                , h4
                    []
                    [ text "No nodes found..." ]
                ]
