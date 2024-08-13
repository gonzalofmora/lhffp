-- print3flipped.hs
module Print3Flipped where

myGreeting :: String
myGreeting = (++) "hello" "world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO ()
main = do
    putStrLn myGreeting
    putStrLn secondGreeting
    where secondGreeting =  -- secondGreeting es una local definition. No sirve afuera de la función main. No se puede usar en otro módulo. 
           (++) hello ((++) " " world)
           -- (++) hello (++) " " world -- Sin los paréntesis, se le estaría queriendo aplicar (++) al primer (++) como segundo parámetro
