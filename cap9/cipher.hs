module Cipher where

import Data.Char

caesar :: Int -> String -> String
caesar 0 xs       = xs
caesar n []       = caesar (n-1) []
caesar n (x : xs) = caesarMover n x : caesar n xs

caesarMover :: Int -> Char -> Char
caesarMover n x
  | isUpper x = if upperNeedsToStartOver then upperStartsOver else moveRight
  | lowerNeedsToStartOver = lowerStartsOver
  | otherwise = moveRight
  where
     upperNeedsToStartOver = moveRight > 'Z'
     lowerNeedsToStartOver = moveRight > 'z'
     moveRight             = chr (ord x + n)
     lowerStartsOver       = chr (rem (ord x - 98 + n)  25 + 97)
     upperStartsOver       = chr (rem (ord x - 66 + n)  25 + 65)


-- caesarMover :: Int -> Char -> Char
-- caesarMover n x = if isUpper x then 
--   if upperNeedToStartOver then upperStartOver else moveRight
--     else if lowerNeedToStartOver then lowerStartOver else moveRight
--     where
--      upperNeedToStartOver = moveRight > 'Z'
--      lowerNeedToStartOver = moveRight > 'z'
--      moveRight            = chr (ord x + n)
--      lowerStartOver       = chr (rem (ord x - 98 + n)  25 + 97)
--      upperStartOver       = chr (rem (ord x - 66 + n)  25 + 65)


