module Rpg exposing (..)

import Html exposing (Html, div, text, program)
import Msgs exposing (Msg)
import Models exposing (Model)
import Update exposing (update)
import View exposing (view)

init : (Model, Cmd Msg)
init = 
  ("Hello", Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
