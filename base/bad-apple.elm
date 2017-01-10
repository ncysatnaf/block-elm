import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Time exposing (Time, second)


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { index : Time
  }


init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)


-- UPDATE


type Msg
  = Increment Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment newTime ->
      if model.index < 2192
        then (Model (model.index + 1) , Cmd.none)
        else (Model 0, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every (0.1 * second) Increment 

-- VIEW


view : Model -> Html Msg
view model =
  div [] 
    [ img [ src (format model.index) ] []
    , audio [autoplay True] [source [src "../audios/bgm.mp3", type_ "audio/wav"] []]
    ]

format : Float -> String
format index = 
  "../images/" ++ String.padLeft 4 '0' (toString ( round index)) ++ ".jpg"