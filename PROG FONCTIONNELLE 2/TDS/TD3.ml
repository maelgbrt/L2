let est_feuille = function tarbre ->
    if est_vide tarbre then 
        false
    else
let fg = get_ssag tarbre and
let fd = get_ssad tarbre in
if est_vide fg and est_vide fd then
    true
else
    false



type tarbre = Carbre of string * tarbre | Carbre_vide;;
let creer_arbre_vide = function () ->
    CarbreVide;;

let creer_feuille = function ch ->
    Carbre(ch,creer_arbre_vide(),creer_arbre_vide());;

let  creer_arbre = function
| op ->
    function
    | arbre_fg ->
        function
        | arbre_fd ->
            Carbre(op,arbre_fg,arbre_fg);;

let trois = creer_feuille "3";;
let cinq = creer_feuille "5";;
let plus35 = creer_arbre "+" trois cinq;;
let quatre = creer_feuille "4";;
let fois35x4 = creer_arbre "*" plus35 quatre;;


let arbre_fg = function tarbre ->
    Carbre(_,g,_) -> g ;;
let arbre_fd = function tarbre ->
    Carbre(_,_,d) -> d ;;

let operator = function
| tarbre ->
    Carbre(op,_,_) -> op;;

let feuille_vide = function
|   feuille -> feuille = Carbre;;

let est_feuille = function
| arbre -> 
    let fg = arbre_fg arbre and
    let fd = arbre_fd arbre in
    
    feuille_vide fg && feuille_vide fd;;

let rec eval_artithm = function arbre ->
    if est_feuille arbre then
        arbre_nb arbre
else
    let fop = arbre_op arbre and
    let fg = arbre_fg arbre and
    let fd = arbre_fd arbre in
    fop(eval_artithm fg) (eval_artithm fd);:
    
    let arbre_nb = function Carbre(nb,_,_) -> int_of_string;;
