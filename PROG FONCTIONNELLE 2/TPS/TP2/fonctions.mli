type name = C of doc * string | &;;

type doc = Cliste of string * doc| Cliste_vide;;


type EnsDoc = ClisteDeliste of liste * liste | ClisteDeliste_vide ;;

val get_prem : liste -> string

val get_reste : liste -> liste

val liste_mot : liste -> liste -> liste

val est_dans : liste -> string -> bool

val get_dernier : liste -> string

val est_positif : listeDeliste -> bool

COPET ROUS DROIT DOINEB TOUS DROI 1EER RON PO   MPONTE 2 ND ROND PONT A GAUCGE OUS DROI
ON VERRA