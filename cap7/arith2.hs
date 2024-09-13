{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use print" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use if" #-}
module Arith2 where

add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePF :: Int -> Int
addOnePF = (+1)

main :: IO ()
main = do
    print (0 :: Int)                 -- 0
    print (add 1 0)                  -- 1
    print (addOne 0)                 -- 1
    print (addOnePF 0)               -- 1
    print ((addOne   . addOne) 0)    -- 2
    print ((addOnePF . addOne) 0)    -- 2
    print ((addOne   . addOnePF) 0)  -- 2
    print ((addOnePF . addOnePF) 0)  -- 2
    print (negate (addOne 0))        -- -1
    print ((negate . addOne) 0)      -- -1
    print ((addOne . addOne . addOne
             . negate . addOne) 0)   -- 2


-- Algo piola a paritr de la diferencia entre print y putStr/putStrLn

-- >>> :t print
-- print :: Show a => a -> IO ()

-- >>> :t putStrLn
-- putStrLn :: String -> IO ()

-- >>> :t show
-- show :: Show a => a -> String

-- putStr pide una String y print pide un show a => a. Ambos imprimen en pantalla. Pero que pasa. print puede ser una function composition de putStrLn y show.

-- podemos hacer esto:

print' :: Show a => a -> IO ()
print' a = putStrLn (show a)

-- Pero también podemos hacer esto:

print'' :: Show a => a -> IO ()
print'' a = (putStrLn . show) a

-- La diferencia clave en el primero con el segundo. Es que el segundo puede no tener argumento y va a funcionar igual. El primero no. 

printPF :: Show a => a -> IO ()
printPF = putStrLn . show

-- Exercises: 
-- Multiple Choice

-- 1) d
-- 2) b
-- 3) d
-- 4) b
-- 5) a


tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' = snd . flip divMod 10 . fst . flip divMod 10 

hunsD :: Integral a => a -> a
hunsD x = d2
    where d  = x `div` 100
          d2 = d `mod`10

hunsD' :: Integral a => a -> a
hunsD' = snd . flip divMod 10 . fst . flip divMod 100


foldBool :: a -> a -> Bool -> a
foldBool x y z = case z of
    True -> x
    False -> y 

foldBool' :: a -> a -> Bool -> a
foldBool' x y z
  | z         = x
  | otherwise = y

g :: (a -> b) -> (a, c) -> (b, c)
g aToB (a, c) = (aToB a, c)

