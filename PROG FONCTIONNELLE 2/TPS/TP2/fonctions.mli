(* type name = C of doc * string | &;; *)




(* =============================== LES TYPES ================================ *)

(* Liste de mot d'un document *)
type liste_mot = ClisteMot of string * liste_mot | Cliste_mot_vide ;;

(* le document est composé d'une liste de mots et d'un signe (+ ou -)*)
type doc = Cdoc of liste_mot  * string | Cdoc_vide ;;

(* L'ensmeble de documents est une liste de documents. *) 
type ensemble_doc = CEnsDoc of doc * ensemble_doc | ClisteDeliste_vide ;;

type arbre = CArbre of string * arbre * arbre | Carbre_vide ;;




(* ============================== FONCTIONS DE CREATION ====================== *)

(* Création d'une liste de mots *)
val creer_liste_mot : _

(* Création d'un document *)
val creer_doc : _

(* Création d'un ensemble de documents *)
val creer_ensemble_doc : _

val creer_arbre : _


(* ======================= FONCTIONS DE COMPARAISON VIDE ====================== *)

(* On vérifie si une liste de mots est vide *)
val liste_mot_vide : liste_mot -> bool

(* On vérifie si un document est vide *)
val doc_est_vide : doc -> bool

(* On vérifie si un ensemble de documents est vide *)
val ensemble_doc_vide : ensemble_doc -> bool

val arbre_vide : arbre -> bool






(* ============================== LES FONCTIONS DE MANIPULATION ============================== *)

(* On recupère le premier mot de la liste d'un document d'un document *)
val get_prem : liste_mot -> string

(* On recupère le reste des mots d'un document *)
val get_reste : liste_mot -> liste_mot

(* On recupère le signe d'un document *)
val get_signe : doc -> string

(* On recupère la liste des mots d'un document *)
val get_liste_mot_doc : doc -> liste_mot

(* On recupère le premier document d'un ensemble de documents *)
val get_prem_doc : ensemble_doc -> doc

(* On recupère le reste des documents d'un ensemble de documents *)
val get_reste_doc : ensemble_doc -> ensemble_doc


(* ================================= LES FONCTIONS ================================= *)

(* On vérifie si un mot est dans la liste des mots d'un document *)
val est_dans : liste_mot -> string -> bool

(* On verifie que la liste de documents est homogène *)
val est_homogene: ensemble_doc -> bool

(* On cherche une liste de mots dans l'ensemble de documents *)
val findlisteMots : ensemble_doc -> liste_mot

(* On fusionne deux ensembles de documents dans un même troisième*)
val fusion : ensemble_doc -> ensemble_doc -> ensemble_doc

(* On trie les documents d'un ensemble de documents en fonction d'un mot *)
val tri : ensemble_doc -> string -> ensemble_doc
