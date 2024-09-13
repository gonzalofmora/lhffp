{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Collapse lambdas" #-}
module Exercises where


{-
Exercises: Type Matches

a) c
b) d
c) b
d) a
e) e
-}

-- Clave la partial aplication. 

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5


-- unCurrying: múltiples argumentos para una sola función

nonsense :: Bool -> Integer
nonsense True  = 805
nonsense False = 31337

curriedFunction :: Integer
                -> Bool
                -> Integer
curriedFunction i b = 
    i + (nonsense b)

uncurriedFunction :: (Integer, Bool)
                  -> Integer
uncurriedFunction (i, b) =
    i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonNested :: Integer
           -> Bool
           -> Integer
anonNested = 
  \i -> \b -> i + (nonsense b)

-- Exercises: Type Arguments


f :: a -> a -> a -> a -- 1 -no vale, lo hice sin querer antes pensé que era ejemplo, je
f = undefined

-- >>> :t f 'a'
-- f 'a' :: Char -> Char -> Char

g :: a -> b -> c -> b -- 2: Char
g = undefined

-- >>> :t g 0 'c' "woot"
-- g 0 'c' "woot" :: Char

h :: (Num a, Num b) => a -> b -> b -- 3: Num b => b | 4: Double
h = undefined

-- >>> :t h 1.0 2
-- h 1.0 2 :: Num b => b

-- >>> :t h 1 (5.5 :: Double)
-- h 1 (5.5 :: Double) :: Double

jackal :: (Ord a, Eq b) => a -> b -> a -- 5: [Char] | String - 6: Eq b => b -> [Char] | String
jackal = undefined 

-- >>> :t jackal "keyboard" "has the word jackal in it"
-- jackal "keyboard" "has the word jackal in it" :: String

-- >>> :t jackal "keyboard"
-- jackal "keyboard" :: Eq b => b -> String

kessel :: (Ord a, Num b) => a -> b -> a -- 7: (Num a, Ord a) => a | 8: (Num a, Ord a) => a  | 9: Integer
kessel = undefined

-- >>> :t kessel 1 2
-- kessel 1 2 :: (Ord a, Num a) => a

-- >>> :t kessel 1 (2 :: Integer)
-- kessel 1 (2 :: Integer) :: (Ord a, Num a) => a

-- >>> :t kessel (1 :: Integer) 2 
-- kessel (1 :: Integer) 2 :: Integer


f' :: a -> a -> a 
f' x _ = x


{-
Chapter exercises.

Multiple Choice

1) c
2) a
3) b
4) c

-}

