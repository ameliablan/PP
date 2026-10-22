(* 1. Función clásica para calcular el MCD usando restas sucesivas.
   Es la forma original en la que Euclides planteó el algoritmo.
   Funciona, pero puede ser lenta si un número es muchísimo más grande que el otro. *)
let rec gcd (x, y) =
  (* Casos base: si uno de los números es 0, el MCD es el otro número *)
  if x = 0 then y
  else if y = 0 then x
  
  (* Si ambos números son iguales, ese número es el MCD *)
  else if x = y then x
  
  (* Si 'x' es mayor que 'y', le restamos 'y' a 'x' y volvemos a comprobar *)
  else if x > y then gcd (x - y, y)
  
  (* Si 'y' es mayor que 'x', le restamos 'x' a 'y' y volvemos a comprobar *)
  else gcd (x, y - x);;

(* 2. Función OPTIMIZADA para calcular el MCD usando el módulo (resto de la división).
   Es muchísimo más eficiente porque reduce los números de golpe 
   en lugar de ir restando paso a paso. *)
let rec gcd' (x, y) =
  (* Caso base: cuando el segundo número ('y') llega a 0, el primer número ('x') es el MCD *)
  if y = 0 then x
  
  (* Caso recursivo: en el siguiente paso, el antiguo 'y' pasa a ser el primer número,
     y el nuevo segundo número será el resto de dividir 'x' entre 'y' (x mod y).
     Esto se repite hasta que el resto sea 0. *)
  else gcd' (y, x mod y);;
