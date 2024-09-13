{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use if" #-}
{-# HLINT ignore "Avoid lambda using `infix`" #-}
{-# HLINT ignore "Use min" #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Eta reduce" #-}

module Functions where

addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

--addFive x y = (if x > y then y else x) + 5
-- addFive = \x -> \y -> (if x > y then y else x) + 5
addFive = \x y -> (if x > y then y else x) + 5


-- mflip f = \x -> \y -> f y x
mflip f y x = f y x