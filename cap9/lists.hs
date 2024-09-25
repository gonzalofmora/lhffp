{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Move guards forward" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}
{-# HLINT ignore "Use infix" #-}
module Lists where

import Data.Bool

myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x : _) = Just x

-- Exercise: EnumFromTo

-- eftBool :: Bool -> Bool -> [Bool]
-- eftBool False False = [False]
-- eftBool False True  = [False, True]
-- eftBool True False  = []
-- eftBool True True   = [True, True] -- mal

eftBool :: Bool -> Bool -> [Bool]
eftBool True False = []
eftBool False True = [False, True]
eftBool x _ = [x]

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd LT LT = [LT]
eftOrd LT EQ = [LT, EQ]
eftOrd LT GT = [LT, EQ, GT]
eftOrd EQ EQ = [EQ]
eftOrd EQ GT = [EQ, GT]
eftOrd GT GT = [GT]
eftOrd _ _   = []

eftInt :: Int -> Int -> [Int]
eftInt x y
  | x > y     = []
  | otherwise = x : eftInt (x+1) y

eftChar :: Char -> Char -> [Char]
eftChar x y
  | x > y     = []
  | otherwise = x : eftChar (succ x) y

-- Thy Fearful Symmetry

-- 1)

myWords :: Char -> String -> [String]
myWords _ "" = []
myWords x xs = takeWhile (/= x) xs : myWords x (dropWhile (== x) . dropWhile (/= x) $ xs)

-- 2) module PoemLines


-- List Comprehension

mySqr :: [Int]
mySqr = [x ^ 2 | x <- [1..10]]

-- [1, 4, 9, 16, 25, 36, 49, 64, 81]

list1 = [x | x <- mySqr, rem x 2 == 0]

-- [4, 16, 36, 64]
-- >>> list1
-- [4,16,36,64,100]

list2 = [(x, y) | x <- mySqr,
                   y <- mySqr,
                   x < 50, y > 50]

-- [(1,64), (1,81), (4, 64), (4, 64), (9,81), (9, 64), (16,81), (16, 64), (25,81), (25, 64), (36,81), (36, 64), (49,81), (49, 64)]
-- >>> list2
-- [(1,64),(1,81),(1,100),(4,64),(4,81),(4,100),(9,64),(9,81),(9,100),(16,64),(16,81),(16,100),(25,64),(25,81),(25,100),(36,64),(36,81),(36,100),(49,64),(49,81),(49,100)]

list3 = take 5 [ (x, y) | x <- mySqr, 
                          y <- mySqr,
                          x < 50, y > 50]

-- [(1,64), (1,81), (4, 64), (4, 64), (9,81)]
-- >>> list3
-- [(1,64),(1,81),(1,100),(4,64),(4,81)]


-- Square Cube

mySqr' = [x ^ 2 | x <- [1..5]]
myCube = [y ^ 3 | y <- [1..5]]

-- 1)
myTuples = [(x, y) | x <- mySqr', y <- myCube]

-- 2)
myFewTuples = [(x, y) | x <- mySqr', y <- myCube, x < 50, y < 50]

-- 3)
countMyTuples :: [a] -> Int
countMyTuples [] = 0
countMyTuples (x : xs) = 1 + countMyTuples xs

-- error
-- >>> [x ^ y | x <- [1..5], y <- [2, undefined]]
-- Prelude.undefined

-- 1 -> Mal, era una lista
-- >>> take 1 $ [x ^ y | x <- [1..5], y <- [2, undefined]]


-- error
-- >>> sum [1, undefined, 3]

-- 3
-- length [1, 2, undefined]

-- error
-- length $ [1, 2, 3] ++ undefined

-- [2] -> Bien. La función filter even tiene lo suficiente que exige take 1 para funcionar. 
-- take 1 $ filter even [1, 2, 3, undefined]

-- Debiera tirar error pero quizá tira []? No. Va a tirar error. Tira error
-- take 1 $ filter even [1, 3, undefined]

-- [1]
-- take 1 $ filter odd [1, 3, undefined]

-- [1, 3]
-- take 2 $ filter odd [1, 3, undefined]

-- error
-- take 3 $ filter odd [1, 3, undefined]

-- WHNF or NF?

-- 1) Both
-- 2) Neither
-- 3) WHNF
-- 4) WHNF
-- 5) WHNF
-- 6) WHNF
-- 7) Neither

-- Value or ⊥?

-- 1) ⊥
-- 2) [2]
-- 3) ⊥
-- 4) Devuelve una lista Bool si cada char de la string es una vocal o no

itIsMistery :: String -> [Bool]
itIsMistery xs =
  map (\x -> elem x "aeiou") xs

-- 5)

-- a) map (^2) [1..10]
-- [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

-- b) map minimum [[1..10], [10..20], [20..30]]
-- [1, 10, 20]

-- c) map sum [[1..5], [1..5], [1..5]]
-- [15, 15, 15]

-- bool :: a -> a -> Bool -> a
-- bool si le ponés un False te devuelve el primer valor, y si le ponés un True te devuelve el segundo.

newFunc :: [Int] -> [Int]
newFunc xs =
  map (\x -> bool (-x) x (x == 3)) xs


-- Filtering

-- 1)

multiplesOf3 :: [Int] -> [Int]
multiplesOf3 xs = [x | x <- xs, rem x 3 == 0]

multiplesOf3' :: [Int] -> [Int]
multiplesOf3' = filter (\x -> rem x 3 == 0)

qtyOfMultiples :: [Int] -> Int
qtyOfMultiples = length . multiplesOf3 -- Interesante que length multiplesOf3' no ande sin el punto

noArticles :: String -> [String]
noArticles xs = [x | x <- words xs, x /= "the" && x /= "a" && x /= "an"] 

noArticles' :: String -> [String]
noArticles' = filter (\x -> x /="the" && x /="a" && x /="an") . words

-- Zipping

myZip :: [a] -> [b] -> [(a, b)]
myZip _ []              = []
myZip [] _              = []
myZip (x : xs) (y : ys) = (x, y) : myZip xs ys

myZipWith :: (a -> b -> c)
          -> [a] -> [b] -> [c]
myZipWith _ [] _              = []
myZipWith _ _ []              = []
myZipWith f (x : xs) (y : ys) = f x y : myZipWith f xs ys

myZip2 :: [a] -> [b] -> [(a, b)]
--myZip2 _ []              = []
--myZip2 [] _              = []
--myZip2 (x : xs) (y : ys) = myZipWith (\x y -> (x, y)) xs ys
myZip2  = myZipWith (,) 