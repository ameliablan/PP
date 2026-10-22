let maximo = max_int;;
(* val maximo : int = 4611686018427387903 *)
(* Explicación: El entero más grande que permite OCaml en arquitecturas de 64 bits. *)

let minimo = min_int;;
(* val minimo : int = -4611686018427387904 *)
(* Explicación: El entero más pequeño en OCaml. *)

minimo + maximo;;
(* - : int = -1 *)
(* Explicación: Como el rango negativo incluye un valor más que el positivo por complemento a dos, la suma da -1. *)

minimo + maximo + 1;;
(* - : int = 0 *)
(* Explicación: -1 + 1 = 0. *)

maximo + 1;;
(* - : int = -4611686018427387904 *)
(* Explicación: Desbordamiento (overflow): al sobrepasar el límite máximo entero, el valor pasa al mínimo posible. *)

minimo = maximo + 1;;
(* - : bool = true *)
(* Explicación: Debido al desbordamiento, maximo + 1 es igual a min_int. *)

2 * minimo;;
(* - : int = 0 *)
(* Explicación: El desbordamiento de multiplicar el mínimo por 2 produce 0 en la representación binaria. *)

minimo - 1 = maximo;;
(* - : bool = true *)
(* Explicación: Underflow: restar 1 al entero mínimo vuelve al límite entero máximo. *)

2 * maximo;;
(* - : int = -2 *)
(* Explicación: Desbordamiento cíclico por aritmética de complementos en enteros. *)

let maximo = 1. /. 0.;;
(* val maximo : float = infinity *)
(* Explicación: En división flotante (/. ), la división por cero da el valor especial 'infinity'. *)

let minimo = -1.0 /. 0.;;
(* val minimo : float = neg_infinity *)
(* Explicación: Un número negativo flotante entre cero da infinito negativo. *)

1. /. maximo;;
(* - : float = 0. *)
(* Explicación: Cualquier número dividido por infinito tiende a 0.0. *)

1. /. minimo;;
(* - : float = -0. *)
(* Explicación: Representación flotante IEEE 754 de cero con signo negativo. *)

1. /. maximo = 1. /. minimo;;
(* - : bool = true *)
(* Explicación: En OCaml, la comparación lógica entre 0.0 y -0.0 devuelve true. *)

0. /. 0.;;
(* - : float = nan *)
(* Explicación: Indeterminación matemática 0/0 representada como NaN (Not a Number). *)

maximo +. maximo;;
(* - : float = infinity *)
(* Explicación: Infinito sumado a infinito sigue siendo infinito. *)

maximo -. maximo;;
(* - : float = nan *)
(* Explicación: La resta de infinitos es una indeterminación, por lo que resulta en NaN. *)

-. maximo = minimo;;
(* - : bool = true *)
(* Explicación: El opuesto de infinity es neg_infinity. *)

(* maximo + minimo;; *)
(* Error: This expression has type float but an expression was expected of type int *)
(* Explicación: Se usó el operador entero + con operandos flotantes; se requiere +. *)

not (minimo < maximo);;
(* - : bool = false *)
(* Explicación: neg_infinity < infinity es true, por lo que not(true) resulta en false. *)

let not = "no";;
(* val not : string = "no" *)
(* Explicación: OCaml permite enmascarar o redifinir identificadores por defecto en el ámbito global. *)

