




(* On recupère le premier mot de la liste d'un document d'un document *)
val get_prem : liste_mot -> string

(* On recupère le reste des mots d'un document *)
val get_reste : liste_mot -> liste_mot

(* On recupère le signe d'un document *)
val get_signe : doc -> string

(* On recupère la liste des mots d'un document *)
val get_liste_mot_doc : doc -> liste_mot

(* On vérifie si un mot est dans la liste des mots d'un document *)
val est_dans : liste_mot -> string -> bool





















let get_prem =
  function Cliste(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste =  function Cliste(_, reste) -> reste |
                      _  -> failwith "get_reste : l'argument n'a pas la forme attendue" ;;





(* let cree_liste_vide = function () -> Cliste_vide ;;
let est_vide = function liste ->
 liste = cree_liste_vide() ;; *)


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
