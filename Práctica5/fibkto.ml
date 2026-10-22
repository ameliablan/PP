(* 1. Función recursiva que suma los últimos 'k' valores de la secuencia.
   Se utiliza para calcular el nuevo número sumando los 'k' anteriores. *)
let rec sum_last_k k n curr_i =
  (* Si el contador de sumas 'curr_i' supera a 'k', terminamos la suma aportando 0 *)
  if curr_i > k then 0
  (* Si no, calculamos el valor de la posición (n - curr_i) y le sumamos el resto de llamadas *)
  else fibk_val k (n - curr_i) + sum_last_k k n (curr_i + 1)

(* 2. Función mutuamente recursiva (nota la palabra 'and' en lugar de 'let rec').
   Calcula el número exacto que va en la posición 'n' de esta secuencia de 'k' pasos. *)
and fibk_val k n =
  (* Regla inicial: todas las posiciones antes de la (k-1) se rellenan con 0 *)
  if n < k - 1 then 0
  (* La posición (k-1) es donde arranca la secuencia, y siempre vale 1 *)
  else if n = k - 1 then 1
  (* Para cualquier posición posterior, llama a sum_last_k para sumar los 'k' anteriores *)
  else sum_last_k k n 1

(* Función puente (wrapper) para simplificar la llamada a fibk_val *)
let fibk k n = fibk_val k n

(* 3. Función recursiva que construye el texto final separado por comas *)
let rec build_output k limit i =
  (* Calcula el valor real de la secuencia para el índice actual 'i' *)
  let val_i = fibk k i in
  
  (* Si este valor ya alcanza o supera el límite, cortamos y devolvemos texto vacío *)
  if val_i >= limit then ""
  else
    (* Calculamos cómo será el SIGUIENTE valor para saber si debemos poner coma o no *)
    let next_val = fibk k (i + 1) in
    
    (* Si el siguiente valor se pasa del límite, este es el último. Lo imprimimos sin coma. *)
    if next_val >= limit then string_of_int val_i
    (* Si el siguiente es válido, ponemos este valor, una coma, y seguimos avanzando el índice *)
    else string_of_int val_i ^ ", " ^ build_output k limit (i
