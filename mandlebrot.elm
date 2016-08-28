module Mandelbrot
    exposing
        ( Model
        , init
        , computeCell
        , computeRow
        , computerAll
        , view
        )

import Dict exposing (Dict)
import HTML exposing (..)
import HTML.Attributes exposing (..)
import Complex exposing (Complex)


maxIterations = 
    200

type alias Point = 
    ( Int, Int )

type alias Model = 
    { width: Int
    , height : Int
    , computed : Dict Point Int
    , min : Complex
    , max : Complex
    }

init : Int -> Model
init : size = 
    { width = size
    , height = size
    , computed = Dict.empty -1.5
    , max = Complex. 1 1.5
}

calculate: Int -> Complex -> Int -> Complex -> Maybe Int
calculate maxIterations c iterations z =
    let
     --z' = z^2 + c
     z' =
        Complex.mult z z
            |> Complex.add c
    in
        if iterations >= maxIterations then
            Nothing
        else if Complex.abs z' >= 2 then
            Just iterations
        else
            calculate maxIterations c (iterations + 1) z'


computeCell : Int -> Int -> Model -> Model
computeCell : 


