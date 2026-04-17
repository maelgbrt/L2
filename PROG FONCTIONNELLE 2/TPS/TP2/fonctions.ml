

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



let cree_liste_vide = function () -> Cliste_vide ;;
let est_vide = function liste ->
 liste = cree_liste_vide() ;;


let rec est_dans = function mot-> function liste->
  if est_vide liste then
    false
  else if 
    get_prem liste == mot then
      true 
else 
  est_dans mot(get_reste liste) ;;


let findlisteMots = function ensemble_doc ->
  if ensemble_doc_vide ensemble_doc then 
      cree_liste_mot
  else
    let doc = get_prem_doc ensemble_doc in
    let listeDoc = get_liste_mot_doc doc in 
    
    fusion listeDoc (findlisteMots (get_reste_doc ensemble_doc))
  

    let p1 = ClisteMot("mael",cree_liste_vide());;
    let p2 = ClisteMot("matelian",p1);;
    let p3 = ClisteMot("moi",p2);;


let fusion = function l1 -> function l2 ->
  if list_mot_vide l1 then
    l2
  else
    let premierTerme = get_prem l1 in
    if est_dans l2 premierTerme then
      fusion (get_reste l1) l2
    else
      ClisteMot(premierTerme,(fusion (get_reste l1) l2));;
  
    