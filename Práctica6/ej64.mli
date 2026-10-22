(* 1. CURRY Y UNCURRY *)

let curry f x y = f (x, y)

let uncurry f (x, y) = f x y

(*
Conversión entre formas currificadas y descurrificadas:

- uncurry (+);;
  - : int * int -> int = <fun>

- let sum = uncurry (+);;
  val sum : int * int -> int = <fun>

- sum 1;;
  Error: This expression has type int but an expression was expected of type
         'a * 'b
  (Explicación: sum espera una tupla de tipo int * int, pero recibió solo un valor entero).

- sum (2,1);;
  - : int = 3

- let g = curry (function p -> 2 * fst p + 3 * snd p);;
  val g : int -> int -> int = <fun>

- g (2,5);;
  Error: This expression has type 'a * 'b
         but an expression was expected of type int
  (Explicación: g está currificada, requiere argumentos separados 'g 2 5' en lugar de un par).

- let h = g 2;;
  val h : int -> int = <fun>

- h 1, h 2, h 3;;
  - : int * int * int = (7, 10, 13)
  (Explicación: g 2 y = 2*2 + 3*y = 4 + 3*y. Evaluando en 1, 2 y 3 da 7, 10 y 13).
*)


(* 2. COMPOSICIÓN DE FUNCIONES *)

let comp f g x = f (g x)

(*
Composición currificada comp f g x = (f o g)(x):

- let f = let square x = x * x in comp square ((+) 1);;
  val f : int -> int = <fun>

- f 1, f 2, f 3;;
  - : int * int * int = (4, 9, 16)
  (Explicación: f x = square(x + 1) = (x + 1)^2. Para 1, 2 y 3 da 4, 9 y 16).
*)


(* 3. POLIMORFISMO Y TEORÍA DE TIPOS *)

let i x = x

let j (x, y) = x

let k (x, y) = y

let l x = 0

(*
Conteo de funciones totales posibles según el tipo:

1. i : 'a -> 'a
   Respuesta: 1 única función.
   Por polimorfismo paramétrico, al no conocer la estructura del tipo 'a,
   la única forma válida de devolver un valor de tipo 'a es retornar el propio argumento x (identidad).

2. j : 'a * 'b -> 'a
   Respuesta: 1 única función.
   Recibe la tupla (x, y) y la única manera de producir una salida de tipo 'a
   es retornar la primera componente (fst).

3. k : 'a * 'b -> 'b
   Respuesta: 1 única función.
   Recibe la tupla (x, y) y la única manera de producir una salida de tipo 'b
   es retornar la segunda componente (snd).

4. l : 'a -> int
   Respuesta: Infinitas funciones.
   Dado que el tipo de retorno es 'int', se pueden definir infinitas funciones
   constantes devolviendo cualquier valor entero (ej. l x = 0, l x = 1, l x = -5, etc.).
*)
