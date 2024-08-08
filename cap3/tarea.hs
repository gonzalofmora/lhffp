-- tarea.hs
module Tarea where

excitement :: String -> String
excitement str = (++) str "!"

onlyOne :: String -> Char
onlyOne str = str !! 4 -- La mía era: head (drop 4 str) pero VSC tiene razón que str !! 4 es más directa

oneWord :: String -> String
oneWord = drop 9 -- La mía era oneWord str = drop 8 str pero no hace falta la variable, porque drop 9 espera una variable más


thirdLetter :: String -> Char
thirdLetter str = str !! 2


letterIndex :: Int -> Char
letterIndex i = "Curry is awesome" !! (i - 1)