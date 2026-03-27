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



  type tEtudiant = Cetudiant of string * string * int * tdate * string;;

  let etu_noel =  Cetudiant("Mael","Gaborit",51,noel,"Info");;
  let etu_manu =  Cetudiant("MAnu","Negoce",56,noel28,"Info");;
  let etu_mars =  Cetudiant("Matelian","Negoce",56,fin_mars,"Info");;



  let dateNaissance = function Cetudiant(_,_,_,dateNaissance,_) -> dateNaissance;;

  let test = est_avant (dateNaissance etu_noel) (dateNaissance etu_mars);;
  
  

type tListesEleves = ClEleves of tEtudiant* tListesEleves| CLNotes_vide ;;
  
let cree_liste_eleves_vide = function () -> CLNotes_vide ;;

let add_eleve = function etudiant -> function reste_liste ->
  ClEleves(etudiant, reste_liste);;

let est_vide = function liste ->
 liste = cree_liste_eleves_vide() ;;

let get_filiere = function Cetudiant(_,_,_,_,filiere) -> filiere;; 
 
let get_prem =
  function ClEleves(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste =  function ClEleves(_, reste) -> reste |
                      _  -> failwith "get_reste : l'argument n'a pas la forme attendue" ;;

let maliste = ClEleves(etu_noel,cree_liste_eleves_vide());;

let malisteetu_test = ClEleves(etu_mars,maliste);;
let maliste = ClEleves(etu_manu,malisteetu_test);;




let get_age = function Cetudiant(_,_,_,dateNaissance,_) -> dateNaissance;;

      let compare = function etu1 -> function etu2 -> function f ->
        let age1 = get_age etu1 in
        let age2 = get_age etu2 in
        if f age1 age2 then
          etu1
        else
          etu2;;

let rec trv_eleve = function liste -> function f ->
    let prem_etu = get_prem liste in 
    if est_vide(get_reste liste) then
      prem_etu
    else
      let jeune_reste = trv_eleve(get_reste liste) f in
      compare prem_etu jeune_reste f;;

    let plus_jeune = function listeEleves ->
      if est_vide listeEleves then
        failwith "liste vide"
      else
        trv_eleve listeEleves est_apres;;
    
    let plus_age= function listeEleves ->
      if est_vide listeEleves then
        failwith "liste vide"
      else
        trv_eleve listeEleves est_avant;;
(* 
let rec liste_annee = function liste_etu-> function nb ->
  let annee = (s_an (dateNaissance(get_prem liste_etu))) in
  if est_vide liste_etu then
    ""
  else if 
    annee = nb then
    set_liste (get_reste liste_etu,get_prem liste_etu) nb
  else
    liste_annee (get_reste liste_etu) nb;; 

let rec liste_filiere = function liste_etu -> function filiere ->
  let filiere_etu = get_filiere(get_prem liste_etu) in
  if est_vide liste_etu then
    failwith "Aucun étudiant dans cette filière"
  else if filiere_etu = filiere then
    set_liste (get_reste liste_etu) filiere prem_etu
  else
    liste_filiere (get_reste liste_etu) filiere;;

est_dans_filiere *)


(* let anniv = function date_soiree -> function tListesEleves ->
  
 *)


let set_liste = function listeEtudiant -> function etudiant ->
  if est_vide listeEtudiant then
    ClEleves(etudiant,cree_liste_eleves_vide())
  else
    ClEleves(etudiant,listeEtudiant);;




let nv_date_detudiant = function etudiant -> function date_initial ->
  let annee = s_an date_initial in
  let dateNaissance = get_age etudiant in
  let jour = s_jour dateNaissance in
  let mois = s_mois dateNaissance in
  Cdate(jour,mois,annee);;

(* tdate -> tdate -> bool *)
let est_ds_7_jours = function etudiant-> function date_initial ->
  let nv_date = nv_date_detudiant etudiant date_initial in
  let ya_7_jours = decale date_initial (-7) in
  let ds_7_jours = decale date_initial 7 in
  (est_apres nv_date ya_7_jours || egal nv_date ya_7_jours) &&
  (est_avant nv_date ds_7_jours || egal nv_date ds_7_jours);; 

  
(* une altenrative  *)

(* 
let rec semaine = function j1 -> function laDate -> function n ->
  if n = 0 then
    if egal (decale j1 n) laDate then
      true
    else
      false
  else
    if egal (decale j1 n) laDate then
      true
    else
      semaine j1 laDate (n-1);; *)
    

let liste_vide = cree_liste_eleves_vide();;


let rec anniv = function tListesEleves-> function ladate -> 
  if est_vide tListesEleves then
        tListesEleves
  else
    let etudiant = get_prem tListesEleves in
    if est_ds_7_jours etudiant ladate then
      add_eleve etudiant (anniv (get_reste tListesEleves) ladate)
    else
      anniv(get_reste tListesEleves) ladate;;


      let cette_annee = function etu1 -> function annee ->
        let annee = s_an(annee) in
        let datenaissance = get_age etu1 in
        let anneeEtu = s_an datenaissance in
        anneeEtu = annee;;

  
      let rec general = function tListesEleves-> function ladate -> function f->
  if est_vide tListesEleves then
        tListesEleves
  else
    let etudiant = get_prem tListesEleves in
    if f etudiant ladate then
      add_eleve etudiant (general (get_reste tListesEleves) ladate f)
    else
      general(get_reste tListesEleves) ladate f;;


      let liste_annee = function tListesEleves -> function ladate ->
        if est_vide tListesEleves then
          cree_liste_eleves_vide()
        else
        general tListesEleves ladate cette_annee;;
    

  