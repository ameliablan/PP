(* Practica 1 - Ejercicio 4 *)
(* Fichero: expr.ml *)

0;;
(* - : int = 0 *)
(* Explicación: Literal entero. *)

0.;;
(* - : float = 0. *)
(* Explicación: Literal flotante (lleva punto decimal). *)

(* un comentario es como un espacio en blanco *) "abc";;
(* - : string = "abc" *)
(* Explicación: Los comentarios son ignorados por el compilador; se evalúa la cadena. *)

2 + 5 * 3;;
(* - : int = 17 *)
(* Explicación: Precedencia de operadores: la multiplicación (5 * 3) se evalúa antes que la suma. *)

2 + (* 5 **) 3;;
(* - : int = 5 *)
(* Explicación: El 5 * está dentro del comentario, por lo que la expresión queda como 2 + 3. *)

2 + (* 5 *(*esto es un comentario anidado*)*) 3;;
(* - : int = 5 *)
(* Explicación: OCaml admite comentarios anidados. Todo el contenido interno se ignora, quedando 2 + 3. *)

(* 1.5 * 2;; *)
(* Error: This expression has type float but an expression was expected of type int *)
(* Explicación: El operador * es exclusivo para enteros, pero el primer operando (1.5) es float. *)

(* 1.5 *. 2;; *)
(* Error: This expression has type int but an expression was expected of type float *)
(* Explicación: El operador *. es para floats, pero el segundo operando (2) es un entero. *)

1.5 *. 2.;;
(* - : float = 3. *)
(* Explicación: Multiplicación correcta entre dos flotantes. *)

(* 2 - 0.5;; *)
(* Error: This expression has type float but an expression was expected of type int *)
(* Explicación: El operador - es para enteros y 0.5 es un float. *)

(* 2. - 0.5;; *)
(* Error: This expression has type float but an expression was expected of type int *)
(* Explicación: El operador - requiere enteros; 2. y 0.5 son floats. *)

2. -. 2.0;;
(* - : float = 0. *)
(* Explicación: Resta entre floats con el operador -. *)

(* 2.5 - 0.5;; *)
(* Error: This expression has type float but an expression was expected of type int *)
(* Explicación: Para restar floats se debe usar -. en lugar de -. *)

2.5 -. 0.5;;
(* - : float = 2. *)
(* Explicación: Resta válida entre floats. *)

5 / 2;;
(* - : int = 2 *)
(* Explicación: División entera (trunca los decimales). *)

5. /. 2.;;
(* - : float = 2.5 *)
(* Explicación: División flotante. *)

25 mod 3;;
(* - : int = 1 *)
(* Explicación: Operador módulo (resto de la división entera 25 / 3). *)

(* 2 ** 3;; *)
(* Error: This expression has type int but an expression was expected of type float *)
(* Explicación: El operador potencia ** exige operandos de tipo float. *)

(* 2. ** 3;; *)
(* Error: This expression has type int but an expression was expected of type float *)
(* Explicación: El exponente 3 es de tipo int y debe ser float. *)

2. ** 3.;;
(* - : float = 8. *)
(* Explicación: Potencia entre floats: 2.0 elevado a 3.0. *)

2. *. 3. ** 2.;;
(* - : float = 18. *)
(* Explicación: La potencia ** tiene mayor precedencia que la multiplicación *. (2. *. 9.). *)

(2. *. 3.) ** 2.;;
(* - : float = 36. *)
(* Explicación: Los paréntesis fuerzan la multiplicación antes de la potencia. (6. ** 2.). *) 
