let a = 5;;

              (*   ==================== *)
(*   Fonction ecrit_date  *)
(*   ==================== *)

(* int -> int -> int -> string -> string *)
 
   
(* transforme une date donnée sous la forme de 3 entiers en la même date écrite en *)
(* toutes lettres et ajoute un caractère donné à la fin. *)

(* Ex :  *)
(*    # ecrit_date 12 5 1926 ".";; *)
(*    - : string = "le douze mai mille neuf cent vingt six."  *)


(* ------------------------------------------------------------------------------------- *)
(* Les fonctions permettant de récupérer les différents chiffres qui composent un entier *)
(* -----------------------------------------------------------------------------------   *)

let unite = function nb -> nb mod 10;;
(** int -> int : récupère le chiffre des unités d'un nombre donné *)

let dizaine = function nb -> unite ( nb / 10);;
(** int -> int : récupère le chiffre des dizaines d'un nombre donné *)

(* ***** a compléter si besoin ********* *)


(* ---------------------------------------------------------- *)
(* Ecriture des valeurs de base : chiffre, dizaine, mois, ... *)
(* --------------------------------------------------------   *)


(* --------------- 
   ecrit_mois : int -> string
 * ---------------- 
   tranforme un entier correspondant à un numéro de mois en la chaîne de caractères correspondant *)

let ecrit_mois =
  function mois ->
            match mois with
              1 -> "janvier" |
              2 -> "février" |
              3 -> "mars" |
              4 -> "avril" |
              5 -> "mai"|
              6 -> "juin"|
              7 -> "juillet"|
              8 -> "août"|
              9 -> "septembre"|
              10 -> "octobre"|
              11 -> "novembre"|
              12 -> "décembre"|
              _ -> failwith "erreur -fonction ecrit_mois : n° de mois non OK";;

(* --------------- 
   ecrit_unite : int -> string
 * ---------------- 
   tranforme un chiffre en la chaîne de caractères correspondant *)

let ecrit_unite = function nb ->
  match nb with
    0 -> "" |
    1 -> "un" |
    2 -> "deux" |
    3 -> "trois" |
    4 -> "quatre" |
    5 -> "cinq" |
    6 -> "six" |
    7 -> "sept" |
    8 -> "huit" |
    9 -> "neuf" |
    _ -> failwith "erreur -fonction ecrit_unite : chiffre non ok";;


(* -------------
   ecrit_dizaine : int -> string
 * -------------
tranforme un chiffre représentant une dizaine en la chaîne de caractères correspondant *)

let ecrit_dizaine = function nb ->
   match nb with
    0 -> "" |
    1 -> "dix" |
    2 -> "vingt" |
    3 -> "trente" |
    4 -> "quarante" |
    5 -> "cinquante" |
    6 -> "soixante" |
    7 -> "soixante dix" |
    8 -> "quatre vingt" |
    9 -> "quatre vingt dix"|
    _ -> failwith "erreur -fonction ecrit_dizaine : parametre non ok";;

let ecrit_exception = function nb ->
   match nb with
    11 -> "onze" |
    12 -> "douze" |
    13 -> "treize" |        
    14 -> "quatorze" |
    15 -> "quize" |
    16 -> "seize" |


        _ -> failwith "erreur -fonction ecrit_dizaine : parametre non ok";;


let get_unite = function nb ->
    ecrit_unite (unite nb);;
    (* profil : int -> string*)

let get_dizaine = function nb ->
    ecrit_dizaine(dizaine nb);;

let get_nb nb =
  let d = dizaine nb in
  let u = unite nb in
  let n = nb mod 100 in
  if (n >= 11 && n <= 16) then ecrit_exception n
  else if (n = 71) then "soixante-et-onze"
  else if (n = 80) then "quatre-vingts"
  else if (n > 71 && n <= 79) then "soixante-" ^ (ecrit_exception (u + 10))
  else if (n > 90 && n <= 99) then "quatre-vingt-" ^ (if u=1 then "onze" else if u < 7 then ecrit_exception (u+10) else "dix-" ^ ecrit_unite u)
  else if (u = 1 && d > 1 && d < 7) then (ecrit_dizaine d) ^ "-et-un"
  else let res = (ecrit_dizaine d) ^ " " ^ (ecrit_unite u) in
       if res = " " then "" else res;;



let centaine = function nb -> unite ( nb / 100);;
let millier = function nb -> unite (nb / 1000);;


  let ecrit_centaine = function nb ->
  let c = centaine nb in
  let reste = nb mod 100 in
  if c = 0 then ""
  else if c = 1 then "cent "
  else if reste = 0 then (ecrit_unite c) ^ " cents "
  else (ecrit_unite c) ^ " cent ";;

let ecrit_millier = function nb ->
  let m = millier nb in
  if m = 0 then ""
  else if m = 1 then "mille "
  else (get_nb m) ^ " mille ";; 

let ecrit_annee = function nb ->
  ecrit_millier nb ^ ecrit_centaine nb ^ get_nb nb;;

let ecrit_date jour mois annee string =
  "le " ^ (get_nb jour) ^ " " ^ (ecrit_mois mois) ^ (ecrit_annee annee) ^ string;;

