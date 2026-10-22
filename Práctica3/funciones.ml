(* 1. Suma de Gauss: calcula la suma de todos los enteros desde 1 hasta 'n' (1 + 2 + ... + n).
   Tipo: int -> int *)
let rec sum_to n =
  (* Caso base: si 'n' es 0 o negativo, la suma no añade nada (devuelve 0) *)
  if n <= 0 then 0
  (* Caso recursivo: suma el número actual 'n' al resultado de la suma de (n - 1) *)
  else n + sum_to (n - 1);;

(* 2. Calcula la potencia de base 2 elevada a 'n' (2^n) de forma recursiva.
   Tipo: int -> int *)
let rec exp_2 n =
  (* Caso base: 2^0 = 1 (y para cualquier exponente <= 0) *)
  if n <= 0 then 1
  (* Caso recursivo: multiplica 2 por la potencia del exponente anterior (2 * 2^(n-1)) *)
  else 2 * exp_2 (n - 1);;

(* 3. Cuenta la cantidad total de dígitos que tiene un número entero 'n'.
   Tipo: int -> int *)
let rec num_digits n =
  (* Convierte el número a valor absoluto ('abs') para manejar correctamente números negativos *)
  let abs_n = abs n in
  
  (* Caso base: si el número es menor que 10, consta de un único dígito *)
  if abs_n < 10 then 1
  
  (* Caso recursivo: cuenta 1 dígito y elimina la última cifra dividiendo entre 10 
     (ejemplo: 123 / 10 = 12) para evaluar el resto *)
  else 1 + num_digits (abs_n / 10);;

(* 4. Calcula la suma de todos los dígitos individuales de un número entero 'n'.
   Ejemplo: sum_digits 1234 -> 1 + 2 + 3 + 4 = 10.
   Tipo: int -> int *)
let rec sum_digits n =
  (* Convierte a valor absoluto para ignorar el signo negativo *)
  let abs_n = abs n in
  
  (* Caso base: si queda un solo dígito (< 10), su suma es el propio número *)
  if abs_n < 10 then abs_n
  
  (* Caso recursivo: extrae la última cifra con el resto de la división (abs_n mod 10) 
     y se la suma al resultado del resto de los dígitos (abs_n / 10) *)
  else (abs_n mod 10) + sum_digits (abs_n / 10);;
