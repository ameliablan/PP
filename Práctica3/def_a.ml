(* Reasignación de valores manteniendo los mismos tipos que en def.ml *)

(* 1. 'v' es de tipo entero (int). 
   Primero multiplica dos floats (2.3 * 2.0 = 4.6), y luego convierte 
   ese resultado a entero truncando los decimales (queda 4). *)
let v = int_of_float (2.3 *. 2.0);;

(* 2. 'q' es de tipo decimal (float). 
   Calcula 2 multiplicado por el seno de 1.0 radián. *)
let q = 2.0 *. sin 1.0;;

(* 3. 'pi' es de tipo decimal (float). 
   El arcoseno (asin) de 1.0 es exactamente π/2. 
   Al multiplicarlo por 2.0, obtenemos el valor de Pi. *)
let pi = 2.0 *. asin 1.0;;

(* 4. 'e' es de tipo decimal (float). 
   Calcula el número de Euler haciendo e elevado a 1 (exp 1.0). *)
let e = exp 1.0;;

(* 5. 'magic' es de tipo carácter (char). 
   Se define usando comillas simples. *)
let magic = 'z';;

(* 6. 'st' es de tipo cadena de texto (string). 
   Se define usando comillas dobles. *)
let st = "hola mundo";;

(* 7. 'b' es de tipo booleano (bool). 
   Evalúa la expresión lógica "10 > 5", cuyo resultado es 'true' (verdadero). *)
let b = 10 > 5;;

(* 8. 'p' es una tupla de tipo (int * string). 
   Agrupa dos valores de distinto tipo en una sola estructura. *)
let p = (2, "ocaml");;

(* 9. 'f' es una función matemática simple (float -> float). 
   Recibe un número decimal 'x' y lo multiplica por 2.0. *)
let f x = x *. 2.0;;

(* 10. 'g' es una función de comprobación (int -> bool). 
   Recibe un entero 'x' y devuelve 'true' si es par (el resto de dividir entre 2 es 0). *)
let g x = x mod 2 = 0;;

(* 11. 'h' es una función que procesa una tupla ((string * string) -> string). 
   Recibe una tupla con dos textos (x, y) y los une (concatena) usando el operador '^'. *)
let h (x, y) = x ^ y;;

(* 12. 'i' es una función que procesa una tupla ((int * int) -> int). 
   Recibe una tupla con dos números enteros (x, y) y los suma. *)
let i (x, y) = x + y;;

(* 13. 'j' es una función de comprobación (float -> bool). 
   Recibe un número con decimales 'x' y devuelve 'true' si es mayor que cero. *)
let j x = x > 0.0;;
