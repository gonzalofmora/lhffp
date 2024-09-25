module PoemLines where

firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forsts of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
           \ symmetry"
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen

myLines :: Char -> String -> [String]
myLines _ "" = []
myLines x xs = takeWhile (/= x) xs : myLines x (dropWhile (== x) . dropWhile(/= x) $ xs)

shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forsts of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry"
    ]

main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines '\n' sentences
           == shouldEqual)

