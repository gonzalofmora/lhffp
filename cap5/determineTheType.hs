{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant $" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Eta reduce" #-}

module DetermineTheType where

-- simple example
example = 1

-- >>> :t example
-- example :: Num a => a

-- >>> :t f "hola"
-- f "hola" :: Num a => a


-- Num a => a
-- >>> :t (* 9) 6
-- (* 9) 6 :: Num a => a

-- Num a => (a, String)
-- >>> :t head [(0, "doge"), (1, "kitteh")]
-- head [(0, "doge"), (1, "kitteh")] :: Num a => (a, String)

-- (Integer, String)
-- >>> :t head [(0 :: Integer, "doge"), (1, "kitteh")]
-- head [(0 :: Integer, "doge"), (1, "kitteh")] :: (Integer, String)

-- Bool
-- >>> :t if False then True else False
-- if False then True else False :: Bool

-- Int
-- >>> :t length [1, 2, 3, 4, 5]
-- length [1, 2, 3, 4, 5] :: Int

-- Bool
-- >>> :t (length [1, 2, 3, 4]) > (length "TACOCAT")
-- (length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool


{-
x = 5
y = x + 5
w = y * 10

-- z :: Num a => a -> a
z y = y * 10

-- f :: Fractional a => a
f = 4 / y

x = "Julie"
y = " <3  "
z = "Haskell"

-- f :: String
f = x ++ y ++ z
-}

-- wahoo no va a andar
bigNum = (^) 5 $ 10
wahoo = bigNum + 10 --wahoo = bigNum $ 10 No anda porque estás aplicando 10 a 5^10

{-
-- Si anda x anda z. Andan todas. 
x = print
y = print "woohoo!"
z = x "hello world"

-- ni c ni d andan porque le estás aplicando un número a otro número

a = (+)
b = 5
c = a 10 --c = b 10
d = c 200 -- ahora sí d va a andar

-- ninguna anda porque c' no está definida
a' = 12 + b
b' = 10000 * c'

-- ya con esto andaría
c' = 3

-}

{-
f :: zed -> Zed -> Blah
Fully Polymorphic -> Concrete -> Concrete

f :: Enum b => a -> b -> C
Fully Polymorphic, Constrained Polymorphic, Concrete

f :: f -> g -> C
FP, FP, C

-}

functionH :: [a] -> a
functionH (x:_) = x

functionC :: (Ord a) => a -> a -> Bool
functionC x y =
    if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y


----

i :: a -> a
i a = a

c :: a -> b -> a
c x _ = x

c'' :: b -> a -> b
c'' y _ = y -- equivalent to c

c' :: a -> b -> b
c' _ y = y

r :: [a] -> [a]
r xs = reverse xs

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)

a :: (a -> c) -> a -> a
a aToC a = a

a' :: (a -> b) -> a -> b
a' aToB a = aToB a





