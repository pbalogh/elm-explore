module SvgApp exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Mouse
import Keyboard
import Random

type alias Event = {
    date : String
    , title : String
}

type alias Model = List Event

type Msg 
  = Click String
  | MouseMsg Mouse.Position
  | KeyMsg Keyboard.KeyCode
  | OnResult Int

init : (Model, Cmd Msg)
init = 
  ( [], Cmd.none)

getAppendedModel : String -> Model -> Model
getAppendedModel str mod = 
  (Event "somedate" str) :: mod  

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
  case msg of
    Click str ->
      ((getAppendedModel str model), Cmd.none)
    KeyMsg code ->
      ((Event (toString code) (toString code)) :: model, Random.generate OnResult (Random.int 1 6))
    MouseMsg evt ->
      ((Event (toString evt) (toString evt)) :: model, Cmd.none)
    OnResult res ->
      ((Event (toString res) (toString res)) :: model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.batch
    [ Mouse.clicks MouseMsg
    , Keyboard.downs KeyMsg
    ]

view : Model -> Html Msg
view model = 
  div [ class "foo", onClick (Click "happpy")] [text (toString model)]
