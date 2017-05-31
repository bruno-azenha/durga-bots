-- web/elm/Contact/View.elm

module Node.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)


nodeView : Node -> Html Msg
nodeView model =
    let
        classes =
            classList
                [ ]

        node_name = model.text
    in
        div [][ text node_name ]
