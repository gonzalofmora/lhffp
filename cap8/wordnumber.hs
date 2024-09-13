{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use intercalate" #-}
module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eigth"
digitToWord 9 = "nine"


digits :: Int -> [Int]
digits 0 = []
digits n = snd (divMod n 10) : digits (fst (divMod n 10))

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . reverse . map digitToWord . digits 

