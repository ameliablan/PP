let rec fib n =
  if n <= 1 then n
  else fib (n - 1) + fib (n - 2)

let rec build_output limit i =
  let f_i = fib i in
  if f_i >= limit then ""
  else
    let next_f = fib (i + 1) in
    if next_f >= limit then string_of_int f_i
    else string_of_int f_i ^ ", " ^ build_output limit (i + 1)

let _ =
  if Array.length Sys.argv <> 2 then
    print_endline "fibto: Invalid number of arguments"
  else
    let limit = int_of_string Sys.argv.(1) in
    print_endline (build_output limit 0)