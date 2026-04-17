

let get_prem =
  function ClisteMot(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste = function
| ClisteMot(_,n) -> n |
            _ -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;


let get_signe = function Cdoc(_,s) -> s |
            _ -> failwith "Signe non recup";;
            
let get_liste_mot_doc = Cdoc(n,_) -> n | -> failwith "Liste non recup du doc";;
                        
let get_prem_doc = CEnsDoc(n,_) -> n | -> failwith "DOc non trouvé";;

let get_reste_doc : CEnsDoc(_,n) -> n | -> failwith "Liste suite doc non trouvé";;



let cree_liste_vide = function () -> Cliste_vide ;;
let est_vide = function liste ->
 liste = cree_liste_vide() ;;


let rec est_dans = function mot-> function liste->
  if est_vide liste then
    false
  else if 
    get_prem liste == mot then
      true 
else 
  est_dans mot(get_reste liste) ;;



(*
let rec list_mot uneListeDeEnsAppr liste_note =
  if est_vide uneListeDeEnsAppr then
    liste_note
  else
    let prem = get_prem uneListeDeEnsAppr in
    if est_dans prem liste_note then
      list_mot (get_reste uneListeDeEnsAppr) liste_note
    else
      Cliste(prem, liste_note);;


  *)

















































































































































let rec est_homogene = function liste ->
  if est_vide list then
    false
  else if 
    get_prem_doc get_signe liste = est_homogene (get_reste_doc get_signe liste) then 
      true 
else 
  false;; 

let cree_doc_vide = function ()-> Cdoc;;

let doc_est_vide = function doc ->
  doc = cree_doc_vide;;

