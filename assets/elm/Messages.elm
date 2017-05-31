module Messages exposing (..)

import Http
import Model exposing (Bot)


type Msg
    = FetchResult (Result Http.Error Bot)
