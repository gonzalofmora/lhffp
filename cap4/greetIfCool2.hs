{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use id" #-}
{-# HLINT ignore "Redundant lambda" #-}
module GreetIfCool2 where
import Distribution.Backpack.PreModuleShape (mixLinkPreModuleShape)

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool coolness
      then putStrLn "eyyyy. What's shakin'?"
    else
        putStrLn "pshhhh."
    where cool v =
            v == "downright frosty yo"


-------------------------------------------------------------------------------------------
-- Excercises
{-
1) lenght :: [a] -> Integer -- NOP. En realidad es Foldable t => t a -> Int

2a) 5
2b) 3
2c) 2
2d) 5

3) 6 / 3 anda
   6 / length [1, 2, 3] no. 

4) div 6 (length [1, 2, 3])

5) Bool. True

6) Bool False

7a) True
7b) No anda, las listas solo pueden ser de un type
7c) 5
7d) False
7e) No anda. Espera un type bool y recibe un número


-}

-- 8)
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = isPalindrome 
    where 
        isPalindrome = reverse x == x
        
myAbs :: Integer -> Integer
myAbs num = absoluteValue
  where 
    absoluteValue = if num < 0 then num * (-1) else num

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = mixed
-- f (a, b) (c, d)
  where 
    mixed = ((snd x, snd y), (fst x, fst y))
--  mixed = ((b, d), (a, c))

f' :: (a, b) -> (c, d) -> ((b, d), (a, c))
f' (a, b) (c, d) = mixed
  where 
    mixed = ((b, d), (a, c))


x = (+)
f'' xs = x 1 w
  where w = length xs

f''' = \x -> x


f'''' (a, b) = a

{-
Match the function names to their types

1) c
2) b
3) a
4) d

-}