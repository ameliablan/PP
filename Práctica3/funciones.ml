(* sum_to : int -> int *)
let rec sum_to n =
  if n <= 0 then 0
  else n + sum_to (n - 1);;

(* exp_2 : int -> int *)
let rec exp_2 n =
  if n <= 0 then 1
  else 2 * exp_2 (n - 1);;

(* num_digits : int -> int *)
let rec num_digits n =
  let abs_n = abs n in
  if abs_n < 10 then 1
  else 1 + num_digits (abs_n / 10);;

(* sum_digits : int -> int *)
let rec sum_digits n =
  let abs_n = abs n in
  if abs_n < 10 then abs_n
  else (abs_n mod 10) + sum_digits (abs_n / 10);;