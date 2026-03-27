let prem_car = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;
let est_vide = function mot -> (mot = "") ;;
let est_voyelle = function caract -> ((caract = "a") || (caract = "e") || (caract = "i") || (caract = "o") || (caract = "u") || (caract = "y"));;
let est_ponctuation = function caract -> ((caract = ",") || (caract = "'") || (caract = ";") || (caract = ":") || (caract = "!") || (caract = "?") || (caract = ".")|| (caract = " "));;
let caractere_min =function char-> String.lowercase_ascii char;;

let derniere_lettre = function ch -> 
  String.sub ch ((String.length ch) - 1) 1;;
let reste_mot_milieu mot =
  let n = String.length mot in
  if n <= 2 then
    ""
  else
    String.sub mot 1 (n - 2)
;;
(*TES*)

let rec nb_voyelle = function ch ->
if est_vide ch then 0 
else
	if est_voyelle (prem_car ch) then
		1 + nb_voyelle (reste_mot ch)
	else
		nb_voyelle (reste_mot ch);;
	
		
let m_nb_voyelles = function ch1 -> function ch2 ->
if nb_voyelle ch1 = nb_voyelle ch2 then true
else false;;


let mult2 = function nmbre->
nmbre * 2;;

let div2 = function nmbre ->
nmbre / 2;;

let rec mult_egyptien = function x -> function y ->
if x = 1 then y
else
	if x mod 2 = 0 then
	mult_egyptien (div2 x) (mult2 y)
	else
	mult_egyptien (x-1) y + y ;;

	let rec compte_lettres = function phrase -> function lettre ->
	if est_vide phrase then
		0
	else
	if prem_car phrase = lettre then
		1 + compte_lettres (reste_mot phrase) lettre
	else
		compte_lettres (reste_mot phrase) lettre;;


		let rec supprime_voyelles = function phrase ->
if est_vide phrase then
""
else
	if est_voyelle (prem_car phrase) then
		supprime_voyelles (reste_mot phrase)
	else
		prem_car phrase ^ supprime_voyelles (reste_mot phrase);;



(*Question 6 TDs3&4*)
let rec palindrome mot =
  if est_vide mot || est_vide (reste_mot_milieu mot) then
    true
  else if prem_car mot = derniere_lettre mot then
    palindrome (reste_mot_milieu mot)
  else
    false
;;


(*retire la ponctuation et les majuscules*)
let rec mise_en_ligne = function phrase ->
	if est_vide phrase then
		""
	else
		if est_ponctuation(prem_car phrase)then
			mise_en_ligne(reste_mot phrase)
		else
			caractere_min(prem_car phrase) ^ mise_en_ligne (reste_mot phrase);;

let rec palindrome_phrase = function phrase ->
	let nv_phrase = mise_en_ligne phrase in
	palindrome nv_phrase;;
 

	(*Question 7 TDs3&4*)
let rec compte_mot = function phrase ->
	if est_vide phrase || est_vide (reste_mot phrase) then
		1 (*on met 1 car on considere que la pharse ne commence pas par un espace mais par un mot*)
	else
	let char = prem_car phrase in
if char = " " then
		 1 + compte_mot(reste_mot phrase)
else
	compte_mot(reste_mot phrase);;
	
	
	(*Question 8 TDs3&4*)

let rec motCache = function phrase -> function mot ->
	if est_vide phrase  then
		false
	else
		if est_vide mot then
			true
		else
		let phrase_maj = mise_en_ligne phrase in
		if prem_car phrase_maj = prem_car mot then
			motCache (reste_mot phrase_maj) (reste_mot mot)
		else
			motCache (reste_mot phrase_maj) mot



	(* -----------------------------------------------TD 5 & 6----------------------------------------- *)



	let rec puissance = function nb -> function la_puissance ->
		if la_puissance = 0 then 1
		else
		nb * puissance nb (la_puissance - 1);;


	let rec puissance_acc = function nb -> function la_puissance ->
		if la_puissance = 0 then 1
		else
			if la_puissance mod 2 = 0 then
				puissance_acc (puissance nb 2) (la_puissance / 2)
			else
				nb* puissance_acc nb (la_puissance-1);;

	
	

		(* Question 3.2 Exercice donné en examen *)
	



		(* 1. *)
		let est_pair = function entier ->
			if entier mod 2 = 0 then
				true
			else
				false;;
			

	let rec somme_mult2 = function n ->
		if n = 0 then 0
		else
			if est_pair n then
				n + somme_mult2 (n-1)
			else
				somme_mult2 (n-1);;

	(* 2. *)
	
		let est_mult3 = function entier ->
			if entier mod 3 = 0 then
				true
			else
				false;;
			

	let rec somme_mult3 = function n ->
		if n = 0 then 0
		else
			if est_mult3 n then
				n + somme_mult3 (n-1)
			else
				somme_mult3 (n-1);;



(* 3. *)

let est_un_diviseur = function n -> function diviseur ->
	if n mod diviseur = 0 then
		true
	else
		false;;


let somme_diviseurs =
  function nb ->
    let rec somme_div =
      function nb ->
        function div ->
          
          if div > nb / 2
                          (* cas de base *)
                          (* au maximum, un diviseur de nb peut être égal à nb / 2 *)
                          (* Il ne peut en aucun cas être plus grand. *)
                          (* La somme est donc nulle dans ce cas puisqu'il n'existe
                             aucun diviseur plus grand*)
          then
            0
          else
            if (est_mult div nb) (* si nb est multiple de div *)
            then
              (* on a trouvé un diviseur de nb - c'est div - on l'ajoute au résultat *)
              div + (somme_div nb (div + 1))
            else
              (* div n'est pas un diviseur de nb *)
              (* le res = la somme à partir de div+1 *)
              (somme_div nb (div + 1))
    in
    (* on fait la somme des diviseurs de nb à partir de 1 *)
    somme_div nb 1;;

let est_parfaits = function n ->
	somme_div n (n) = n ;;



(* 4. *)


let est_un_diviseur_28 = est_un_diviseur 28;;
let rec somme_n_nbs  = function n -> function operande ->	
		if n = 0 then 0
		else
			if operande n then
				n + somme_n_nbs (n-1) operande
			else
				somme_n_nbs (n-1) operande;;
