(* Función recursiva que construye la secuencia de Fibonacci en texto *)
let rec build_output_fast limit a b =
  (* Caso base 1: Si el número actual (a) alcanza el límite, terminamos devolviendo un texto vacío *)
  if a >= limit then ""
  
  (* Caso base 2: Si el SIGUIENTE número (b) alcanza el límite, 'a' es el último número. 
     Lo convertimos a texto sin añadir una coma al final. *)
  else if b >= limit then string_of_int a
  
  (* Caso recursivo: Convertimos 'a' a texto, le pegamos una coma y un espacio, 
     y calculamos el siguiente paso donde el nuevo 'a' es 'b', y el nuevo 'b' es 'a + b' *)
  else string_of_int a ^ ", " ^ build_output_fast limit b (a + b)


(* Punto de entrada principal del programa (similar al main) *)
let _ =
  (* Comprueba que haya exactamente 2 argumentos: el nombre del programa y el número límite *)
  if Array.length Sys.argv <> 2 then
    (* Si no hay 2 argumentos, muestra este error *)
    print_endline "fastfibto: Invalid number of arguments"
  else
    (* Toma el argumento introducido por el usuario, lo convierte de texto a número entero (int) *)
    let limit = int_of_string Sys.argv.(1) in
    
    (* Llama a la función con el límite y los dos primeros números de Fibonacci (0 y 1). 
       Finalmente, imprime el resultado en la consola. *)
    print_endline (build_output_fast limit 0 1)
