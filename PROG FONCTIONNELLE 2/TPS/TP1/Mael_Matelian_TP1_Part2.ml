(* Question 2 - Manipulation de dates *)

(** définition du type *)

type tdate = Cdate of int * int * int;;


(* constructeurs et sélecteurs *)
(* ============================ *)

let (cree_date : int -> int -> int -> tdate) =
  function j -> function m -> function a -> Cdate(j, m, a);;

(*renvoie le numéro du jour correspondant à la date donnée en argument*)
let (s_jour   : tdate -> int) = function Cdate(j, _, _) -> j ;;

(*renvoie le numéro du mois correspondant à la date donnée en argument*)
let (s_mois   : tdate -> int) = function Cdate(_, m, _) -> m ;;

(*renvoie le numéro de l'année correspondant à la date donnée en argument*)
let (s_an   : tdate -> int) = function Cdate(_, _, a) -> a ;;


(* quelques exemples de dates *)
(* ========================== *)

let annee0 = cree_date 0 0 0000;;
let noel = cree_date 25 12 2018;;
let noel28 = cree_date 28 12 2017;;


let noel19 = cree_date 25 12 2019;;

let fin_fevbis = cree_date 28 2 2016;;

let fin_fev = cree_date 28 2 2018;;

let fin_mars = cree_date 31 3 2020;;

let fin_avril = cree_date 30 4 2020;;


(* Fonctions de manipulation de base : affichage *)
(* ============================================= *)

let (affiche_date : tdate -> unit) = function date ->
  let jour = string_of_int (s_jour date)
  and mois =  string_of_int (s_mois date)
  and an =  string_of_int (s_an date)
  in
  print_string (jour^"/"^mois^"/"^an);;


(* Fonctions de manipulation de base : comparaison *)
(* =============================================== *)

(* est_avant *)
(* ========= *)
(* prend en paramètres 2 dates et teste si date1 est antérieure à date2 - ordre chronologique *)

let (est_avant : tdate -> tdate -> bool) = function date1 -> function date2 ->
  let j1 = (s_jour date1)
  and m1 = (s_mois date1)
  and a1 = (s_an date1)
  and j2 = (s_jour date2)
  and m2 = (s_mois date2)
  and a2 = (s_an date2)
  in
  ( (a1 < a2) || ((a1 = a2) && (m1 < m2)) ||
      ((a1 = a2) && (m1 = m2) && (j1 < j2)) );;


(* egal *)
(* ==== *)
(*  prend en paramètres 2 dates et teste si date1 est identique à date2 *)

let (egal : tdate -> tdate -> bool) = function date1 -> function date2 ->
  let j1 = (s_jour date1)
  and m1 = (s_mois date1)
  and a1 = (s_an date1)
  and j2 = (s_jour date2)
  and m2 = (s_mois date2)
  and a2 = (s_an date2)
  in
  ((a1 = a2) && (m1 = m2) && (j1 = j2));;

(* est_apres *)
(* ========= *)
(* prend en paramètres 2 dates et teste si date1 est postérieure à date2 - ordre chronologique *)

let (est_apres  : tdate -> tdate -> bool) = function date1 -> function date2 ->
  not ((est_avant date1 date2) || (egal date1 date2));;



(* Fonctions de manipulation de base : test de dates particulières *)
(* =============================================================== *)

(* fin_annee *)
(* ========= *)
(* prend une date en paramètre et teste si cette date correspond à la
   fin de l'année, au 31 décembre donc *)

let (fin_annee : tdate -> bool) = function date1 -> 
  let j1 = (s_jour date1)
  and m1 = (s_mois date1)
  in
  ((j1 = 31) && (m1 = 12));;


(* fin_de_mois *)
(* =========== *)
(* prend une date en paramètre et teste si cette date correspond au dernier jour du mois *)


(* fonction mult : teste si un nombre est multiple d'un autre *)
let mult = function a -> function b ->  ( (a mod b) = 0);;

(* fonction bissextile : prend une année en paramètre et teste si cette année est bissextile *)
let bissextile = function an -> ((mult an 4) && (not ( mult an 100))) || (mult an 400);;

(* fonction nb_jours_dans_mois : prend un n° de mois et un n° d'année
   en paramètres et renvoie le nombre de jours qu'il y a dans le mois
   donné pour l'année donnée. *)
let  (nb_jours_dans_mois : int -> int ->int)  = function mois -> function an ->
  if mois = 2
      then if (bissextile an) then 29 else 28
  else
    if (mois = 4) ||  (mois = 6) ||  (mois = 9) ||  (mois = 11)
    then 30
    else 31;;


let (fin_de_mois : tdate -> bool) = function date ->
  let j = (s_jour date)
  and m = (s_mois date)
  and a = (s_an date)
  in
  (j = (nb_jours_dans_mois m a));;


(* Fonctions de manipulation de base : décalage dans le temps *)
(* ========================================================== *)

(* lendemain *)
(* ========= *)
(* prend une date en paramètre et renvoie la date du lendemain *)

let (lendemain : tdate -> tdate) = function date -> 
  let jour = (s_jour date)
  and mois = (s_mois date)
  and an = (s_an date)
  in
  if fin_annee date
     then (cree_date 1 1 (an + 1))
  else
    if fin_de_mois date
       then (cree_date 1 (mois + 1) an)
    else cree_date (jour + 1) mois an ;;

(* hier *)
(* ==== *)
(* prend une date en paramètre et renvoie la date de la veille *)



let (hier : tdate -> tdate) = function date ->
  let j = s_jour date in
  let m = s_mois date in
  let a = s_an date in
  
  if j = 1 && m = 1 then
    cree_date 31 12 (a - 1)
  else if j = 1 then
    let mois_prec = m - 1 in
    let dernier_j_prec = nb_jours_dans_mois mois_prec a in
    cree_date dernier_j_prec mois_prec a
  else
    cree_date (j - 1) m a;;


(* decale *)
(* ====== *)
(* prend une date et un nombre de jours en paramètres et renvoie la
   date correspondant à un décalage de ce nombre de jours dans le
   temps. Ce nombre peut être positif ou négatif *)

(* a recours à la fonction d'ordre supérieur decale_date qui permet de
   choisir entre "lendemain" et "hier" comme fonction à appliquer pour
   décaler vers le futur ou vers le passé *)


let rec (decale_date : (tdate -> tdate) -> (int -> int) -> tdate -> int -> tdate) =
  function fonct -> function suiv -> function date -> function n ->
    if n = 0 then date
    else
      fonct (decale_date fonct suiv date (suiv n));;

let (decale : tdate -> int -> tdate) = function date -> function n ->
  if n >= 0
     then decale_date lendemain (function x -> x - 1) date n
  else decale_date hier (function x -> x + 1) date n;;





type loption = Option of string * loption
  | Option_vide;;

let option_vide () = Option_vide;;


let get_option = function  Option(option,_) -> option;;
let get_suiv_option = function Option(_,suite_option) -> suite_option;;


let rec est_dans_option = function liste -> function opt -> 
  if liste = Option_vide then
    false
  else
    let option = get_option liste in
    let suite = get_suiv_option liste in
    if option = opt then true
    else est_dans_option suite opt;;




(* ===== ETUDIANTS ===== *)
type tEtudiant =
  Cetudiant of string * string * int * tdate * string * loption;;

let get_date_naissance (Cetudiant(_,_,_,d,_,_)) = d;;
let get_filiere (Cetudiant(_,_,_,_,f,_)) = f;;
let get_options (Cetudiant(_,_,_,_,_,opt)) = opt;;

type tListesEleves = ClEleves of tEtudiant * tListesEleves | Vide;;

let est_vide = function Vide -> true | _ -> false;;

let add = function eleve -> function liste -> ClEleves(eleve,liste);;

let get_prem =
  function ClEleves(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste =  function ClEleves(_, reste) -> reste |
                      _  -> failwith "get_reste : l'argument n'a pas la forme attendue" ;;


let rec filtrer_universel liste valeur critere =
  if est_vide liste then
    Vide
  else
    let e = get_prem liste in
    let reste = get_reste liste in
    if critere e valeur then
      ClEleves(e, filtrer_universel reste valeur critere)
    else
      filtrer_universel reste valeur critere;;

let cette_filiere e filiere =
  get_filiere e = filiere;;

let cette_annee e annee =
  s_an (get_date_naissance e) = annee;;

let cette_option e opt =
  est_dans_option (get_options e) opt;;


let nv_date e date_ref =
  let d = get_date_naissance e in
  cree_date (s_jour d) (s_mois d) (s_an date_ref);;

let est_ds_7_jours e date_ref =
  let d = nv_date e date_ref in
  let avant = decale date_ref (-7) in
  let apres = decale date_ref 7 in
  (est_apres d avant || egal d avant) &&
  (est_avant d apres || egal d apres);;

let liste_filiere l f =
  filtrer_universel l f cette_filiere;;

let liste_annee l a =
  filtrer_universel l a cette_annee;;

let liste_option= function  l -> function opt ->
  filtrer_universel l opt cette_option;;

let anniv = function l -> function date ->
  filtrer_universel l date est_ds_7_jours;;