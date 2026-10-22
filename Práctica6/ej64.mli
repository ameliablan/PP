let curry f x y = f (x, y)

let uncurry f (x, y) = f x y

(*
uncurry (+);;
- : int * int -> int = <fun>

let sum = uncurry (+);;
val sum : int * int -> int = <fun>

sum 1;;
Error de tipo: se esperaba un par (int * int) pero se pasó un entero.

sum (2,1);;
- : int = 3

let g = curry (function p -> 2 * fst p + 3 * snd p);;
val g : int -> int -> int = <fun>

g (2,5);;
Error de tipo: la función g está currificada y espera argumentos separados, no un par.

let h = g 2;;
val h : int -> int = <fun>

h 1, h 2, h 3;;
- : int * int * int = (7, 10, 13)
*)

let comp f g x = f (g x)

(*
let f = let square x = x * x in comp square ((+) 1);;
val f : int -> int = <fun>

f 1, f 2, f 3;;
- : int * int * int = (4, 9, 16)
*)

let i x = x

let j (x, y) = x

let k (x, y) = y

let l x = 0

(*
Respuestas sobre polimorfismo:

- Para i ('a -> 'a): 1 única función (la función identidad).
- Para j ('a * 'b -> 'a): 1 única función (devuelve la primera componente del par).
- Para k ('a * 'b -> 'b): 1 única función (devuelve la segunda componente del par).
- Para l ('a -> int): Infinitas funciones (puede devolver cualquier entero constante).
*)