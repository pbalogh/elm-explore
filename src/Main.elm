module Main exposing (main)

import Html
import Models exposing (initialModel, Model)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg)
import Commands exposing (..)
import Navigation exposing (Location)
import Routing


init : Location -> (Model, Cmd Msg)
init location =
  let currentRoute = 
    Routing.parseLocation location
  in
    (initialModel currentRoute, fetchPlayers)

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.none

main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
