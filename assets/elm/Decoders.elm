module Decoders exposing (..)

import Json.Decode as JD exposing (..)
import Json.Decode.Extra exposing ((|:))
import Model exposing (..)


botDecoder : JD.Decoder Bot
botDecoder =
    succeed
        Bot
        |: (field "id" int)
        |: (field "name" string)
        |: (field "description" string)
        |: (field "nodes" (list nodeDecoder))
        |: (field "first_node_" nodeDecoder)


nodeDecoder : JD.Decoder Node
nodeDecoder =
    succeed
        Node
        |: (field "id" int)
        |: (field "text" string)
        |: (field "buttons" (list (JD.lazy (\_ -> buttonDecoder))))

buttonDecoder : JD.Decoder Button
buttonDecoder =
    succeed
        Button
        |: (field "id" int)
        |: (field "text" string)
        |: (field "target_node" targetNodeDecoder)

targetNodeDecoder : JD.Decoder TargetNode
targetNodeDecoder =
    succeed
        TargetNode
        |: (field "id" nodeDecoder)
