module Model exposing (..)


type alias Model =
    { bot : Bot
    , error : Maybe String
    }


type alias Bot =
    { id : Int
    , name : String
    , description : String
    , nodes : List Node
    , first_node : Node
    }

type alias Node =
    { id : Int
    , text : String
    , buttons : List Button
    }

type alias Button =
    { id : Int
    , text : String
    , target_node : TargetNode
    }

type TargetNode = TargetNode ( Node )


initialBot : Bot
initialBot =
  { id = -1
  , name = "-"
  , description = "-"
  , first_node = initialFirstNode
  , nodes = []
  }

initialFirstNode : Node
initialFirstNode =
  { id = -1
  , text = "Simple node text"
  , buttons = []
  }


initialModel : Model
initialModel =
    { bot = initialBot
    , error = Nothing
    }
