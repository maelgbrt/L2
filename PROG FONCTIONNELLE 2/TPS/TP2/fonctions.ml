

type liste_mot = ClisteMot of string * liste_mot | Cliste_mot_vide ;;

(* le document est composé d'une liste de mots et d'un signe (+ ou -)*)
type doc = Cdoc of liste_mot  * string | Cdoc_vide ;;

(* L'ensmeble de documents est une liste de documents. *) 
type ensemble_doc = CEnsDoc of doc * ensemble_doc | ClisteDeliste_vide ;;

type arbre = CArbre of string * arbre * arbre | CFeuille of string | Carbre_vide ;;

type feuille =  CFeuille of string | CFeuille_vide ;;




(* ============================== FONCTIONS DE CREATION ====================== *)

let cree_doc = function ()-> Cdoc_vide;;

let creer_liste_mot = function ()->  Cliste_mot_vide;;

let creer_ensemble_doc = function () -> ClisteDeliste_vide;;

let creer_arbre = function () -> Carbre_vide;;

let creer_feuille = function () -> CFeuille_vide ;;


(* ======================= FONCTIONS DE COMPARAISON VIDE ====================== *)

let doc_est_vide = function doc ->
  doc = cree_doc();;

let ensemble_doc_vide = function liste_doc -> 
  liste_doc = creer_ensemble_doc();;

let liste_mot_vide = function liste_mot ->
  liste_mot = creer_liste_mot();;

  
let arbre_vide = function arbre ->
  arbre = creer_arbre();;

(* ============================== LES FONCTIONS DE MANIPULATION ============================== *)


let get_prem =
  function ClisteMot(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste = function
| ClisteMot(_,n) -> n |
            _ -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_signe = function Cdoc(_,s) -> s |
            _ -> failwith "Signe non recup";;
            
let get_liste_mot_doc = function
|  Cdoc(n,_) -> n | _ -> failwith "Liste non recup du doc";;
                        
let get_prem_doc= function
|  CEnsDoc(n,_) -> n | _ -> failwith "DOc non trouvé";;

let get_reste_doc = function
| CEnsDoc(_,n) -> n | _ -> failwith "Liste suite doc non trouvé";;






(* ================================= LES FONCTIONS ================================= *)


let rec est_dans = function mot-> function liste->
  if liste_mot_vide liste then
    false
  else
    if get_prem liste = mot then
      true 
else 
  est_dans mot (get_reste liste) ;;





  let rec fusion = function l1 -> function l2 ->
  if liste_mot_vide l1 then
    l2
  else
    let premierTerme = get_prem l1 in
    if est_dans premierTerme l2 then
      fusion (get_reste l1) l2
    else
      ClisteMot(premierTerme,(fusion (get_reste l1) l2));;





let rec findlisteMots = function ensemble_doc ->
  if ensemble_doc_vide ensemble_doc then 
      creer_liste_mot()
  else
    let doc = get_prem_doc ensemble_doc in
    let listeDoc = get_liste_mot_doc doc in 
    fusion listeDoc (findlisteMots (get_reste_doc ensemble_doc));;

let rec est_homogene = function ensemble_doc ->
  if ensemble_doc_vide ensemble_doc then true
  else 
    let doc = get_prem_doc ensemble_doc in
    let reste = get_reste_doc ensemble_doc in
    if ensemble_doc_vide reste then true
    else
      (get_signe doc = get_signe (get_prem_doc reste)) && est_homogene reste;;



let rec doui = function ensemble_doc -> function mot ->
  if ensemble_doc_vide ensemble_doc then
    creer_ensemble_doc()
  else
    let doc = get_prem_doc ensemble_doc in
    if est_dans mot (get_liste_mot_doc doc) then
      CEnsDoc(doc,doui (get_reste_doc ensemble_doc) mot)
    else
      doui (get_reste_doc ensemble_doc) mot;;

let rec dnon = function ensemble_doc -> function mot ->
  if ensemble_doc_vide ensemble_doc then
    creer_ensemble_doc()
  else
    let doc = get_prem_doc ensemble_doc in
    if est_dans mot (get_liste_mot_doc doc) then
      dnon (get_reste_doc ensemble_doc) mot
    else
      CEnsDoc(doc,dnon (get_reste_doc ensemble_doc) mot);;




let rec recherche = function ensemble_doc -> function liste_mots -> 
  if ensemble_doc_vide ensemble_doc then
    Carbre_vide
  
  else if liste_mot_vide liste_mots then
   CFeuille (get_signe (get_prem_doc ensemble_doc))

  else
    let mot_pivot = get_prem liste_mots in
    let reste_mots = get_reste liste_mots in
    
    let docs_oui = doui ensemble_doc mot_pivot in
    let docs_non = dnon ensemble_doc mot_pivot in

    let fils_gauche = 
      if ensemble_doc_vide docs_oui then 
        Carbre_vide
      else if est_homogene docs_oui then
        CFeuille (get_signe (get_prem_doc docs_oui))
      else
        recherche docs_oui reste_mots
    in

    let fils_droit = 
      if ensemble_doc_vide docs_non then 
        Carbre_vide
      else if est_homogene docs_non then
        CFeuille (get_signe (get_prem_doc docs_non))
      else
        recherche docs_non reste_mots
    in

    CArbre(mot_pivot, fils_gauche, fils_droit);;




    let recherche_non_optimise = function ensemble_doc -> 
      let liste_mot = findlisteMots ensemble_doc in 
      recherche ensemble_doc liste_mot;;
(* 
    let rec get_pourcentage = function ensemble_doc -> *)





    let rec dsigne = function ensemble_doc -> function s ->
      if ensemble_doc_vide ensemble_doc then
        0
      else
        let doc = get_prem_doc ensemble_doc in
        let signe = get_signe doc in
        if signe = s then
          1 + dsigne (get_reste_doc ensemble_doc) s
        else
          dsigne (get_reste_doc ensemble_doc) s;;


  let dpos = function ensemble_doc ->
    dsigne ensemble_doc "+";;

  let dneg = function ensemble_doc ->
    dsigne ensemble_doc "-";;


let rec nb_doc = function ensemble_doc ->
      if ensemble_doc_vide ensemble_doc then 0
      else
        1 + nb_doc (get_reste_doc ensemble_doc);;


    let calculEntropie = function ensemble_doc ->
        let dpos = float_of_int (dpos ensemble_doc) and
        dneg = float_of_int (dneg ensemble_doc) and
        n = float_of_int (nb_doc ensemble_doc) in
        let log2 x = (log x) /. (log 2.0) in

        let calcul1 = (
          (-.dpos/.n)*.log2(dpos/.n)
        ) in

        let calcul2 = (
          (-.dneg/.n)*.log2(dneg/.n)
        )in 

      calcul1 +. calcul2 ;;




(* 
      let nb_plus = 
      if ensemble_doc_vide ensemble_doc then
        0
      else
      let doc = get_prem_doc ensemble_doc in
      let signe = get_signe doc in
        if signe = "+" then
          1 + get_pourcentage (get_reste_doc ensemble_doc)
        else
          get_pourcentage (get_reste_doc ensemble_doc);;
      
    let rec nb_doc = function ensemble_doc ->
      if ensemble_doc_vide ensemble_doc then 0
      else
        1 + nb_doc (get_reste_doc ensemble_doc);; *)
(* let creation_arbre = function ensemble_doc ->





  if ensemble_doc_vide ensemble_doc then
    
  else
  let arbre_droit = CArbre(le suivant,creer_arbre(),creer_arbre()) in
  let arbre_gauche = CArbre(le suivant,creer_arbre(),creer_arbre()) in
    CArbre(arbre_gauche,arbre_droit)

 *)









  (* non = dnon ensemble_doc (get_prem liste_mot_content) in *)
  (* CArbre(prem_terme,oui,non);; *)
  (* liste_mot_content;; *)

  (* oui;; *)



(* tri ensemble_doc (get_prem doc);; *)

(* ==================================== LES TESTS ============================== *)

(* let recherche_non_experimente = function
| ensemble_doc ->
  let liste_mot_content = findlisteMots ensemble_doc in *)
(* ========== CREATTON LISTES ================= *)
    let p1 = ClisteMot("bras",creer_liste_mot());;
    let p2 = ClisteMot("toto",p1);;
    let p3 = ClisteMot("chocolat",p2);;
    let p4 = ClisteMot("mange",p3);;


    let f1 = ClisteMot("toto",creer_liste_mot());;
    let f2 = ClisteMot("maitresse",f1);;
    let f3 = ClisteMot("école",f2);;

    let j1 = ClisteMot("maitresse",creer_liste_mot());;
    let j2 = ClisteMot("toto",j1);;
    let j3 = ClisteMot("chocolat",j2);;
    let j4 = ClisteMot("mange",j3);;

    let a1 = ClisteMot("mange",creer_liste_mot());;
    let a2 = ClisteMot("maitresse",a1);;
    
    let b1 = ClisteMot("maitresse",creer_liste_mot());;
    let b2  =ClisteMot("chocolat",b1);;
    let b3 = ClisteMot("toto",b2);;

    let v1 = ClisteMot("bras",creer_liste_mot());;
    let v2 = ClisteMot("maitresse",v1);;
    let v3 = ClisteMot("chocolat",v2);; 


(* ========== CREATION DE DOCS ================= *)

    let doc1 = Cdoc(p4,"+");;
    let doc2 = Cdoc(f3,"+");;
    let doc3 = Cdoc(j4,"+");; (*Pour le test de l'homogenéité*)

    let doc4 = Cdoc(a2,"-");;
    let doc5 = Cdoc(b3,"+");;
    let doc6 = Cdoc(v3,"-");;


(* ========== CREATTON D'UN ENSEMBLE DE DOCS'================= *)
    let ens1= CEnsDoc(doc6,creer_ensemble_doc());;
    let ens2 = CEnsDoc(doc5,ens1);;
    let ens3 = CEnsDoc(doc4,ens2);;
    let ens4 = CEnsDoc(doc3,ens3);;
    let ens5 = CEnsDoc(doc2,ens4);;
    let ens6 = CEnsDoc(doc1,ens5);;

  




    