(* 1. Calcula la constante matemática Pi (π). 
   La arcotangente de 1 (atan 1.0) es π/4, así que multiplicarlo por 4 da Pi.
   Nota: En OCaml, las operaciones con decimales (floats) llevan un punto (ej: *.) *)
let pi = 4.0 *. atan 1.0;;

(* 2. Calcula la constante matemática 'e' (Número de Euler).
   Usa la función exponencial 'exp 1.0', que equivale a e^1. *)
let e = exp 1.0;;

(* 3. Convierte el número entero máximo que soporta el sistema (max_int) 
   a un número con decimales (float). *)
let max_int_f = float_of_int max_int;;

(* 4. Calcula el perímetro (longitud) de una circunferencia dado su radio 'r'.
   Fórmula: 2 * π * r. *)
let per = function r -> 2.0 *. pi *. r;;

(* 5. Calcula el área de un círculo dado su radio 'r'.
   Fórmula: π * r² (pi * r * r). *)
let area = function r -> pi *. r *. r;;

(* 6. Devuelve el carácter que va inmediatamente después del introducido en la tabla ASCII.
   Primero convierte la letra a su código numérico (int_of_char), 
   le suma 1, y lo vuelve a convertir a letra (char_of_int). *)
let next_char = function c -> char_of_int (int_of_char c + 1);;

(* 7. Calcula el valor absoluto de un número decimal (float).
   Si es negativo, lo hace positivo.
   Nota: En OCaml, el símbolo menos para cambiar el signo de un float es '-.' (menos y punto). *)
let abs_f = function x -> if x < 0.0 then -.x else x;;

(* 8. Comprueba si un número entero es impar.
   Si el resto de dividir entre 2 (n mod 2) es distinto (<>) de 0, es impar. *)
let odd = function n -> n mod 2 <> 0;;

(* 9. Encuentra el siguiente múltiplo de 3 estrictamente mayor que 'n'.
   Tiene que manejar casos positivos y negativos por cómo funciona la división entera en OCaml. *)
let next_3_mult = function n ->
  (* Si es 0 o positivo: la división entera trunca el decimal. 
     Se le suma 1 y se multiplica por 3 para forzar el salto al siguiente. *)
  if n >= 0 then ((n / 3) + 1) * 3
  
  (* Si es negativo y YA es múltiplo de 3, el siguiente es él mismo + 3 (ej: -6 pasa a -3) *)
  else if n mod 3 = 0 then n + 3
  
  (* Si es negativo pero no es múltiplo exacto, la propia división truncada hacia cero 
     ya nos deja en el múltiplo correcto por encima. (ej: -4 / 3 = -1; -1 * 3 = -3). *)
  else (n / 3) * 3;;

(* 10. Comprueba si un carácter 'c' es una letra del alfabeto inglés.
   Verifica si está en el rango de minúsculas (a-z) O (||) en el rango de mayúsculas (A-Z). *)
let is_letter = function c -> (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');;

(* 11. Traduce un valor booleano (true/false) a texto en español.
   Aquí se ve muy bien el poder de 'function', que permite evaluar los casos 
   directamente sin necesidad de escribir un 'if / else' tradicional. *)
let string_of_bool = function true -> "verdadero" | false -> "falso";;
