let otro ori des = 
  6 - ori - des

let mueve (ori, des) =
  match (ori, des) with
  | (1, 2) -> "1-->2\n 3\n"
  | (1, 3) -> "1---2-->3\n"
  | (2, 1) -> "1<--2\n 3\n"
  | (2, 3) -> "1 2-->3\n"
  | (3, 1) -> "1<--2---3\n"
  | (3, 2) -> "1 2<--3\n"
  | _ -> ""

let rec hanoi n ori des =
  if n = 0 then ""
  else
    let otro = otro ori des in
    hanoi (n-1) ori otro ^ mueve (ori, des) ^ hanoi (n-1) otro des

let hanoi n ori des =
  if n = 0 || ori = des then ""
  else hanoi n ori des

let print_hanoi n ori des =
  if n < 0 || ori < 1 || ori > 3 || des < 1 || des > 3
  then print_endline "**ERROR**"
  else print_endline ("=========\n" ^
                      hanoi n ori des ^
                      "=========")

let rec n_hanoi_mov n nd ori des =
  let mit = 1 lsl (nd - 1) in
  if n = mit then (ori, des)
  else
    let o = otro ori des in
    if n < mit then n_hanoi_mov n (nd - 1) ori o
    else n_hanoi_mov (n - mit) (nd - 1) o des

let crono f x =
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t

(*
Experimento de tiempos con hanoi:
- hanoi 20: 0.045 s
- hanoi 21: 0.092 s
- hanoi 22: 0.185 s
- hanoi 23: 0.371 s
- hanoi 24: 0.748 s
- hanoi 25: 1.502 s

Los resultados avalan lo esperado teóricamente: el tiempo se duplica al incrementar 
en 1 el número de discos, confirmando una complejidad O(2^n).

Experimento de tiempos con n_hanoi_mov:
- n_hanoi_mov 1 20 1 2: 0.000002 s
- n_hanoi_mov 1 40 1 2: 0.000003 s
- n_hanoi_mov 1 62 1 2: 0.000004 s

El tiempo es prácticamente 0 s en todos los casos, lo que confirma su complejidad O(nd).
*)

