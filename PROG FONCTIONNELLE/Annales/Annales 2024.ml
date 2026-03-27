(* Annales 2024 *)

let est_vide = function mot -> (mot = "") ;;
let prem_lettre = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;

let suivant s =
  if s = "" then "" 
  else
    let c = s.[0] in                 (* On récupère le premier caractère de la chaîne *)
    let code = char_of_int (int_of_char c + 1) in (* On calcule le caractère suivant *)
    String.make 1 code;;             (* On transforme ce caractère en chaîne de 1 élément *)


(* QUESTION 1 *)

(* 1.1 *) 
let rec lettre_se_suivent = function ch1 ->
  if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if suivant(prem_lettre ch1) = prem_lettre (reste_mot ch1) then
      true
    else
      lettre_se_suivent (reste_mot ch1)



let rec lettres_idem = function ch1 ->
  if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if prem_lettre(reste_mot ch1) = prem_lettre ch1 then
      true
    else
      lettres_idem (reste_mot ch1);;


let rec test_prop =  function generalise-> function ch1->
   if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if generalise(prem_lettre(ch1)) (prem_lettre (reste_mot ch1)) then
      true
    else
      test_prop generalise (reste_mot ch1);;

let est_identique = function ch1 ->function ch2 ->
  ch1 = ch2;;0

let est_suivant = function ch1 -> function ch2 ->
  suivant ch1 = ch2;;

let lettres_idemV2 = test_prop est_identique;;

let lettre_se_suiventV2 = test_prop est_suivant;;


(* (string->string -> string) -> string -> bool *)


let rec nb_occur = function charac -> function ch ->
  if est_vide ch then
    0
  else
    if prem_lettre ch = charac then
      1+ nb_occur charac (reste_mot ch)
    else
      nb_occur charac (reste_mot ch);;  
  
let score_set  = function  marque_match ->
  let j1 = nb_occur "1" marque_match in
  let j2 = nb_occur "2" marque_match in
  string_of_int(j1)^string_of_int(j2);;

let rec prem_set = function marque_match ->
  if est_vide marque_match || prem_lettre marque_match = " " then 
    ""
  else
      prem_lettre marque_match ^ prem_set(reste_mot marque_match);; 

let rec reste_set = function marque_match ->
  if est_vide marque_match then
    ""
  else
    if prem_lettre marque_match = " " then
      reste_mot marque_match
    else
      reste_set (reste_mot marque_match);;


let j_gagne = function score_match_ch ->
  if est_vide score_match_ch then
    0
  else
    if int_of_string(prem_lettre score_match_ch) > int_of_string(prem_lettre(reste_mot score_match_ch) )then
      1
    else
      2;;

let rec score_match = function marque_match ->
  if est_vide marque_match then
    ""
  else
    let result_set = score_set (prem_set marque_match)in
    result_set ^ " " ^ score_match (reste_set marque_match);;


let rec compte_set_gagnee = function marque_match -> function j1->
  if est_vide marque_match then
    0
  else
    if j_gagne(prem_set marque_match) = j1 then
      1+ compte_set_gagnee (reste_set marque_match) j1
    else
      compte_set_gagnee (reste_set marque_match) j1



let gagne_match = function marque_match -> function nb_set_match -> function j1 -> function j2 ->
  let score = score_match marque_match in
  let score_j1 = compte_set_gagnee score 1 in
  let score_j2 = compte_set_gagnee score 2 in
  if score_j1 >= nb_set_match then
    j1
  else
  if score_j2 >= nb_set_match then
    j2
else
"Match en cours - " ^ score_match marque_match;;



let rec plus_grand = function score -> function n ->
  if est_vide score then
    n
  else
    if int_of_string (prem_set score) > n then
      plus_grand (reste_set score) (int_of_string (prem_set score))
    else
      plus_grand (reste_set score) n ;;

let set_le_plus_dispute = function marque_match ->
  let score = score_match marque_match in
  let leplugrand = plus_grand score 0 in
  leplugrand;;


 
