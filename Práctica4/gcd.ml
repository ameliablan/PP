let rec gcd (x, y) =
  if x = 0 then y
  else if y = 0 then x
  else if x = y then x
  else if x > y then gcd (x - y, y)
  else gcd (x, y - x);;

let rec gcd' (x, y) =
  if y = 0 then x
  else gcd' (y, x mod y);;
  