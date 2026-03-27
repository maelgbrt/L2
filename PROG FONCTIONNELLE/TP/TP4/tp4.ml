
(* ******************************************************************** *)
(* TP6 - Jeu de dominos - Représentation des types et fonctions de base *)
(* ******************************************************************** *)

(* Définition des types *)
(* -------------------- *)

type tdomino = {a:int; b:int} ;;

(** tldom = liste de dominos : permet de représenter les mains des joueurs, la pioche et la chaine
    aux extrémités de laquelle les dominos sont posés sur le plateau *)
(** C'est un type récursif *)

type tldom = Cldom of tdomino * tldom | Cldom_vide ;;

(* *************************************** *)
(* Constructeurs et selecteurs		   *)
(* *************************************** *)

(* Pour le type tdomino *)
(* -------------------- *)

let cree_dom = function un -> function deux -> {a=un; b=deux};;
(** int -> int -> tdomino **)
(** cree un domino à partir de 2 entiers passés en paramètres *)

let s_cote1 = function dom -> dom.a;;
(** tdomino -> int *)
(** renvoie le cote gauche du domino *)

let s_cote2 = function dom -> dom.b;;
(** tdomino -> int *)
(** renvoie le cote droit du domino *)


(* Pour le type tldom : liste de dominos *)
(* ------------------------------------- *)

let ajouter_dom = function d -> function l-> Cldom(d,l);;
(** tdomino -> tldom -> tldom *)
(** ajout d'un domino donné dans une liste de dominos donnée. Le domino est placé en tête *)

let cree_ldom_vide = function () -> Cldom_vide;;
(** création d'une liste de dominos vide : () -> tldom *)

let prem_dom = function Cldom(dom,_) -> dom
  | _ -> failwith "prem_dom : l'argument n'a pas la forme attendue";;
(** renvoie le premier domino d'une liste de dominos : tldom -> tdomino *)

let reste_dom = function Cldom(_,ldom) -> ldom
  | _ -> failwith "reste_dom : l'argument n'a pas la forme attendue";;
(** renvoie la liste de dominos passée en paramètre privée de son premier domino *)


(* *************************************** *)
(* Auxiliaires				   *)
(* *************************************** *)

let est_ldom_vide = function ldom -> ldom = cree_ldom_vide();;
(** teste si la liste de dominos passée en paramètre est vide *)

let un_seul_dom = function l ->
  est_ldom_vide (reste_dom l);;
(** teste si la liste de dominos passée en paramètre est réduite à un seul domino *)


(* *************************************** *)
(* Affichage				   *)
(* *************************************** *)

(** affichage d'un domino : tdomino -> string *)

let affiche_dom = function dom ->
  let coteg = string_of_int (s_cote1 dom)
  and coted = string_of_int (s_cote2 dom)
  in
  "[" ^ coteg ^ "|" ^ coted ^ "] ";;


(** affichage d'une liste de dominos : tldom -> string *)

let rec affiche_ldom = function ldom ->
  if (est_ldom_vide ldom)
  then ""
  else
    let dom1 = (prem_dom ldom)
    and reste = (reste_dom ldom)
    in
    (affiche_dom dom1) ^ (affiche_ldom reste);;



(* *************************************** *)
(* Quelques objets pour les tests          *)
(* *************************************** *)

(* des dominos *)
(* ----------- *)

let d66 = cree_dom 6 6;;
let d56 = cree_dom 5 6;;
let d14 = cree_dom 1 4;;
let d00 = cree_dom 0 0;;
let double_blanc = d00;;
let d53 = cree_dom 5 3;;
let d45 = cree_dom 4 5;;
let d12 = cree_dom 1 2;;
let d51 = cree_dom 5 1;;
let d16 = cree_dom 1 6;;

(* des listes de dominos qui peuvent servir de mains des joueurs *)
(* ------------------------------------------------------------- *)

let j1 = (cree_ldom_vide());;
    
let j1 = ajouter_dom d53 j1;;
let j1 = ajouter_dom d12 j1;;

(* affiche_ldom j1;; *)
(* - : string = "[1|2] [5|3] [0|0] " *)


(* j2 peut aussi servir de chaine *)

let j2 = cree_ldom_vide();;

let j2 = ajouter_dom d56 j2;;
let j2 = ajouter_dom d45 j2;;
let j2 = ajouter_dom d66 j2;;
let j2 = ajouter_dom d14 j2;;



(* affiche_ldom j2;; *)
(* - : string = "[4|5] [5|6] [6|6] " *)


let est_double = function dom ->
  s_cote1 dom = s_cote2 dom;;



let est_plus_grand = function dom1 -> function dom2 ->
  if est_double dom1 then
    if est_double dom2 then
      if s_cote1 dom1 > s_cote2 dom2 then
        dom1
      else
        dom2
    else 
      dom1
    else if est_double dom2 then
      dom2
  else
    if (max (s_cote1 dom1) (s_cote2 dom1)) > (max (s_cote1 dom1) (s_cote2 dom2)) then
      dom1
    else 
      if (max (s_cote1 dom1) (s_cote2 dom1)) = (max (s_cote1 dom1) (s_cote2 dom2))then
        if (min (s_cote1 dom1) (s_cote2 dom1)) > (min (s_cote1 dom1) (s_cote2 dom2)) then
          dom1
        else
          dom2
      else
        dom2


let rec plus_grand_main = function listeD -> 
    if un_seul_dom listeD then
      prem_dom listeD
    else 
      est_plus_grand (prem_dom listeD) (plus_grand_main (reste_dom listeD));;


(*utop # plus_grand_main j2;;
- : tdomino = {a = 5; b = 6}*)



(*question 5*)

  let quiCommence = function listeD_J1 -> function listeD_J2 ->
    let pd_j2 = plus_grand_main listeD_J2 in
    let pd_j1 = plus_grand_main listeD_J1 in
    if est_plus_grand (pd_j1) (pd_j2) = pd_j1 then 1 else 2;;

  (*question 6*)

(*
    utop # quiCommence j1 j2;;
- : int = 2
*)



let rec dern_dom = function listeD ->
  if un_seul_dom listeD then
    prem_dom listeD
  else
    dern_dom (reste_dom listeD);;


let est_posable = function d ->
  function liste ->
    let gauche_plateau = s_cote1 (prem_dom liste) in
    let droite_plateau = s_cote2 (dern_dom liste) in
    s_cote1 d = gauche_plateau || s_cote2 d = gauche_plateau || s_cote1 d = droite_plateau || s_cote2 d = droite_plateau ;;      


let rec dominosPosables = function listeD -> function main_j ->
  if est_ldom_vide main_j
    then main_j
  else
    let premier_d = prem_dom main_j in
    let reste = reste_dom main_j in
    let dominoPosable = dominosPosables listeD reste in

    if est_posable premier_d listeD
      then ajouter_dom premier_d dominoPosable
  else
    dominoPosable;;


    (*
     j1;;
- : tldom = Cldom ({a = 1; b = 2}, Cldom ({a = 5; b = 3}, Cldom_vide))


 j2;;
- : tldom =
Cldom ({a = 1; b = 4},
 Cldom ({a = 6; b = 6},
  Cldom ({a = 4; b = 5}, Cldom ({a = 5; b = 6}, Cldom_vide))))

dominosPosables j1 j2;;
- : tldom = Cldom ({a = 1; b = 4}, Cldom_vide)


//on a bien au extremité 1 et 3  et le seul dominos qui peut être posé est d14
    *)


let rec ajouter_fin = function dom  -> function listD ->
  if est_ldom_vide listD then
    ajouter_dom dom listD
  else
    ajouter_fin dom (reste_dom listD);;

    let retourne_dom = function dom -> cree_dom (s_cote2 dom) (s_cote1 dom);;


let poseDomino = function dom -> function listeD -> function number ->
  if est_ldom_vide listeD then 
    ajouter_dom dom listeD
  else
    if number = 1 then
      let gauche = s_cote1 (prem_dom listeD) in
      if s_cote2 dom = gauche then ajouter_dom dom listeD
      else if s_cote1 dom = gauche then ajouter_dom (retourne_dom dom) listeD
      else listeD 
    else
      let droite = s_cote2 (dern_dom listeD) in
      if s_cote1 dom = droite then ajouter_fin dom listeD
      else if s_cote2 dom = droite then ajouter_fin (retourne_dom dom) listeD
      else listeD 


let j3 = cree_ldom_vide();;
let j3 = ajouter_dom d12 j3;;

(* 
poseDomino d14 j3 1;;
- : tldom = Cldom ({a = 4; b = 1}, Cldom ({a = 1; b = 2}, Cldom_vide)) *)