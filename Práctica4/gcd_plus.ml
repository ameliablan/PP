let gcd_steps (x, y) =
  let rec aux (x, y) steps =
    if y = 0 then (x, steps)
    else aux (y, x mod y) (steps + 1)
  in
  aux (x, y) 0;;
  