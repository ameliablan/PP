let fibw w =
  let rec transform i len =
    if i = len then ""
    else
      let char_str = String.make 1 w.[i] in
      let replacement =
        if char_str = "0" then "1"
        else if char_str = "1" then "01"
        else char_str
      in
      replacement ^ transform (i + 1) len
  in transform 0 (String.length w)

let rec build_output w limit =
  if String.length w >= limit then ""
  else
    let next_w = fibw w in
    if String.length next_w >= limit then w
    else w ^ ", " ^ build_output next_w limit

let _ =
  if Array.length Sys.argv <> 2 then
    print_endline "fibwto: Invalid number of arguments"
  else
    let limit = int_of_string Sys.argv.(1) in
    print_endline (build_output "0" limit)
