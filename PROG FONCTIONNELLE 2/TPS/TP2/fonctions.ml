type liste = Cliste of string * liste | Cliste_vide;;

type listeDeliste = ClisteDeliste of liste * liste | ClisteDeliste_vide ;;




let get_prem =
  function Cliste(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste =  function Cliste(_, reste) -> reste |
                      _  -> failwith "get_reste : l'argument n'a pas la forme attendue" ;;





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




let rec list_mot uneListeDeEnsAppr liste_note =
  if est_vide uneListeDeEnsAppr then
    liste_note
  else
    let prem = get_prem uneListeDeEnsAppr in
    if est_dans prem liste_note then
      list_mot (get_reste uneListeDeEnsAppr) liste_note
    else
      Cliste(prem, liste_note);;


 