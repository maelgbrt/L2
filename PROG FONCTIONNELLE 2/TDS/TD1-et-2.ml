



type rat = Crat of int * int ;;

let creer_rat = function num -> function den -> 
  if den = 0 then
    failwith "yes"
  else
    Crat(num,den);;

let numer = function Crat(n,_) -> n;;
let denom = function Crat(_,d) -> d;;


let print_rat = function rat ->
    let num = numer rat
    and denum = denom rat in
    "( " ^ string_of_int(num) ^ " , " ^ string_of_int(denum) ^ " )";;



let mult_rat r1 r2 =
  creer_rat (numer r1 * numer r2) (denom r1 * denom r2);;
    let inverse_rat = function rat ->
    let num = denom rat
    and denum = numer rat in
    creer_rat num denum;;


let div_rat = function rat1 -> function rat2 ->
    let inverse_rat2 = inverse_rat rat2 in
    mult_rat inverse_rat2 rat1


      let rec pgcd = function a -> function b ->
        if b = 0 then
            a
        else
          pgcd b (a mod b);;

    let reduce = function rat -> 
      let n = numer rat and d = denom rat in
      let p = pgcd n d in
      Crat((n/p),(d/p));;


    let egal_rat = function rat1 -> function rat2 ->
    let rr1 = reduce rat1
    and rr2 = reduce rat2 in
    numer rr1 = numer rr2 && denom rr1 = denom rr2;;

let plus_rat = function r1 -> function r2 -> 
    let a = numer r1
    and b = denom r1
    and c = numer r2
    and d = denom r2 in

    let num = ( a * d ) + ( b * c )
    and denum = b * d in
    creer_rat num denum ;;
    

    let moins_rat = function r1 -> function r2 -> 
    let a = numer r1
    and b = denom r1
    and c = numer r2
    and d = denom r2 in

    let num = ( a * d ) + ( b * c )
    and denum = b * d in
    creer_rat num denum ;;


    


    
  (**
  
  --------------1.3------------------
  let un_demi = creer_rat 1 2 ;;
   -> 1
  
  let deux_tiers = creer_rat 2 3 ;;
   -> 1;;

  inverse deux_tiers;;
   -> <rat>

  mult_rat un_demi deux_tiers;;
   -> 1;;

  egal_rat(mult_rat un_demi deux_tiers)(creer_rat 1 3);;
   ->

    *)