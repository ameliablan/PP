(* 1. Función recursiva clásica para calcular el n-ésimo número de Fibonacci.
   Es muy ineficiente porque recalcula los mismos valores una y otra vez. *)
let rec fib n =
  (* Casos base: si n es 0 o 1, devuelve el propio n (fib(0)=0, fib(1)=1) *)
  if n <= 1 then n
  (* Caso recursivo: la suma de los dos números anteriores en la secuencia *)
  else fib (n - 1) + fib (n - 2)

(* 2. Función recursiva que construye el texto final separado por comas *)
let rec build_output limit i =
  (* Calcula el número de Fibonacci para el índice actual 'i' usando la función ineficiente *)
  let f_i = fib i in
  
  (* Si el número actual ya alcanza o supera el límite, paramos y devolvemos texto vacío *)
  if f_i >= limit then ""
  else
    (* Calculamos el SIGUIENTE número de Fibonacci para el índice 'i + 1' *)
    let next_f = fib (i + 1) in
    
    (* Si el siguiente número supera el límite, 'f_i' es el último. Lo ponemos sin coma. *)
    if next_f >= limit then string_of_int f_i
    (* Si no, ponemos 'f_i', añadimos una coma y seguimos con el índice 'i + 1' *)
    else string_of_int f_i ^ ", " ^ build_output limit (i + 1)

(* 3. Punto de entrada principal del programa *)
let _ =
  (* Comprueba que haya exactamente 2 argumentos: el programa y el límite *)
  if Array.length Sys.argv <> 2 then
    print_endline "fibto: Invalid number of arguments"
  else
    (* Convierte el argumento del límite de texto a número entero *)
    let limit = int_of_string Sys.argv.(1) in
    
    (* Inicia la construcción del texto desde el índice 0 e imprime el resultado final *)
    print_endline (build_output limit 0)
