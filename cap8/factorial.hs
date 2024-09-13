module Factorial where

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n -1)



applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = (f . applyTimes (n-1) f) b

-- applyTimes 5 (+1) 5
-- = ((+1) . applyTimes 4 (+1)) 5
-- == ((+1) . ((+1) . applyTimes 3 (+1)) 5)
-- == ((+1) . ((+1) . ((+1) . applyTimes 2 (+1))) 5)
-- == ((+1) . ((+1) . ((+1) . ((+1) . applyTimes 1 (+1)))) 5)
-- == ((+1) . ((+1) . ((+1) . ((+1) . ((+1) . applyTimes 0 (+1))))) 5)
-- == ((+1) . ((+1) . ((+1) . ((+1) . ((+1) . 5)))))
-- == ((+1) . ((+1) . ((+1) . ((+1) . 6))))
-- == ((+1) . ((+1) . ((+1) . 7)))
-- == ((+1) . ((+1) . 8))
-- == ((+1) . 9)
-- == 10


applyTimes' :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes' 0 f b = b
applyTimes' n f b = f . applyTimes (n-1) f $ b

-- applyTimes 5 (+1) 5
-- (+1) . applyTimes 4 (+1) $ 5
-- (+1) . (+1) . applyTimes 3 (+1) $ 5
-- (+1) . (+1) . (+1) . applyTimes 2 (+1) $ 5
-- (+1) . (+1) . (+1) . (+1) applyTimes 1 (+1) $ 5
-- (+1) . (+1) . (+1) . (+1) . (+1) . applyTimes 0 (+1) $ 5
-- (+1) . (+1) . (+1) . (+1) . (+1) . 5
-- (+1) . (+1) . (+1) . (+1) . 6
-- (+1) . (+1) . (+1) . 7
-- (+1) . (+1) . 8
-- (+1) . 9
-- 10

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

---------------------

type Numerator   = Integer
type Denominator = Integer
type Quotient    = Integer

dividedBy' :: Numerator
          -> Denominator
          -> Quotient
dividedBy' = div

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n   d count
         | n < d = (count, n)
         | otherwise =
            go (n - d) d (count + 1)



-- Chapter Exercises

-- 1) d
-- 2) b
-- 3) d
-- 4) b




-- appedCatty "woohoo!"?
-- = cattyConny "woops" "woohoo!"
-- = "woops mrow wooho!"

-- >>> appedCatty "woohoo!"
-- "woops mrow woohoo!"


-- frappe "1"
-- = flippy "haha" "1"
-- = flip cattyConny "haha" "1"
-- = cattyConny "1" "haha"
-- = "1 mrow haha"

-- >>> frappe "1"
-- "1 mrow haha"

-- frappe (appedCatty "2")
-- = frappe (cattyConny "woops" "2")
-- = frappe "woops mrow 2"
-- = flippy "haha" "woops mrow 2"
-- = flip cattyConny "woops mrow 2" "haha" -- mal
-- = cattyConny "haha" "woops mrow 2" -- mal
-- = "haha mrow woops mrow 2" -- mal

-- >>> frappe (appedCatty "2")
-- "woops mrow 2 mrow haha"

-- ..
-- flip cattyConny "haha" "woops mrow 2"
-- cattyConny "woops mrow 2" "haha"
-- "woops mrow 2 mrow haha"

-- appedCatty (frappe "blue")
-- = appedCatty (flippy "haha" "blue")
-- = appedCatty (flip cattyConny "haha" "blue")
-- = appedCatty (cattyConny "blue" "haha")
-- = appedCatty "blue mrow haha"
-- = cattyConny "woops" "blue mrow haha"
-- = "woops mrow blue mrow haha"

-- >>> appedCatty (frappe "blue")
-- "woops mrow blue mrow haha"

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- cattyConny (frappe "pink")
--            (cattyConny "green" (appedCatty "blue"))
-- cattyConny (frappe "pink")
--            (cattyConny "green" (cattyConny "woops" "blue"))
-- cattyConny (frappe "pink")
--            (cattyConny "green" "woops mrow blue")
-- cattyConny (frappe "pink")
--            "green mrow woops mrow blue"
-- cattyConny (flippy "haha" "pink")
--            "green mrow woops mrow blue"
-- cattyConny (flip cattyConny "haha" "pink")
--            "green mrow woops mrow blue"
-- cattyConny (cattyConny "pink" "haha")
--            "green mrow woops mrow blue"
-- cattyConny "pink mrow haha"
--            "green mrow woops mrow blue"
-- "pink mrow haha mrow green mrow woops mrow blue"

-- >>> cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))
-- "pink mrow haha mrow green mrow woops mrow blue"

-- cattyConny (flippy "Pugs" "are") "awesome"
-- cattyConny (flip cattyConny "Pugs" "are") "awesome"
-- cattyConny (cattyConny "are" "Pugs") "awesome"
-- cattyConny "are mrow Pugs" "awesome"
-- "are mrow Pugs mrow awesome"

-- >>> cattyConny (flippy "Pugs" "are") "awesome"
-- "are mrow Pugs mrow awesome"

-- Recursion

-- dividedBy :: Integral a => a -> a -> (a, a)
-- dividedBy num denom = go num denom 0
--   where go n   d count
--          | n < d = (count, n)
--          | otherwise =
--             go (n - d) d (count + 1)

-- 1) dividedBy 15 2
-- = go 15 2 0
-- = go 13 2 1
-- = go 11 2 2
-- = go 9  2 3
-- = go 7  2 4
-- = go 5  2 5
-- = go 3  2 6
-- = go 1  2 7
-- = (7, 1)

-- 2)

recursiveSum :: (Eq a, Num a) => a -> a
recursiveSum 0 = 0
recursiveSum n = n + recursiveSum (n-1)


recursiveSummation :: (Integral a) => a -> a -> a
recursiveSummation 0 n = 0
recursiveSummation n 0 = 0
recursiveSummation n m = n + recursiveSummation n (m-1)

-- Fixing dividedBy

data DividedResult =
    Result Integer
  | DividedByZero
  deriving Show

-- dividedBy :: Integral a => a -> a -> (a, a)
-- dividedBy num denom = go num denom 0
--   where go n   d count
--          | n < d = (count, n)
--          | otherwise =
--             go (n - d) d (count + 1)
            --       +
-- dividedBy 10 (-2)
-- = go 11 (-2) 0
-- = go  9 (-2) 1
-- = go  7 (-2) 2
-- = go  5 (-2) 3
-- = go  3 (-2) 4
-- = go  1 (-2) 5
-- = go 

dividedBy'' :: Integer -> Integer -> DividedResult 
dividedBy'' _ 0 = DividedByZero
dividedBy'' num denom
  | num < 0 && denom < 0 = Result (go (-num) (-denom) 0)
  | num > 0 && denom < 0 = Result (go' num denom 0)
  | num < 0 && denom > 0 = Result (go'' num denom 0)
  | otherwise = Result (go num denom 0)
     where go' n d count
            | n < (-d) = count
            | otherwise =
               go' (n + d) d (count - 1)
           go n   d count
            | n < d = count
            | otherwise =
                go (n - d) d (count + 1)
           go'' n   d count
            | n > (-d) = count
            | otherwise =
                go'' (n + d) d (count - 1)


-- McCarthy 91 function

mc91 :: (Ord a, Num a) => a -> a
mc91 n
  | n > 100 = n - 10
  | otherwise = mc91 . mc91 $ n + 11