(* not (minimo < maximo);; *)
(* Error: This expression has type string but an expression was expected of type 'a -> bool *)
(* Explicación: 'not' fue redefinido como string y ya no se puede aplicar como una función lógica. *)

Stdlib.not (minimo < maximo);;
(* - : bool = false *)
(* Explicación: Acceso explícito a la función 'not' original del módulo estándar Stdlib. *)

let not = "si" in not ^ not;;
(* - : string = "sisi" *)
(* Explicación: Definición local (let ... in) de 'not' como cadena, concatenando "si" ^ "si". *)

not;;
(* - : string = "no" *)
(* Explicación: La variable 'not' global conserva el valor "no" previo al binding local. *)

(function x -> 2 * x);;
(* - : int -> int = <fun> *)
(* Explicación: Definición de una función anónima que duplica un entero. *)

(function x -> 2 * x) (2 + 1);;
(* - : int = 6 *)
(* Explicación: Aplica la función anónima al resultado de (2 + 1) = 3. *)

(function x -> 2 * x) 2 + 1;;
(* - : int = 5 *)
(* Explicación: Precedencia: evalúa (función 2) = 4 y luego suma 1. *)

(function y -> 2 * y) ((function y -> 2 * y) 3);;
(* - : int = 12 *)
(* Explicación: Aplicación anidada: primero evalúa la interna (2*3=6) y luego la externa (2*6=12). *)

let doble = function z -> 2 * z;;
(* val doble : int -> int = <fun> *)
(* Explicación: Se asigna un identificador a la función anónima. *)

doble 2 + 1;;
(* - : int = 5 *)
(* Explicación: Aplica 'doble 2' (4) y le suma 1. *)

doble (doble 3);;
(* - : int = 12 *)
(* Explicación: Aplica 'doble 3' (6) y pasa el resultado a 'doble' (12). *)

(* doble doble 3;; *)
(* Error: This expression has type int -> int but an expression was expected of type int *)
(* Explicación: La aplicación es asociativa por la izquierda: intentó evaluar (doble doble), pero 'doble' espera un int. *)

abs (1 - 2);;
(* - : int = 1 *)
(* Explicación: Calcula el valor absoluto de -1. *)

abs 1;;
(* - : int = 1 *)
(* Explicación: Valor absoluto de 1. *)

(* abs -1;; *)
(* Error: Syntax error *)
(* Explicación: Error sintáctico; los enteros negativos pasados como argumento requieren paréntesis: abs (-1). *)

let abs = function x -> if x >= 0. then x else -. x;;
(* val abs : float -> float = <fun> *)
(* Explicación: Redefinición de 'abs' para operar únicamente sobre valores de tipo float. *)

(* abs 1;; *)
(* Error: This expression has type int but an expression was expected of type float *)
(* Explicación: La nueva función 'abs' requiere un flotante, pero se le pasó un entero. *)

abs 1.5;;
(* - : float = 1.5 *)
(* Explicación: Funciona correctamente al recibir un argumento flotante. *)

Stdlib.abs 1;;
(* - : int = 1 *)
(* Explicación: Llama a la función 'abs' original para enteros del módulo Stdlib. *)

let suma = function (x,y) -> x + y;;
(* val suma : int * int -> int = <fun> *)
(* Explicación: Función que recibe una tupla/par ordenado (x, y). *)

2 * suma (2,3) - suma (1,1);;
(* - : int = 8 *)
(* Explicación: 2 * (2+3) - (1+1) = 2 * 5 - 2 = 8. *)

(* x;; *)
(* Error: Unbound value x *)
(* Explicación: El identificador 'x' no está definido en la memoria del entorno. *)

(* (function y -> x + y);; *)
(* Error: Unbound value x *)
(* Explicación: Intenta usar 'x' dentro de la función sin haber sido declarada antes. *)

let sumac = function x -> (function y -> x + y);;
(* val sumac : int -> int -> int = <fun> *)
(* Explicación: Función currificada en su forma expandida: toma 'x' y devuelve otra función que recibe 'y'. *)

sumac 3;;
(* - : int -> int = <fun> *)
(* Explicación: Aplicación parcial: fija x = 3 y devuelve una función que espera 'y'. *)

(sumac 3) 2;;
(* - : int = 5 *)
(* Explicación: Pasa el argumento 2 a la función devuelta por (sumac 3). *)

sumac 3 2;;
(* - : int = 5 *)
(* Explicación: Forma simplificada de evaluar una función currificada con dos argumentos. *)

suma (3, 2) = sumac 3 2;;
(* - : bool = true *)
(* Explicación: Compara el resultado de la función no currificada frente a la currificada (5 = 5). *)

(* suma 3;; *)
(* Error: This expression has type int but an expression was expected of type int * int *)
(* Explicación: 'suma' exige como argumento una tupla (int * int), no un único entero. *)

let suma5 = sumac 5;;
(* val suma5 : int -> int = <fun> *)
(* Explicación: Aplicación parcial de 'sumac' creando una nueva función que suma 5 a su argumento. *)

suma5 10;;
(* - : int = 15 *)
(* Explicación: Evalúa 5 + 10 = 15. *)

let sumac x = function y -> x + y;;
(* val sumac : int -> int -> int = <fun> *)
(* Explicación: Sintaxis equivalente para definir una función currificada. *)

sumac 3 2;;
(* - : int = 5 *)
(* Explicación: Retorna 5. *)

let sumac x y = x + y;;
(* val sumac : int -> int -> int = <fun> *)
(* Explicación: Forma canónica y directa de definir funciones con múltiples parámetros en OCaml. *)

sumac 3 2;;
(* - : int = 5 *)
(* Explicación: Retorna 5. *)

(+);;
(* - : int -> int -> int = <fun> *)
(* Explicación: Convierte el operador de suma infijo (+) en una función prefija currificada. *)

(+) 3 2;;
(* - : int = 5 *)
(* Explicación: Uso del operador de suma en notación prefija. *)

(<=);;
(* - : 'a -> 'a -> bool = <fun> *)
(* Explicación: Operador de comparación 'menor o igual' usado en notación prefija. *)

let adult = (<=) 18;;
(* val adult : int -> bool = <fun> *)
(* Explicación: Aplicación parcial que fija el primer operando como 18, evaluando '18 <= x'. *)

adult 18;;
(* - : bool = true *)
(* Explicación: Evalúa 18 <= 18 (true). *)

adult 12;;
(* - : bool = false *)
(* Explicación: Evalúa 18 <= 12 (false). Muestra la trampa del orden de operandos al currificar (<=). *)

adult 25;;
(* - : bool = true *)
(* Explicación: Evalúa 18 <= 25 (true). *)