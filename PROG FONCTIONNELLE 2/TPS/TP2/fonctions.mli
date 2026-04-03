type liste = Cliste of string * liste | Cliste_vide;;

type listeDeliste = ClisteDeliste of liste * liste | ClisteDeliste_vide ;;

val get_prem : liste -> string

val get_reste : liste -> liste

val liste_mot : liste -> liste -> liste

val est_dans : liste -> string -> bool

val get_dernier : liste -> string

val est_positif : listeDeliste -> bool