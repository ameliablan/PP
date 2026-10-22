let rec sum_last_k k n curr_i =
  if curr_i > k then 0
  else fibk_val k (n - curr_i) + sum_last_k k n (curr_i + 1)

and fibk_val k n =
  if n < k - 1 then 0
  else if n = k - 1 then 1
  else sum_last_k k n 1

let fibk k n = fibk_val k n

let rec build_output k limit i =
  let val_i = fibk k i in
  if val_i >= limit then ""
  else
    let next_val = fibk k (i + 1) in
    if next_val >= limit then string_of_int val_i
    else string_of_int val_i ^ ", " ^ build_output k limit (i + 1)

let _ =
  if Array.length Sys.argv <> 3 then
    print_endline "fibkto: Invalid number of arguments"
  else
    let k = int_of_string Sys.argv.(1) in
    let limit = int_of_string Sys.argv.(2) in
    print_endline (build_output k limit 0)