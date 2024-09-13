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

ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2' n = case even n of
    True  -> n + 2
    False -> n

-- Acá no usamos True or False. Acá usamos lo que devuelve la función. Acá empieza la magia del case of. Podemos usar lo que devuelve la función. 
nums x = 
  case compare x 0 of
    LT -> -1
    EQ -> 0
    GT -> 1


-- Artul Dodgy

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2


-- 11
-- >>> dodgy 1 1
-- 11

-- 22
-- >>> dodgy 2 2
-- 22

-- 21
-- >>> dodgy 1 2
-- 21

-- 12
-- >>> dodgy 2 1
-- 12

-- 11
-- >>> oneIsOne 1
-- 11

-- 21
-- >>> oneIsOne 2
-- 21

-- 21
-- >>> oneIsTwo 1
-- 21

-- 22
-- >>> oneIsTwo 2
-- 22

-- 31
-- >>> oneIsOne 3
-- 31

-- 23
-- >>> oneIsTwo 3
-- 23

-- Guards + where

avgGrade :: (Fractional a, Ord a)
         => a -> Char
avgGrade x
  | y >= 0.9  = 'A'
  | y >= 0.8  = 'B'
  | y >= 0.7  = 'C'
  | y >= 0.59 = 'D'
  | y < 0.59  = 'F'
  where y = x / 100


-- Guard Duty

-- 1) Usar otherwise arriba de todo hace que todo sea F
-- 2) Usar una función más abarcativa y luego la más restrictiva anula la restrictiva
-- 3) b: True when xs is a palindrome
-- 4) pal can take arguments that comply with the reverse function. -> reverse :: [a] -> [a]. pal can only take lists as arguments
-- 5) pal :: Foldable t => t a -> Bool. Mal. Tiene que tener una instance de Eq poque vas a comparar su argumento con su reverso. El type es Eq a => [a] -> Bool

pal xs
  | xs == reverse xs = True
  | otherwise        = False

-- 6) c
-- 7) numbers can take Num a => a arguments. Nope, the arguments should also be Ord a => a restricted. 

numbers x
  | x < 0  = (-1) 
  | x == 0 = 0 
  | x > 0  = 1 

-- Acá el type de numbers no infiere nada sobre los outputs que son números. Los deja como Num a => a

-- 8) -Insacable: numbers :: (Ord a, Num a1, Num a2) => a1 -> a2


-- take 5 (enumFrom 3) 
-- = take 5 . enumFrom $ 3