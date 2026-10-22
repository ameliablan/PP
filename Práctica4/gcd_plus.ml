(* Función principal que recibe una tupla con los dos números (x, y). 
   Devolverá otra tupla con el resultado final: (MCD, número de pasos). *)
let gcd_steps (x, y) =
  
  (* 1. Función auxiliar recursiva interna.
     Recibe los números actuales (x, y) y un contador de pasos ('steps'). *)
  let rec aux (x, y) steps =
    
    (* Caso base: si 'y' llega a 0, hemos terminado. 
       Devolvemos una tupla con 'x' (que es el MCD) y el total de pasos acumulados. *)
    if y = 0 then (x, steps)
    
    (* Caso recursivo: hacemos el cálculo de Euclides optimizado.
       El antiguo 'y' pasa a ser el primer número, el resto (x mod y) pasa a ser el segundo.
       Además, sumamos 1 al contador de pasos (steps + 1). *)
    else aux (y, x mod y) (steps + 1)
  in
  
  (* 2. Llamada inicial a la función auxiliar.
     Le pasamos los números originales (x, y) y empezamos a contar desde 0 pasos. *)
  aux (x, y) 0;;
