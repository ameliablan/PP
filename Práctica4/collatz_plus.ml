let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec length_and_top n =
  if n = 1 then (1, 1)
  else
    let (l, t) = length_and_top (f n) in
    (l + 1, max n t);;

let rec lengths n =
  if n = 1 then (1, 1)
  else if n mod 2 = 0 then
    let (o, c) = lengths (n / 2) in
    (o + 1, c + 1)
  else
    let (o, c) = lengths ((3 * n + 1) / 2) in
    (o + 1, c + 1);;