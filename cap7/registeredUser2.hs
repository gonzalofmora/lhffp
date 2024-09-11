{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
module RegisteredUser where

newtype Username =
    Username String

newtype AccountNumber =
    AccountNumber Integer

data User =
    UnregisteredUser
  | RegisteredUser Username AccountNumber


printUser :: User -> IO ()
printUser UnregisteredUser = 
    putStrLn "UnregisteredUser"
printUser (RegisteredUser 
             (Username name)
             (AccountNumber acctNum)) =
  putStrLn $ name ++ " " ++ show acctNum


-- Esto es un sum type
data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

-- Esto es un product type

data Penguin =
    Peng WherePenguinsLive
    deriving (Eq, Show)

-- is it South Africa? If so, return True
isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica     = True
-- isSouthAfrica Galapagos    = False
-- isSouthAfrica Antarctica   = False
-- isSouthAfrica Australia    = False
-- isSouthAfrica SouthAmerica = False
isSouthAfrica _               = False -- Esto vale por todo lo comentado de arriba

-- Pattern Matchin es clave para sacar lo de adentro

gimmeWhereTheyLive :: Penguin
                   -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) =
    whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng Antarctica
macaroni = Peng Antarctica
little = Peng Australia
galapagos = Peng Galapagos
