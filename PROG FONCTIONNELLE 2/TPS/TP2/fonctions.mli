
type liste = Cliste of string * liste | Cliste_vide;;

type listeDeliste = ClisteDeliste of liste * liste | ClisteDeliste_vide ;;

let get_prem =
  function Cliste(n, _) -> n |
                      _  -> failwith "get_prem : l'argument n'a pas la forme attendue" ;;

let get_reste =  function Cliste(_, reste) -> reste |
                      _  -> failwith "get_reste : l'argument n'a pas la forme attendue" ;;
