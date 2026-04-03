type tdate = Cdate of int * int * int
val cree_date : int -> int -> int -> tdate
val s_jour : tdate -> int
val s_mois : tdate -> int
val s_an : tdate -> int
val annee0 : tdate
val noel : tdate
val noel28 : tdate
val noel19 : tdate
val fin_fevbis : tdate
val fin_fev : tdate
val fin_mars : tdate
val fin_avril : tdate
val affiche_date : tdate -> unit
val est_avant : tdate -> tdate -> bool
val egal : tdate -> tdate -> bool
val est_apres : tdate -> tdate -> bool
val fin_annee : tdate -> bool
val mult : int -> int -> bool
val bissextile : int -> bool
val nb_jours_dans_mois : int -> int -> int
val fin_de_mois : tdate -> bool
val lendemain : tdate -> tdate
val hier : tdate -> tdate
val decale_date : (tdate -> tdate) -> (int -> int) -> tdate -> int -> tdate
val decale : tdate -> int -> tdate
type tEtudiant = Cetudiant of string * string * int * tdate * string
val etu_noel : tEtudiant
val etu_manu : tEtudiant
val etu_mars : tEtudiant
val dateNaissance : tEtudiant -> tdate
val test : bool
type tListesEleves = ClEleves of tEtudiant * tListesEleves | CLNotes_vide
val cree_liste_eleves_vide : unit -> tListesEleves
val add_eleve : tEtudiant -> tListesEleves -> tListesEleves
val est_vide : tListesEleves -> bool
val get_filiere : tEtudiant -> string
val get_prem : tListesEleves -> tEtudiant
val get_reste : tListesEleves -> tListesEleves
val maliste : tListesEleves
val malisteetu_test : tListesEleves
val maliste : tListesEleves
val getfiliere : tEtudiant -> string
val get_age : tEtudiant -> tdate
val compare : tEtudiant -> tEtudiant -> (tdate -> tdate -> bool) -> tEtudiant
val trv_eleve : tListesEleves -> (tdate -> tdate -> bool) -> tEtudiant
val plus_jeune : tListesEleves -> tEtudiant
val plus_age : tListesEleves -> tEtudiant
val set_liste : tListesEleves -> tEtudiant -> tListesEleves
val nv_date_detudiant : tEtudiant -> tdate -> tdate
val est_ds_7_jours : tEtudiant -> tdate -> bool
val liste_vide : tListesEleves
val anniv : tListesEleves -> tdate -> tListesEleves
val general :
  tListesEleves -> 'a -> (tEtudiant -> 'a -> bool) -> tListesEleves
val filtrer_eleves :
  tListesEleves -> 'a -> (tEtudiant -> 'a -> bool) -> tListesEleves
val cette_filière : tEtudiant -> string -> bool
val cette_annee : tEtudiant -> int -> bool
val anniv_version2 : tListesEleves -> tdate -> tListesEleves
val liste_annee : tListesEleves -> int -> tListesEleves
val liste_filiere : tListesEleves -> string -> tListesEleves
type tEtudiant_Nv =
    Cetudiant_Nv of string * string * int * tdate * string * 'a
