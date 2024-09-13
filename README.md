# Learn Haskell From First Principles - Excercises

Este es un repositorio donde voy a guardar los ejercicios que vaya haciendo del libro Learn Haskell From First Principles en mi camino apreniendo Haksell



#### Cosas que importan:

- Las funciones se definen con los Typeclasses. 
- La función (+) se define dentro de la class Num -> ¿Ahora cómo se supone que sabe lo que tiene que hacer? Imagino eso lo hace en cada instancia? p.204
- Los Data Constructors son funciones también. Sirven para construir Data Types y para construirlos tenés que completar los parámetros (types) que te pidan. 

#### Glosario

Parametrizar es agregarle un parámetro a una función

Higher-Order Functions son funciones que tienen funciones como argumentos

#### Cosas útiles

- Para escribir varias líneas de código en GHCi se usa:  :{ acá tu código  :}

- Podés agregar parámetros a una función del otro lado del igual usando \, lo que crea un lambda: mTh x y = \z -> x * y * z. Esto te va a pedir 3 argumentos para funcionar

- Usar :set -Wall sirve para que los programas tiren más errores que te permiten mejorar el código al compilar

- Existe una función común que se llama go que sirve para llevar la cuenta en recursiones