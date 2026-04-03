(* Exos 3  *)



type couleur = Pique | Coeur | Trefle | Carreau ;;

type valeur = As | V7 | V8 | V9 | V10 | Valet | Dame | Roi ;;
th
type tcarte = Ccarte of valeur * couleur ;; 

type lcarte = Cliste of tcarte * lcarte | Clcartevide  ;;



(* let couleur_carte = function tcarte -> *) 


let rec pt_carte = function c -> function atout ->
    let cc = couleur_carte c in
    if est_as c then
        11
    else if est_roi c then
        4
    ekse if est_valet c then
        if cc = atout then 20
        else 2;;


arbre 


















let rec pts_tour_jeu = function lcarte -> function atout ->
    if est_vide lcarte then 0
    else
        let pc = jeu_p lcarte and 
        c_c = jeu_r lcarte in
        pt_carte pc atout + pts_tour_jeu r_c atout;;
