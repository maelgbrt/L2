
type tdomino
(** représente un domino *)
  
type tldom
(** représente une liste de dominos : mains des joueurs, chaine, pioche *)

(* *************************************** *)
(* Constructeurs et selecteurs		   *)
(* *************************************** *)

(* Pour le type tdomino *)
(* -------------------- *)
    
val cree_dom : int -> int -> tdomino
(** crée un domino à partir de 2 entiers *)
  
val s_cote1 : tdomino -> int
(** renvoie le côté gauche du domino *)
  
val s_cote2 : tdomino -> int
(** renvoie le côté droit du domino *)

(* Pour le type tldom : liste de dominos *)
(* ------------------------------------- *)
  
val ajouter_dom : tdomino -> tldom -> tldom
(** cree une liste de dominos à partir d'un domino et d'une liste existante *)
  
val cree_ldom_vide : unit -> tldom
(** cree une liste de dominos vide *)
  
val prem_dom : tldom -> tdomino
(** renvoie le premier domino d'une liste de dominos *)
  
val reste_dom : tldom -> tldom
(** renvoie la liste privée de son premier domino *)

(* *************************************** *)
(* Auxiliaires				   *)
(* *************************************** *)

val est_ldom_vide : tldom -> bool
(** teste si la liste de dominos passée en paramètre est vide *)

val un_seul_dom : tldom -> bool
(** teste si la liste de dominos passée en paramètre est réduite à un seul domino *)

(* *************************************** *)
(* Affichage				   *)
(* *************************************** *)

val affiche_dom : tdomino -> string
(** affichage d'un domino sous la forme [cote1|cote2] *)

val affiche_ldom : tldom -> string
(** affichage d'une liste de dominos *)

  


  
