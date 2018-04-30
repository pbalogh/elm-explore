module Main exposing (main)

import Html
import Models exposing (initialModel, Model)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg)

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.none

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
