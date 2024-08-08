-- ex5.hs
module Reverse where


rvrs :: String -> String
rvrs str = drop 9 str ++ " " ++ take 3 (drop 6 str) ++ take 5 str


-- version con where:

rvrs' :: String -> String
rvrs' str = awesome ++ " " ++ is ++ curry
  where
    curry = take 5 str
    is = take 3 (drop 6 str)
    awesome = drop 9 str


main :: IO ()
main = do
    print (rvrs "Curry is awesome")
    print $ rvrs' "Curry is awesome"