(* 1. La función base de Collatz que ya vimos.
   Si es par, divide entre 2. Si es impar, multiplica por 3 y suma 1. *)
let f n = 
  if n mod 2 = 0 then n / 2 else 3 * n + 1;;

(* 2. Función que calcula la longitud de la secuencia Y el valor máximo a la vez.
   En lugar de recorrer la secuencia dos veces (una para length y otra para top), 
   lo hace todo de una vez devolviendo una tupla (longitud, máximo). *)
let rec length_and_top n =
  (* Caso base: si llegamos al 1, la longitud es 1 y el valor máximo alcanzado es 1 *)
  if n = 1 then (1, 1)
  else
    (* Caso recursivo: calculamos el resto de la secuencia.
       Guardamos el resultado en las variables 'l' (longitud del resto) 
       y 't' (valor máximo del resto). *)
    let (l, t) = length_and_top (f n) in
    
    (* Devolvemos la tupla actualizada: 
       - Sumamos 1 a la longitud (l + 1).
       - Comparamos el número actual 'n' con el máximo del resto 't' para ver cuál es mayor (max n t). *)
    (l + 1, max n t);;

(* 3. Función optimizada para calcular la longitud (versión "comprimida" o "acelerada").
   Aprovecha un atajo matemático: si 'n' es impar, sabemos seguro que '3*n + 1' va a ser par.
   Por tanto, podemos hacer el paso impar y el siguiente paso par de golpe. *)
let rec lengths n =
  (* Caso base: si es 1, devuelve la tupla inicial (1, 1) *)
  if n = 1 then (1, 1)
  
  (* Si es par, hace el paso normal (divide entre 2) *)
  else if n mod 2 = 0 then
    let (o, c) = lengths (n / 2) in
    (* Suma 1 a ambos contadores de la tupla *)
    (o + 1, c + 1)
    
  (* Si es impar, aplica el "atajo": multiplica por 3, suma 1, 
     y lo DIVIDE entre 2 en la misma llamada recursiva. *)
  else
    let (o, c) = lengths ((3 * n + 1) / 2) in
    (* Suma 1 a ambos contadores de la tupla tras el salto doble *)
    (o + 1, c + 1);;
