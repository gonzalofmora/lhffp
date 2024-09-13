{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Use if" #-}
module TupleFunctions where

addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x


-- Exercies:
-- Variety Pack

-- 1)
-- a) k :: (a, b) -> a
-- b) k2 :: String. Different than k1 and k3
-- c) k3 will return the number 3 -> Nop. k1 also.

k (x, y) = x

k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

-- >>> k1
-- 3

-- (3,10)

-- >>> k3
-- 3


f :: (a, b, c)
  -> (d, e, f)
  -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))

-- Uso de case _ of

pal xs =
  case xs == reverse xs of
    True  -> "yes"
    False -> "no"

-- Acá el where está por si hay que reutilizar la y
pal' xs =
    case y of
        True  -> "yes"
        False -> "no"
    where y = xs == reverse xs