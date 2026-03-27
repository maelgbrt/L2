
open String;;


let est_vide = function ch -> (ch = "");;
(** string -> bool
    teste si son paramètre est une chaîne vide *)

let prem_lettre = function ch -> sub ch 0 1;;
(** string -> string
renvoie la première lettre d'une chaîne de caractères *)

let reste = function ch -> sub ch 1 ((length ch) - 1);;
(** string -> string
renvoie la chaîne de caractères passée en paramètre privée de sa première lettre *)


let rec get_mot_premier = function phrase ->
  if est_vide phrase
  then ""
  else
    let lettre1 = (prem_lettre phrase) and rest = (reste phrase)
    in
    if lettre1 = " "
    then ""
    else
      lettre1 ^ (get_mot_premier rest);;


let rec get_mot = function n -> function tdecompte_charge ->
  if tdecompte_charge = "" || n=0 then
    ""
  else
    if n = 1 then
      get_mot_premier tdecompte_charge
  else
    if prem_lettre(tdecompte_charge) = " " then
      get_mot (n-1) (reste tdecompte_charge)
  else
    get_mot n (reste tdecompte_charge);;




let get_reste = function phrase ->
  let long = (length (get_mot_premier phrase)) + 1
  in
  sub phrase long ((length phrase) - long);;


let get_code = function phrase -> 
  get_mot 1 phrase;;

let get_date = function phrase ->
  get_mot 2 phrase;;

let get_conso = function phrase ->
  get_mot 2 phrase;;


let get_hdebut = function phrase ->
  get_mot 3 phrase;;

let get_cout = function phrase ->
  get_mot 3 phrase;;

let get_hfin = function phrase ->
  get_mot 4 phrase

(* let get_charge =  function phrase -> *)
  

let  rec get_heures = function heures ->
  if prem_lettre (reste heures) = "h" then
    prem_lettre heures
  else
    prem_lettre heures ^ get_heures (reste heures);;

let rec get_minutes = function heures ->
  if prem_lettre (reste heures) = "" then
    ""
  else if prem_lettre heures ="h" then
    reste heures
  else
  get_minutes (reste heures);;

let total_min = function heures ->
  let heures_int = int_of_string (get_heures heures) in
  let minutes_int = int_of_string(get_minutes heures) in
  heures_int * 60 +  minutes_int;;


let temps_ecoule = function hdebut -> function hfin ->
  let hdebut = total_min hdebut in
  let hfin = total_min hfin in
  if hdebut < hfin then
    hfin - hdebut
  else
    hdebut - hfin;;

let minutes_h = function minutes ->
  minutes / 60;;

let calcul_conso = function temps_ecoule -> function puissance_kWh ->
  let temps_h = float_of_int(temps_ecoule) /. 60.0 in
  temps_h *. puissance_kWh;; 

let calcul_cout = function prix_kWH -> function conso ->
  conso *. prix_kWH;;

let rec reste_pr_n tdecompte_charge n =
  if n <= 0 || prem_lettre tdecompte_charge = "" then 
    tdecompte_charge
  else
    let suivant = get_reste tdecompte_charge in
    if suivant = "" && n > 1 then
      ""
    else
      reste_pr_n suivant (n - 1);;

 let rec a_facturer = function tdécompte_charge -> function puissance_kWh -> function prix_kWH ->
  if tdécompte_charge = "" then
    ""
  else
    let code = get_code tdécompte_charge in
    let hdebut = get_hdebut tdécompte_charge in
    let hfin = get_hfin tdécompte_charge in
    let temps_ecoule = temps_ecoule hdebut hfin in 
    let conso = calcul_conso temps_ecoule puissance_kWh in
    let cout = calcul_cout prix_kWH conso in
    if get_mot 5 tdécompte_charge = "" then
      code ^" "^ string_of_float(conso) ^" "^ string_of_float(cout)
    else
      
    let suite = reste_pr_n tdécompte_charge 4 in
    code ^" "^ string_of_float(conso) ^" "^ string_of_float(cout) ^" "^ a_facturer suite puissance_kWh prix_kWH;;





  let rec get_total_conso_code = function code -> function tdecompte ->
  if tdecompte = "" then 0.
  else
    let code_donne = get_code tdecompte in
    if get_mot 4 tdecompte = "" then
      if code_donne = code then
        float_of_string(get_conso tdecompte) 
      else
        0.
    else
      if code_donne = code then
        float_of_string(get_conso tdecompte) +. get_total_conso_code code (reste_pr_n tdecompte 3)
      else
        float_of_string(reste_pr_n tdecompte 3)






  let rec get_total_cout_code = function code -> function tdecompte ->
  if tdecompte = "" then 0.
  else
    let code_donne = get_code tdecompte in
    if get_mot 4 tdecompte = "" then
      if code_donne = code then
        float_of_string(get_cout tdecompte) 
      else
        0.
    else
      if code_donne = code then
        float_of_string(get_cout tdecompte) +. get_total_cout_code code (reste_pr_n tdecompte 3)
      else
        float_of_string(reste_pr_n tdecompte 3)





let rec utilisateur = function code->  function tdecompte_charge_payement ->
  if get_mot 4 tdecompte_charge_payement = "" then
    ""
  else
  let code = get_code(tdecompte_charge_payement) in
  let conso = get_total_conso_code code tdecompte_charge_payement in
  let cout = get_total_cout_code code tdecompte_charge_payement in
  "Votre code : " ^ code ^ " - votre consomation : " ^ string_of_float(conso) ^ " - votre cout : " ^ string_of_float(cout)   



let code_test = "R103 020321 12h30 13h36 R212 020321 23h37 01h12 ";;