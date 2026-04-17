

type liste_mot = ClisteMot of string * liste_mot | Cliste_mot_vide ;;

(* le document est composé d'une liste de mots et d'un signe (+ ou -)*)
type doc = Cdoc of liste_mot  * string | Cdoc_vide ;;

(* L'ensmeble de documents est une liste de documents. *) 
type ensemble_doc = CEnsDoc of doc * ensemble_doc | ClisteDeliste_vide ;;




(* ============================== FONCTIONS DE CREATION ====================== *)

let cree_doc = function ()-> Cdoc_vide;;

let creer_liste_mot = function ()->  Cliste_mot_vide;;

let creer_ensemble_doc = function () -> ClisteDeliste_vide;;



(* ======================= FONCTIONS DE COMPARAISON VIDE ====================== *)

let doc_est_vide = function doc ->
  doc = cree_doc();;

let ensemble_doc_vide = function liste_doc -> 
  liste_doc = creer_ensemble_doc();;

let liste_mot_vide = function liste_mot ->
  liste_mot = creer_liste_mot();;

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
  est_dans mot(get_reste liste) ;;







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
    fusion listeDoc (findlisteMots (get_reste_doc ensemble_doc))
  





(* let rec est_homogene = function ensemble_doc ->
  if ensemble_doc_vide ensemble_doc then
    false
  else 
    let signe = get_signe(get_prem_doc ensemble_doc) in
  ;;  *)





(* ==================================== LES TESTS ============================== *)


(* ========== CREATTON LISTES ================= *)
    let p1 = ClisteMot("mael",creer_liste_mot());;
    let p2 = ClisteMot("matelian",p1);;
    let p3 = ClisteMot("moi",p2);;


    let f1 = ClisteMot("Citroen",creer_liste_mot());;
    let f2 = ClisteMot("matelian",f1);;
    let f3 = ClisteMot("Cargo",f2);;


(* ========== CREATION DE DOCS ================= *)

    let doc1 = Cdoc(p3,"+");;
    let doc2 = Cdoc(f3,"-");;


(* ========== CREATTON D'UN ENSEMBLE DE DOCS'================= *)
    let ens1= CEnsDoc(doc1,creer_ensemble_doc());;
    let ens2 = CEnsDoc(doc2,ens1);;























































