open Fonctions
let charger_csv nom_fichier =
  let ic = open_in nom_fichier in
  let rec lire_lignes acc =
    try
      let ligne = input_line ic in
      (* Découpage par virgule *)
      let parties = String.split_on_char ',' ligne in
      let rec extraire_mots = function
        | [] | [_] -> Cliste_mot_vide
        | h :: t -> ClisteMot(h, extraire_mots t)
      in
      let signe = List.hd (List.rev parties) in
      let doc = Cdoc(extraire_mots parties, signe) in
      lire_lignes (CEnsDoc(doc, acc))
    with End_of_file ->
      close_in ic;
      acc
  in
  lire_lignes (creer_ensemble_doc ());;


(* Parcourt l'arbre pour classer un document *)
let rec classer_doc arbre document =
  match arbre with
  | Carbre_vide -> "Inconnu"
  | CFeuille s -> s
  | CArbre(mot, gauche, droite) ->
      if est_dans mot (get_liste_mot_doc document) then
        classer_doc gauche document
      else
        classer_doc droite document;;

(* Calcule le taux de réussite sur un ensemble de test *)
let tester_arbre arbre ens_test =
  let rec calculer ens corrects total =
    if ensemble_doc_vide ens then
      (corrects, total)
    else
      let doc = get_prem_doc ens in
      let prediction = classer_doc arbre doc in
      let reel = get_signe doc in
      if prediction = reel then
        calculer (get_reste_doc ens) (corrects + 1) (total + 1)
      else
        calculer (get_reste_doc ens) corrects (total + 1)
  in
  let (c, t) = calculer ens_test 0 0 in
  if t = 0 then 0.0 else (float_of_int c /. float_of_int t) *. 100.0;;

let execution_complete fichier_appr fichier_test =
  (* 1. CHARGEMENT DES FICHIERS *)
  print_endline "=== CHARGEMENT DES DONNÉES ===";
  let ens_appr = charger_csv fichier_appr in
  let ens_test = charger_csv fichier_test in
  
  (* 2. TEST DE L'ARBRE NON OPTIMISÉ *)
  print_endline "\n=== CONSTRUCTION : ARBRE NON OPTIMISÉ ===";
  let arbre_non_opt = recherche_non_optimise ens_appr in
  let precision_non_opt = tester_arbre arbre_non_opt ens_test in
  
  print_string "Précision du modèle NON optimisé : ";
  print_float precision_non_opt;
  print_endline "%";

  (* 3. TEST DE L'ARBRE OPTIMISÉ *)
  print_endline "\n=== CONSTRUCTION : ARBRE OPTIMISÉ (ENTROPIE) ===";
  let arbre_opt = recherche_optimise ens_appr in
  let precision_opt = tester_arbre arbre_opt ens_test in
  
  print_string "Précision du modèle OPTIMISÉ : ";
  print_float precision_opt;
  print_endline "%";
  
  (* 4. CONCLUSION GÉNÉRALE *)
  print_endline "\n=== CONCLUSION ===";
  if precision_opt >= 70.0 then
    print_endline "Le modèle optimisé est validé (>= 70%)"
  else
    print_endline "Le modèle optimisé est insuffisant (< 70%)";;
(* À la fin de test.ml *)
let () = 
  execution_complete "apprentissage.csv" "test.csv"