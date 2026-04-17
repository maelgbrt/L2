type ls = Cls of int * ls | Clsvide ;;
let ls_prem = function Cls(p,_) -> p | _ -> failwith "Pb";;

let ls_rest = function Cls(_,r) ->  r | _ -> failwith "PB" ;;

let ls_creer = function p ->
  function r ->
      Cls(p,r);;


let ls_vide = function Clsvide -> true | _-> false;;

let rec concatener = function ls1 -> function ls2 -> 
  if ls_vide ls1 then
    ls2
  else
    if ls_vide ls2 then
      ls1
    else
      let parm = ls_prem ls1 in
      let reste = ls_rest ls1 in
      ls_creer parm (concatener reste ls2);;



type arbre = Carb of int * arbre * arbre | CarbVide ;;
let ab_creer = function racine -> function ab_gauche -> function ab_droite ->
  Carb(racine,ab_gauche,ab_droite);;


let ab_creer_vide = function () -> CarbVide;;

let arbreVide = function CarbVide -> true | _-> false ;;

let ab_racine = function Carb(r,_,_) -> r | _ -> failwith "PB";;
let ab_gauche = function Carb(_,g,_) -> g | _ -> failwith "PB";;
let ab_droit = function Carb(_,_,d) -> d | _ -> failwith "PB";;

let rec ab_ajouter = function v_val -> function arbre ->
    if arbreVide arbre then 
      ab_creer v_val (ab_creer_vide ()) (ab_creer_vide ())
  else
    let d = ab_droit arbre in
    let g = ab_gauche arbre in    
    let v = ab_racine arbre in
    if v_val < v then
      (ab_creer v (ab_ajouter v_val g) d)
    else
      (ab_creer v g (ab_ajouter v_val d));;

    
let rec ls_to_ab = function ls ->
  if ls_vide ls then
    ab_creer_vide
  else
    let prem = ls_prem ls and
    lest reste = ls_rest ls in
    ab_ajouter prem
    (ls_to_ab reste);;  

    