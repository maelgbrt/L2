(* Annales 2025 *)

let est_vide = function mot -> (mot = "") ;;
let prem_lettre = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;



let rec somme = function vect_mob_douce ->
    if est_vide vect_mob_douce then
        0
    else
        if prem_lettre vect_mob_douce = "0" then
            somme(reste_mot vect_mob_douce)
        else
            1 + somme(reste_mot vect_mob_douce);;

let est_eligible = function car ->
    car = "V" || car = "C" || car = "c" || car = "E";;

let rec vecteur_mobilite_douce = function vect_deplac ->
    if est_vide vect_deplac then
        ""
    else
        if est_eligible (prem_lettre vect_deplac) then
            "1" ^ vecteur_mobilite_douce( reste_mot vect_deplac)
        else
            "0" ^vecteur_mobilite_douce (reste_mot vect_deplac);;


let calculer_primeV0 = function vect_deplac ->
    let vect_mob_douce = vecteur_mobilite_douce vect_deplac in
    let somme_total = somme vect_mob_douce in
    somme_total ;;

(* PARTIE 2 *)

(* La fonction combine *)

(* 2.1.1 Elle renvoie un sring-> on le determine par la présence du symbole '^' *)

(* 2.1.2  On pourrait avoir a la palce de f uen focntion est egale ou n'est pas egale ou est meme type*)

(* 2.2.2 Cette focntion est une focntion général, elle prend une fonction f et l'applique au 2 premuer charactere de ch1 et ch2 *)


let et_logique = function c1 -> function c2 ->
    if c2  = "1" then
        "0"
    else
        c1;;

let rec combine = function f -> function ch1 -> function ch2->
    if est_vide ch1 || est_vide ch2 then ""
    else
        let c = f(prem_lettre ch1) (prem_lettre ch2) in
        c^combine f(reste_mot ch1)(reste_mot ch2);;

let corriger_vecteur = combine et_logique;;


let rec vecteur_mobilite = function vect_deplac -> function generalise ->
    if est_vide vect_deplac then
        ""
    else
        if generalise (prem_lettre vect_deplac) then
            "1" ^ vecteur_mobilite( reste_mot vect_deplac) generalise
        else
            "0" ^vecteur_mobilite (reste_mot vect_deplac) generalise;;



let calculer_primeV0bis  = function vect_deplac -> function generalise ->
    let vect_mob = vecteur_mobilite vect_deplac generalise in
    let somme_total = somme vect_mob in
    somme_total ;;



let calculer_primeV1 = function vect_deplac -> function vect_ferm ->  function vect_conge ->
    let correc1 = corriger_vecteur vect_deplac vect_ferm in 
    (* on corrige une premeir fois avec jour ferme *)
    let correc2 = corriger_vecteur correc1 vect_conge in
    (* on ocrrige une secodne fois avec conge *)
     calculer_primeV0 correc2;;



let calculer_primeV3 = function vect_deplac -> function vect_ferm -> function vect_conge -> function generalise ->
    let correc1 = corriger_vecteur vect_deplac vect_ferm in 
    let correc2 = corriger_vecteur correc1 vect_conge in
    calculer_primeV0bis correc2 generalise;;



let rec vecteur_mobilite = function vect_deplac -> function generalise ->
    if est_vide vect_deplac then
        ""
    else
        if generalise (prem_lettre vect_deplac) then
            "1" ^ vecteur_mobilite( reste_mot vect_deplac) generalise
        else
            "0" ^vecteur_mobilite (reste_mot vect_deplac) generalise;;



let calculer_primeV0bis  = function vect_deplac -> function generalise ->
    let vect_mob = vecteur_mobilite vect_deplac generalise in
    let somme_total = somme vect_mob in
    somme_total ;;



let est_active = function car ->
    car = "P" || car = "V";;

let part_mobilite_active = function vect_deplac -> function vect_ferm -> function vect_conge ->
    let prime = calculer_primeV1 vect_deplac vect_ferm vect_conge in
    let prime_active = calculer_primeV3 vect_deplac vect_ferm vect_conge est_active in
    let pourcentage = float_of_int(prime_active) /. float_of_int(prime) in
    pourcentage*.100.;;



let part_mob_generalise = function vect_deplac -> function vect_ferm -> function vect_conge -> function generalise ->
    let prime_total = calculer_primeV1 vect_deplac  vect_ferm vect_conge in
    let prime_generalise = calculer_primeV3 vect_deplac vect_ferm vect_conge generalise in
    let pourcentage = float_of_int(prime_generalise) /. float_of_int(prime_total) in
    pourcentage*.100.;;



    (* Exercice 2 Où l'on joue avec les mots *)

 let rec est_sous_sqc = function ch1 -> function sous_seq ->
    if est_vide ch1 || est_vide sous_seq then 
        if est_vide sous_seq then
            true
        else
            false
    else

        if prem_lettre sous_seq = prem_lettre ch1 then
            est_sous_sqc (reste_mot ch1) (reste_mot sous_seq)
        else
            est_sous_sqc (reste_mot ch1) sous_seq;;



let verif_sseq_commune = function ch1 -> function ch2 -> function sous_seq ->
    let bool1 = est_sous_sqc ch1 sous_seq in
    let bool2 = est_sous_sqc ch2 sous_seq in
    bool1 && bool2;;
    


