let rec build_output_fast limit a b =
  if a >= limit then ""
  else if b >= limit then string_of_int a
  else string_of_int a ^ ", " ^ build_output_fast limit b (a + b)

let _ =
  if Array.length Sys.argv <> 2 then
    print_endline "fastfibto: Invalid number of arguments"
  else
    let limit = int_of_string Sys.argv.(1) in
    print_endline (build_output_fast limit 0 1)