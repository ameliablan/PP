type nat = Z | S of nat

let rec nat_of_int n =
  if n <= 0 then Z
  else S (nat_of_int (n - 1))

let rec int_of_nat = function
  | Z -> 0
  | S n -> 1 + int_of_nat n

let rec add a b =
  match a with
  | Z -> b
  | S a' -> S (add a' b)

let pred = function
  | Z -> Z
  | S n -> n

let rec sub a b =
  match (a, b) with
  | (Z, _) -> Z
  | (a, Z) -> a
  | (S a', S b') -> sub a' b'

let rec mult a b =
  match a with
  | Z -> Z
  | S a' -> add b (mult a' b)

let rec div a b =
  if a < b then Z
  else S (div (sub a b) b)

let rec rem a b =
  if a < b then a
  else rem (sub a b) b

let rec exp base exponente =
  match exponente with
  | Z -> S Z
  | S e' -> mult base (exp base e')