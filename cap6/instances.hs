{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use print" #-}
{-# HLINT ignore "Use minimum" #-}
module Instances where

import Data.List (sort)

data TisAnInteger =
    TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn x) (TisAn x') = x == x'


data TwoIntegers = 
    Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = (x == x') && (y == y')

data StringOrInt =
    TisAnInt   Int
  | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt x')     = x == x'
    (==) (TisAString x) (TisAString x') = x == x'
    (==) _ _                            = False

data Pair a =
    Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair x' y') = (x == x') && (y == y')

data Tuple a b = 
    Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') = (x == x') && (y == y')

data Which a = 
    ThisOne a
  | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne x) (ThisOne x') = x == x'
    (==) (ThatOne x) (ThatOne x') = x == x'
    (==) _ _                      = False

data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello x') = x == x'
    (==) (Goodbye x) (Goodbye x') = x == x'
    (==) _ _                      = False


-- >>> :t quotRem
-- quotRem :: Integral a => a -> a -> (a, a)

-- >>> :t divMod
-- divMod :: Integral a => a -> a -> (a, a)

-- divMod lo que hace es darte una tupla en donde el segundo valor es el resto y estimo el primer valor es el resultado de la división
-- quotRem en principio hace lo mismo. Por lo que no estaría viendo la diferencia
-- Hay diferencia con los números negativos. Me suena a que anda mejor quotRem, pero no lo entiendo

-- >>> divMod (-4) 10
-- (-1,6)

-- >>> divMod (-12) 10
-- (-2,8)

-- >>> quotRem (-4) 10
-- (0,-4)

-- >>> quotRem (-12) 10
-- (-1,-2)

{-
data DayOfWeek =
    Mon | Tue | Weds | Thu | Fri | Sat | Sun
    deriving (Eq, Ord, Show)
-}
-- Con esta versión, los valores de la izquierda siempre son menores que los de la derecha:

-- >>> Mon > Tue
-- False

-- Con nuestras propias instancias, eso puede cambiar:

data DayOfWeek =
    Mon | Tue | Weds | Thu | Fri | Sat | Sun
    deriving (Eq, Show)

instance Ord DayOfWeek where
    compare Fri Fri = EQ
    compare Fri _   = GT
    compare _ Fri   = LT
    compare _ _     = EQ

-- Cuando creás tus propias instancias de Ord es ideal que sean iguales a las instancias de Eq. No es el caso de acá arriba

-- 5
-- >>> max (length [1, 2, 3]) (length [8, 9, 10, 11, 12]) 
-- 5

-- LT
-- >>> compare (3 * 4) (3 * 5)
-- LT

-- error
-- >>> compare "Julie" True
-- Couldn't match type `Bool' with `[Char]'
-- Expected: String
--   Actual: Bool
-- In the second argument of `compare', namely `True'
-- In the expression: compare "Julie" True
-- In an equation for `it_a2aSB': it_a2aSB = compare "Julie" True


-- False
-- >>> (5 + 3) > (3 + 6)
-- False

{-
IO Actions

print toma un argumento a que tiene que tener una instancia de la typeclass Show. Y devuelve un resultado "IO ()"

Este resultado "IO ()" es una IO action.


Las IO actions devuelven un valor del type ()

Las IO action son acciones que tienen side effects. Incluyen pero no se limitan a imprimir cosas por pantalla. 
Además de side effects contienen un valor que retornan. 
Los paréntesis solos "()" denotan una tupla vacía. Esta tupla vacía se llama "unit". La "unit" es un valor. También es un type. 
Es un type que solo tiene este valor. Representa el vacío. Es "nada".

-- >>> :t ()
-- () :: ()


-- >>> :i ()
-- type () :: *
-- data () = ()
--   	-- Defined in ‘GHC.Tuple’

Una IO action no deja de ser una expresión. Y como tal, tiene que devolver algo. No puede devolver nada. Para eso se usa esta "unit". Para devolver algo después de esta IO action. 
Así, la función print realiza la IO action (mostrar la string en pantalla) y luego termina la acción retornando el valor "unit", nada. 
Un IO action puede ser del type () pero también puede tener otros types, como IO String. IO implica side effects, efectos por fuera del programa concreto. Imprimr en pantalla es un side effect.

myVal :: String -- Esto es un valor de type String

ioString :: IO String -- Esto es un método. Una forma de obtener un valor de type String, pero antes produciendo side effects (I/O).


-}

-- Implementación mínimoa de una instance Show. Requiere que las funciones show o showsPrec sean implementadas:

data Mood = Blah

instance Show Mood where
    show _ = "Blah"

-- Usando deriving Show podemos darle la instance de show a cualquier datatype que creemos. 


-- Instances:

-- Typeclass: Define un set de funciones y/o valores (Eq, Num, Ord, Enum, Show, etc.)
--     Types: Tienen instancias de dicha typeclass   (String, Int, Fractional, etc.)
-- Instances: Especifican las formas en las que ese type usa las funciones de la typeclass (Int tiene una instancia de: Integral, Num, Real, Bounded, Enum, Show, Eq, Ord, Read)


-- Ejemplo de lo que no hay que hacer:

-- Acá estamos creando una nueva typeclass. Que se llama Numberish. Tiene 2 funciones. Pasar de Integer a Numberish y de Numberish a Integer
class Numberish a where
    fromNumber :: Integer -> a
    toNumber :: a -> Integer


-- Acá estamos definiendo un nuevo datatype. Este datatype se llama Age. Age tiene un Integer y tiene instancias de Eq y Show. 
newtype Age = 
    Age Integer
    deriving (Eq, Show)

-- Acá a nuestro datatype Age le estamos agregando la instancia de la typeclass Numberish. Para que Haskell sepa cómo actuar cuando se usen estas funciones con valores de type Age. 
-- Acá le enseñamos que usando la función fromNumber de la typeclass Numberish, tiene que pasar de un valor de type Numberish a uno del type Age.
-- Después le mostramos cómo pasar de un valor de type Age a uno Numberish. 
instance Numberish Age where
    fromNumber n = Age n
    toNumber (Age n) = n

-- Year es un nuevo data type. Es lo mismo que hicimos con Age.
newtype Year =
    Year Integer
    deriving (Eq, Show)

instance Numberish Year where
    fromNumber n = Year n
    toNumber (Year n) = n


-- Acá definimos una función. La función exige que se aplique a types que tengan instancias de la typeclass Numberish. 
-- Los types que tienen instance Numberish no necesariamente pueden ser sumados. Por eso acá los tenemos que transformar
-- Esta función transforma a número el valor a y el valor a'. Después los suma. Una vez que los suma, los vuelve a transformar en el type inicial que cuenta con una instance de la class Numberish
sumNumberish :: Numberish a => a -> a -> a
sumNumberish a a' = fromNumber summed
  where integerOfA      = toNumber a
        integerOfAPrime = toNumber a'
        summed =
            integerOfA + integerOfAPrime

-- Esto solo va a funcionar para los types Age y Year. Nada más. 
-- El problema según el libro es el siguiente:
-- La definición de Numberish no define ningún "terms or code" que se pueda compliar y ejecutar. Solo types. 
-- El código vive en las instancias para Age y Year. ¿Donde sabe Haskell dónde encontrar el código? 
-- Al tener que buscar el código en la instancia y no en la definición del typeclass hay problema. 
-- Se supone que la typeclass debería funcionar igual para todos. Pero que pasa si por ejemplo Age tiene una forma diferente de usar las funciones de Numberish que Year. 
-- La typeclass va a funcionar diferente. Entiendo que esto no debería pasar. 

-- Esto es peor todavía. Todavía no entiendo bien a donde quiere llegar igual.

class Numberish' a where
    fromNumber'    :: Integer -> a
    toNumber'      :: a -> Integer
    defaultNumber :: a

instance Numberish' Age where
    fromNumber' n = Age n
    toNumber' (Age n) = n
    defaultNumber = Age 65

instance Numberish' Year where
    fromNumber' n = Year n
    toNumber' (Year n) = n
    defaultNumber = Year 1988

-- Al definir un valor default como parte de la typeclass hacemos cagada porque cada instancia que se cree en un datatype de esa typeclass pide un defaultNumber. Y con más de una instancia ya 
-- alcanza para que haya lío y ambigüedad. No entiendo muy bien cómo afecta esto al ejemplo anterior. No lo hace. Solo que el ejemplo anterior no me cierra todavía. 
-- Los terms son lo que está del lado derecho del igual. Los types son los que están del lado derecho del ::

-- Chapter Exercises

{-

Multiple Choice

1) c
2) b
3) a
4) c
5) a

-}

-- Does it typecheck?

data Person = Person Bool
  deriving Show -- con esto anda

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- No va a andar porque Person no tiene instance de show

-- Lo que viene no va a andar porque está queriendo usar Types en la parte de los terms

data Mood' = Blah2
          | Woot2 deriving Show

-- settleDown x = if x == Woot2
--                   then Blah2
--                   else x

-- Esto se hace así en realidad. No son tanto que haya types en los terms sino que quiera igualar un valor con un type en los terms
settleDown Woot2 = Blah2
settleDown x     = x

-- a) Los únicos valores válidos serán Woot2 y Blah2
-- b) settleDown 9 no va a andar porque solo se puede usar un type Mood' y 9 no es de type mood. No anda porque Mood' no tiene instance de Num
-- c) Tampoco va a andar porque Mood' no tiene instance de Ord

-- En lo siguiente,  la primera oración no va a andar porque le falta un valor que es parte del ¿Constructor?

type Subject = String
type Verb    = String
type Object  = String

data Sentence = 
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- Mentira, andan las dos, solo que a la primera le falta una String para pasar a ser una Sentence. Es del type Object -> Sentence. Mientras que la 2 ya es del type Sentence. 
-- Para que s1 ande le tengo que agregar otra palabra al llamarla

-- >>> s1
-- No instance for (Show (Object -> Sentence))
--   arising from a use of `evalPrint'
--   (maybe you haven't applied a function to enough arguments?)
-- In a stmt of an interactive GHCi command: evalPrint it_a5s1T

-- >>> s1 "cats"
-- Sentence "dogs" "drool" "cats"

-- >>> s2
-- Sentence "Julie" "loves" "dogs"

data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah
    deriving (Eq, Show)

-- 1) No va a andar:
-- Papu "chases" True no va a funcionar porque "chases" no es de type Rocks y True no es de type Yeah

-- >>> phew = Papu "chases" True
-- Couldn't match expected type `Yeah' with actual type `Bool'
-- In the second argument of `Papu', namely `True'
-- In the expression: Papu "chases" True
-- In an equation for `phew': phew = Papu "chases" True
-- Couldn't match type `[Char]' with `Rocks'
-- Expected: Rocks
--   Actual: String
-- In the first argument of `Papu', namely `"chases"'
-- In the expression: Papu "chases" True
-- In an equation for `phew': phew = Papu "chases" True

-- 2) Esto sí va a andar porque cumple los requisitos del type Papu

truth = Papu (Rocks "chomskydoz") (Yeah True)
-- >>> truth
-- Papu (Rocks "chomskydoz") (Yeah True)

-- 3) Debería andar pues Papu sí tiene instance de Eq

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- >>> equalityForall truth (Papu (Rocks "hola") (Yeah False))
-- False

-- 4) Esto no va a andar porque Papu no tiene instance de Ord

-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'

-- Match the types

-- 1) No se puede porque a es completamente polymorphic y 1 necesita una instance de Num

-- i :: a
-- i = 1

-- >>> let i = 1
-- >>> :t i
-- i :: Num a => a

-- 2) ¿Puede f = 1.0 ser f :: Num a => a. Yo creo que no porque todos los que tengan . no pueden ser nums.

-- f :: Num a => a
-- f = 1.0

-- >>> let f = 1.0
-- >>> :t f
-- f :: Fractional a => a

-- 3) Acá sí se puede porque como se ve arriba, f es como mínimo Fractional a

f :: Fractional a => a
f = 1.0

-- 4) Puede 1.0 ser RealFrac a => a? Sí porque estamos especificando que algo sea una subclass de Fractional, que sea RealFrac

f' :: RealFrac a => a
f' = 1.0

-- 5) Puede cambiar ya que solo lo estás restringiendo a ser Ord

freud :: Ord a => a -> a
freud x = x

-- 6) Lo mismo pasa acá, estás restringiendo a ser  Int

freud' :: Int -> Int
freud' x = x

-- 7) Puede sigmund :: Int -> Int pasar a ser a -> a siendo que sigmund x = myX y myX = 1 :: Int ? La respuesta no los sorprenderá, no. Porque myX es un Int, no puede ser un a

{-
myX = 1 :: Int

sigmund :: a -> a
sigmund x = myX

-}

-- 8) Acá pasa lo mismo, tampoco puede pasar a ser Num a => a -> a porque myX sigue siendo Int

{-
myX = 1 :: Int

sigmund' :: Num a => a -> a
sigmund' x = myX
-}

-- 9) Sí funcionará porque Int tiene una instance de Ord que permite que se le aplique la función sort

jung :: [Int] -> Int
jung xs = head (sort xs)

-- 10) Acá también debería funcionar porque en la medida en que la variable tenga instance de Ord, la función sort va a funcionar

young :: Ord a => [a] -> a
young xs = head (sort xs)

-- 11) Acá no va a funcionar porque mySort solo puede funcionar con [Char] -> [Char], y le estamos pidiendo que funcione con cualquier Ord

{-
mySort :: [Char] -> [Char]
mySort = sort

signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)
-}