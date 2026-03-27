
open String;;

(* Fonctions de base pour ch. de caractères *)
(* ========================================= *)

let est_vide = function ch -> (ch = "");;
(** string -> bool
    teste si son paramètre est une chaîne vide *)

let prem_lettre = function ch -> sub ch 0 1;;
(** string -> string
renvoie la première lettre d'une chaîne de caractères *)

let reste = function ch -> sub ch 1 ((length ch) - 1);;
(** string -> string
renvoie la chaîne de caractères passée en paramètre privée de sa première lettre *)


let rec rest_cpt = function chercher -> function chaine->
  if est_vide(chaine) then
    0
  else
    if prem_lettre(chaine) = chercher then
      1 + rest_cpt chercher (reste chaine)
    else
    0;;
(* string -> string -> int
    renvoie le nombre d'occurrences d'une lettre dans une chaîne de caractères sans coupure*)

  
    let rec suppprimer = function n -> function chaine ->
      if n <= 0 then
        chaine
      else
        suppprimer (n-1) (reste chaine);;
      (* int -> string -> string
      supprime les n premières lettres d'une chaîne de caractères *)


    let transformation_string = function entier ->
      string_of_int entier;;

      (*  int -> string
      passe un entier en chaîne de caractères *)
let rec suivant = function chaine ->
  if est_vide(chaine) then
    ""
  else
    let premiere_lettre = prem_lettre(chaine) in
    let nb = rest_cpt premiere_lettre chaine in 
    transformation_string(nb) ^ premiere_lettre ^ suivant(suppprimer nb (chaine));;
  
(* strin -> string
prend une chaine de caractères et donne la suivante selon les consignes données*)



 let rec suite = function x0 -> function n -> 
  if n = 0 then x0 
  else 
  suivant(suite x0(n-1));;

(* string -> int -> string
effectue la boucle pr trouver la n ieme chaine de charactère en se basant sur la fonction suivant ci-dessus*)



(*================================================ EXERCICE 2 TP : LES TOURS D'HANOÏ =======================================*)



let rec hanoi = function nb_disque -> function tour_dep -> function tour_fin -> function tour_int ->
  if nb_disque = 0  then
    ""
  else
    hanoi (nb_disque - 1) tour_dep tour_int tour_fin ^ (* on deplace le paque du dessus au point intermedriaire*)
    "deplacer disque " ^ transformation_string(nb_disque) ^ " de la tour " ^ tour_dep ^ " à la tour " ^ tour_fin ^ " --> " ^ (* On déplace le gros blo a sa position finale*)
    hanoi (nb_disque - 1) tour_int tour_fin tour_dep ;;  (* On met le reste sur le gros bloc*)

(* int -> string -> string -> string -> string *)