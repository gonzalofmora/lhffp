-- practice.hs
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

module Practice where


mult1 = x * y
  where x = 5
        y = 6

{-
rewrite with where:

1 let x = 3; y = 1000 in x * 3 + y
2 let y = 10; x = 10 * 5 + y in x * 5
3 let x = 7
      y = negate x
      z = y * 10
  in z / x + y
-}

mult2 = x * 3 + y
  where x = 3
        y = 1000

mult3 = x * 5
  where y = 10
        x = 10 * 5 + y

mult4 = z / x + y
  where x = 7
        y = negate x
        z = y * 10


waxOn = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2

triple x = x * 3

waxOff x = triple x

