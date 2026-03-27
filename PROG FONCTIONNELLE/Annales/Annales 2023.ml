(* Annales 2023 *)

let est_vide = function mot -> (mot = "") ;;
let prem_lettre = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;

(* Question 1 *)

(* 1.1 string -> int *)

(* 1.2 mardi 0 -> emma 1 *)

(* 1.3 elle compte le nb de fois ou une lettre se repete a la suite *)

(* 1.4 ceci est un recursif *)


let rec get_mot = function ch->
  if est_vide ch || prem_lettre ch = " " then 
    ""
  else
      prem_lettre ch ^ get_mot(reste_mot ch);; 

let rec reste_mot = function ch ->
  if est_vide ch then
    ""
  else if prem_lettre ch = " " then
    (* On a trouvé l'espace après le mot : on renvoie tout ce qui suit *)
    (* (On utilise ta fonction "reste_mot" primitive ici) *)
    String.sub ch 1 (String.length ch - 1)
  else
    (* On est encore dans le premier mot, on continue de chercher l'espace *)
    reste_mot (String.sub ch 1 (String.length ch - 1));;


    let rec get_val = function cle_valeur -> function cle ->
      if est_vide cle_valeur || est_vide (reste_mot cle_valeur)then
        ""
      else
        let cle_trv = get_mot cle_valeur in
        let valeur = get_mot (reste_mot cle_valeur) in 
         let suite = reste_mot( reste_mot cle_valeur) in
        if cle_trv = cle then
          valeur
        else
          get_val suite cle ;;


  let get_coef = function tMatieresBAc -> function nomMatiere->
    get_val tMatieresBAc nomMatiere;;

    let get_note = function tResBac -> function nomMatiere->
    get_val tResBac nomMatiere;;


    let rec coefs_eleve = function tResBac -> function tMatieresBAc ->
         if est_vide tResBac|| est_vide (reste_mot tResBac)then
        ""
        else
      let cle = get_mot tResBac in
      let suite = reste_mot (reste_mot tResBac) in
      get_coef tMatieresBAc cle ^ " " ^ coefs_eleve suite tMatieresBAc;;

   let rec notes = function tResBac ->
    if est_vide tResBac then
      ""
    else
      let suite = reste_mot (reste_mot tResBac) in
      get_mot (reste_mot tResBac) ^ " " ^ notes suite;;


  let 