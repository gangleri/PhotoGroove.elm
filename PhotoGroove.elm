module PhotoGroove exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App

urlPrefix =
  "http://elm-in-action.com/"

view model = 
 div [class "content"] 
  [ h1 [] [text "Photo Grove"] 
  , div [ id "thumbnails"] (List.map (viewThumbnail model.selectedUrl ) model.photos)
  , img [ class "large", src (urlPrefix ++ "large/" ++ model.selectedUrl)] []
  ]

viewThumbnail selectedUrl thumbNail =
  img [ src (urlPrefix ++ thumbNail.url)
      , classList [("selected", selectedUrl == thumbNail.url)]  
      , onClick  { operation =  "SELECT_PHOTO", data = thumbNail.url }
     ] []

initialModel =
  { photos =
    [ { url = "1.jpeg" } 
    , { url = "2.jpeg" }
    , { url = "3.jpeg" }
    ]
  , selectedUrl = "1.jpeg"
  }

update msg model =
  if msg.operation == "SELECT_PHOTO" then
    {model | selectedUrl = msg.data }
  else
    model

main =
  Html.App.beginnerProgram
  { model = initialModel
  , view = view
  , update = update
  }
