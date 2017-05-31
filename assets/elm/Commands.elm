module Commands exposing (..)

import Decoders exposing (botDecoder)
import Http
import Messages exposing (Msg(..))


fetch : Cmd Msg
fetch =
    let
        apiUrl =
            "/api/bot/1"

        request =
            Http.get apiUrl botDecoder
    in
        Http.send FetchResult request
