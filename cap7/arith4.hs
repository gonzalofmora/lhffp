{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant id" #-}
{-# HLINT ignore "Eta reduce" #-}
module Arith4 where

-- id :: a -> a
-- id x = x

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show 

roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' x = read (show x) 

main = do
  print (roundTrip 4)
  print (id 4)
  print (roundTrip' 4)
  print (roundTrip'' 4 :: Int) -- No entiendo bien qué onda pero esto permite mantener la flexibilidad de la función roundTrip''


