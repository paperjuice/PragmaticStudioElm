module Bingo exposing (..)

import Html exposing (..)



main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }

-- MESSAGE --
type Msg =
  Submit

-- MODEL --
type alias Entry =
  { id : Int
  , phrase : String
  , points : Int
  , market : Bool
  }

type alias Model =
  { name : String
  , gameNumber : Int
  , entries : List Entry
  }

model : Model
model =
  { name = "Vasile"
  , gameNumber = 1
  , entries =
    [ Entry 1 "Text1" 100 False
    , Entry 2 "Text2" 200 False
    ]
  }


-- VIEW --
view : Model -> Html msg
view model =
  div[]
     [ viewHeader model
     ,ul[]
         [ li [] [ text "1" ]
         , li [] [ text "2" ]
         , li [] [ text "3" ]
         ]
     ]

viewHeader model =
  div []
      [ header []
               [ div [] [ text "BUZZWORD BINGO"]
               , div []
                     [ text (
                       (model.name |> String.toUpper)
                       ++ " - GAME #"
                       ++ (model.gameNumber |> toString))
                     ]
               ]
      ]


-- UPDATE --
update : Msg -> Model -> Model
update msg model =
  case msg of
    _ ->
      model
