(* 1. Función que transforma un texto según las reglas de la Palabra de Fibonacci.
   Reglas: "0" -> "1" y "1" -> "01" *)
let fibw w =
  (* Sub-función recursiva interna para recorrer el texto letra por letra.
     'i' es el índice actual y 'len' es la longitud total del texto. *)
  let rec transform i len =
    (* Si el índice llega al final de la palabra, devolvemos texto vacío (caso base) *)
    if i = len then ""
    else
      (* Extraemos el carácter actual en la posición 'i' y lo convertimos a string *)
      let char_str = String.make 1 w.[i] in
      
      (* Aplicamos las reglas de reemplazo de Fibonacci *)
      let replacement =
        if char_str = "0" then "1"
        else if char_str = "1" then "01"
        else char_str (* Si hubiera otro carácter (no debería), lo deja igual *)
      in
      
      (* Unimos el reemplazo con el resultado de procesar el resto de la palabra *)
      replacement ^ transform (i + 1) len
  in 
  (* Iniciamos la transformación desde el índice 0 hasta la longitud total de 'w' *)
  transform 0 (String.length w)

(* 2. Función recursiva que construye el texto final con las palabras separadas por comas *)
let rec build_output w limit =
  (* Si la longitud de la palabra actual ya alcanza el límite, paramos devolviendo texto vacío *)
  if String.length w >= limit then ""
  else
    (* Generamos la SIGUIENTE palabra de la secuencia usando la función fibw *)
    let next_w = fibw w in
    
    (* Si la siguiente palabra ya alcanza el límite, esta ('w') es la última. 
       La devolvemos sin añadir coma al final. *)
    if String.length next_w >= limit then w
    
    (* Si no, ponemos la palabra actual, añadimos coma y espacio, y seguimos con la siguiente *)
    else w ^ ", " ^ build_output next_w limit

(* 3. Punto de entrada principal del programa *)
let _ =
  (* Comprueba que haya exactamente 2 argumentos: el programa y el límite de longitud *)
  if Array.length Sys.argv <> 2 then
    print_endline "fibwto: Invalid number of arguments"
  else
    (* Convierte el argumento del límite de texto a número entero *)
    let limit = int_of_string Sys.argv.(1) in
    
    (* Inicia la construcción del texto empezando siempre con la palabra inicial "0".
       Luego imprime el resultado completo en la consola. *)
    print_endline (build_output "0" limit)
