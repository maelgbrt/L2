
type tlChar = ClChar of char* tlChar |  ClChar_vide;;

let lc_prem = function ClChar(n,_) -> n | ClChar_vide -> failwith "Empty list";;
let lc_reste = function ClChar(_,n) -> n | ClChar_vide -> failwith "Empty list";;
let est_vide = function liste ->
  liste = ClChar_vide;;
let lc_creer = function c -> function list ->
  ClChar(c,list);;

let est_avant = function c1 -> function c2 ->
  c1 > c2 ;;


let rec lc_inserer = function c -> function list ->
  if est_vide list then
    lc_creer c list
  else
    let prem = lc_prem list in
    let reste = lc_reste list in
    if est_avant c prem then
      lc_creer c list
    else
      lc_creer prem (lc_inserer c reste);;

      
let rec lc_trier = function list  ->
if est_vide list then list
else
  let prem = lc_prem list and 
  reste = lc_reste list in
  (lc_inserer prem (lc_trier reste));;