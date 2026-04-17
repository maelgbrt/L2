

let get_prem =
  function ClisteMot(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste = function
| ClisteMot(_,n) -> n |
            _ -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;


let get_signe = function Cdoc(_,s) -> s |
            _ -> failwith "Signe non recup";;


let get_liste_mot_doc = function
| Cdoc(n,_) -> n | _ -> failwith "Liste de mot d'un doc non recup";;


val findlisteMots : ensemble_doc -> liste_mot



          