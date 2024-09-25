{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}
module Exercises where

import Data.Char

import Data.List
-- 1)

-- >>> :t isUpper
-- isUpper :: Char -> Bool

-- >>> :t toUpper
-- toUpper :: Char -> Char

upperOnly :: String -> String
upperOnly []       = []
upperOnly (x : xs)
  | isUpper x = x : upperOnly xs
  | otherwise = upperOnly xs

upperOnly' :: String -> String
upperOnly' = filter isUpper

-- >>> :t filter
-- filter :: (a -> Bool) -> [a] -> [a]

capitalize :: String -> String
capitalize []       = []
capitalize (x : xs) = toUpper x : xs

capitalizeAll :: String -> String
capitalizeAll []       = []
capitalizeAll (x : xs) = toUpper x : capitalizeAll xs

capitalizeAll' :: String -> String
capitalizeAll' = map toUpper

onlyStarter :: String -> Char
onlyStarter []     = ' '
onlyStarter (x:xs) = toUpper x

onlyStarter' :: String -> Char
onlyStarter' []       = ' '
onlyStarter' xs = head (capitalizeAll xs)

onlyStarter'' :: String -> Char
onlyStarter'' = head . capitalizeAll



-- My own standard functions

-- direct recursion with (||)
myOr :: [Bool] -> Bool
myOr []       = False
myOr (x : xs) = x || myOr xs

-- direct recurison withouth (||)
myOr' :: [Bool] -> Bool
myOr' []       = False
myOr' (x : xs)
  | x         = True
  | otherwise = myOr' xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x : xs)
  | f x       = True
  | otherwise = myAny f xs


myElem :: Eq a => a -> [a] -> Bool
myElem _ []   = False
myElem x (y : ys)
  | x == y    = True
  | otherwise = myElem x ys

myElem' :: Eq a => a -> [a] -> Bool
myElem' x = myAny (== x)

myReverse :: [a] -> [a]
myReverse []       = []
myReverse (x : xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish []       = []
squish (x : xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []       = []
squishMap f (x : xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain xs = squishMap squish [xs]


-- squishAgain [[1..10], [4..12]]
-- squishMap squish [[[1..10], [4..12]]]
-- squish [[1..10], [4..12]] ++ squishMap squish []
-- squish [[1..10], [4..12]] ++ []
-- [1..10] ++ squish [4..12]
-- [1..10] ++ [4..12] ++ squish []
-- [1..10] ++ [4..12] ++ []
-- [1..10, 4..12]

-- squishAgain [[1..10], [4..12]]
-- squishMap squish [[1..10], [4..12]]
-- squish [1..10] ++ squishMap squish [4..12]
-- squish [1..10] ++ squish [4..12] ++ squishMap squish []
-- squish [1..10] ++ squish [4..12] ++ []
-- 1 ++ squish [2..10] -> error


myMaximumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMaximumBy _ [] = error "empty list"
myMaximumBy f [x] = x
myMaximumBy f (x : y : xs)
  | f x y == LT = myMaximumBy f (y : xs)
  | otherwise = myMaximumBy f (x : xs)

myMinimumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMinimumBy _ [] = error "empty list"
myMinimumBy f [x] = x
myMinimumBy f (x : y : xs)
  | f x y == GT = myMinimumBy f (y : xs)
  | otherwise = myMinimumBy f (x : xs)

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare 

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare 


