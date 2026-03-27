# Travail du 25 Mars 2026

### Auteur
#### Maël Gaborit


## Fin de l'exercice sur les dates


```ocaml
let rec decale = function date -> function nb_jour -> function deplace_date -> function iter ->
if nb_jour = 0
   then date
else
  decale (deplace_date date) (iter nb_jour) deplace_date iter;;

```

## Travail sur les nombres complexes

```ocaml


type complexe = C_complexe of float * float;;

let creer_complexe = function pReel -> function pImg -> C_complexe(pReel,pImg);;

let pReel = function C_complexe(pReel,_) -> pReel;;

let pImg = function C_complexe(_,pImg) -> pImg;;

(*complexe -> complexe -> complexe*)
let ajoute_imag = function z1 -> function z2 -> 
  let pReelz1 = pReel z1 and
  let pReelz2 = pReel z2 and
  let pImgz1 = pImg z1 and
  let pImgz2 = pImg z2 in

  let resReel = pReelz1 +. pReelz2 and
  let resImg = pImgz1 +. pImgz2 in

  creer_complexe resReel resImg;;

(*complexe -> complexe -> complexe*)
let mult_imag = function z1 -> function z2->

  let x1 = pReel z1 and
  let y1 = pImg z1 and
  let x2 = pReel z2 and
  let y2 = PImg z2 in
  let resReel = (x1*.x2)-.(y1*.y2) and
  let resImg = (x1*.y2)+.(x2*.y1) in

  creer_complexe resReel resImg;;



```

