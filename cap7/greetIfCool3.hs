{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use if" #-}
{-# HLINT ignore "Use max" #-}
{-# HLINT ignore "Redundant bracket" #-}
module GreetIfCool3 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
  case cool of 
    True  -> 
      putStrLn "eyyyy. What's shakin'?"
    False ->
      putStrLn "pshhhh."
  where cool =
          coolness == "downright frosty yo"


-- Exercies: Case Practice

functionC x y = if (x > y) then x else y

functionC' x y = case (x > y) of
    True  -> x
    False -> y