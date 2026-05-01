(* =============================== LES TYPES ================================ *)

(* Liste de mot d'un document *)
type liste_mot = ClisteMot of string * liste_mot | Cliste_mot_vide ;;

(* le document est composé d'une liste de mots et d'un signe (+ ou -)*)
type doc = Cdoc of liste_mot * string | Cdoc_vide ;;

(* L'ensmeble de documents est une liste de documents. *) 
type ensemble_doc = CEnsDoc of doc * ensemble_doc | ClisteDeliste_vide ;;

(* L'arbre de décision est composé d'un mot, d'un arbre pour les documents qui contiennent ce mot et d'un arbre pour les documents qui ne contiennent pas ce mot. *)
type arbre = CArbre of string * arbre * arbre | CFeuille of string | Carbre_vide ;;

(* La feuille de l'arbre de décision est composée d'un signe (+ ou -) *)
type feuille = CFeuille of string | CFeuille_vide ;;


(* ============================== FONCTIONS DE CREATION ====================== *)

(* Création d'un document *)
val cree_doc : unit -> doc

(* Création d'une liste de mots *)
val creer_liste_mot : unit -> liste_mot

(* Création d'un ensemble de documents *)
val creer_ensemble_doc : unit -> ensemble_doc

(* Création d'un arbre de décision *)
val creer_arbre : unit -> arbre

(* Création d'une feuille *)
val creer_feuille : unit -> feuille


(* ======================= FONCTIONS DE COMPARAISON VIDE ====================== *)

(* On vérifie si un document est vide *)
val doc_est_vide : doc -> bool

(* On vérifie si un ensemble de documents est vide *)
val ensemble_doc_vide : ensemble_doc -> bool

(* On vérifie si une liste de mots est vide *)
val liste_mot_vide : liste_mot -> bool

(* On vérifie si un arbre de décision est vide *)
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
val est_dans : string -> liste_mot -> bool

(* On fusionne deux ensembles de documents dans un même troisième*)
val fusion : liste_mot -> liste_mot -> liste_mot

(* On cherche une liste de mots dans l'ensemble de documents *)
val findlisteMots : ensemble_doc -> liste_mot

(* On verifie que la liste de documents est homogène *)
val est_homogene : ensemble_doc -> bool

(* On trie les documents d'un ensemble de documents en fonction d'un mot et d'un signe *)
val doui : ensemble_doc -> string -> ensemble_doc

(* On construit un arbre de décision à partir d'un ensemble de documents *)
val dnon : ensemble_doc -> string -> ensemble_doc

(* On construit un arbre de décision à partir d'un ensemble de documents *)
val recherche : ensemble_doc -> liste_mot -> arbre

(* On construit un arbre de décision à partir d'un ensemble de documents  en recuperant de maniere arbitraire *)
val recherche_non_optimise : ensemble_doc -> arbre


val dsigne : ensemble_doc -> string -> int
val dpos : ensemble_doc -> int
val dneg : ensemble_doc -> int
val nb_doc : ensemble_doc -> int
val entropie : ensemble_doc -> float

(* Fonctions utilitaires pour le gain *)
val calc : float -> float
val entropieACT : ensemble_doc -> string -> (ensemble_doc -> string -> ensemble_doc) -> float
val entropieAbsent : ensemble_doc -> string -> float
val entropiePresent : ensemble_doc -> string -> float

(* On calcule le gain d'un mot dans un ensemble de documents *)
val calculGain : ensemble_doc -> string -> float

(* On cherche le mot qui a le plus grand gain dans un ensemble de documents *)
val plusgrosgain : ensemble_doc -> liste_mot -> string

(* On retire un mot d'une liste de mots *)
val retirerMotListe : string -> liste_mot -> liste_mot

(* On recherche un arbre optimisé à partir d'un ensemble de documents *)
val recherche_opt : ensemble_doc -> liste_mot -> arbre

(* On recherche un arbre optimisé à partir d'un ensemble de documents *)
val recherche_optimise : ensemble_doc -> arbre