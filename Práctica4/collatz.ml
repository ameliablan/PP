(* 1. La función base de Collatz.
   Define la regla principal de la conjetura para un número 'n'. *)
let f n = 
  (* Si el número es par (n mod 2 = 0), se divide entre 2.
     Si es impar, se multiplica por 3 y se le suma 1. *)
  if n mod 2 = 0 then n / 2 else 3 * n + 1;;

(* 2. Función recursiva para verificar si un número llega al 1. *)
let rec verify n =
  (* Devuelve 'true' si el número ya es 1. 
     Si no lo es, aplica la función 'f' y vuelve a comprobar (recursión).
     Nota: Si la conjetura de Collatz fuera falsa para algún número, 
     esta función se quedaría en un bucle infinito. *)
  n = 1 || verify (f n);;

(* 3. Función que verifica que TODOS los números del 1 al 'n' cumplen la conjetura. *)
let verify_to n =
  (* Función auxiliar interna que recorre los números desde 'i' hasta 'n' *)
  let rec aux i =
    (* Si 'i' supera a 'n', ya hemos comprobado todos y devolvemos 'true' *)
    if i > n then true
    (* Si no, verifica el número actual 'i' Y (&&) continúa con el siguiente ('i + 1') *)
    else verify i && aux (i + 1)
  in 
  (* Arranca la comprobación desde el número 1 *)
  aux 1;;

(* 4. Función recursiva que genera el texto con la "órbita" (la secuencia completa de números). *)
let rec orbit n =
  (* Si llegamos al 1, es el final de la secuencia, devolvemos "1" *)
  if n = 1 then "1"
  (* Si no, convertimos el número actual a texto, ponemos coma, y calculamos el siguiente *)
  else string_of_int n ^ ", " ^ orbit (f n);;

(* 5. Función que calcula la longitud de la secuencia (cuántos pasos tarda en llegar a 1). *)
let rec length n =
  (* Si es 1, es un solo paso (el final) *)
  if n = 1 then 1
  (* Si no, cuenta como 1 paso + la longitud de lo que quede de secuencia *)
  else 1 + length (f n);;

(* 6. Función que encuentra el número más alto alcanzado durante la secuencia. *)
let rec top n =
  (* Si llegamos al 1, el valor a comparar es 1 *)
  if n = 1 then 1
  (* Si no, compara el número actual 'n' con el pico máximo del resto de la secuencia, 
     y se queda con el mayor de los dos (max). *)
  else max n (top (f n));;
