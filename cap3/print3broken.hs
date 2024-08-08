module Print3Broken where
import GHC.Settings.Utils (getRawBooleanSetting)

printSecond :: IO ()
printSecond = do
    putStrLn greeting

main :: IO ()
main = do
    putStrLn greeting
    printSecond
    where greeting = "Yarrrrr"