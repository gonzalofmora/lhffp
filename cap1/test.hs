sayHello :: String -> IO ()
sayHello x =
    putStrLn ("Hello, " ++ x ++ "!")

multiplyByPiAndTwice x = 3.14 * (x * x)

multiplyByPiAndTwice' x = pi * (x * x)
