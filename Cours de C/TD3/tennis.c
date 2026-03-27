#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tennis.h"

void main(){
    
    char *j1 = "Medvedev";
    char *j2 = "Alcaraz";
    char *j3 = "Noah";

    int resultats [][2] = {{6,3},{5,7},{6,4}};
    Tournois t;
    initialiser(&t);
    ajouterMatch(&t,j1,j2,resultats,3);
    ajouterMatch(&t,j1,j3,resultats,3);
    ajouterMatch(&t,j2,j3,resultats,3);
    afficher(t);
    liberer(&t);

}

void initialiser(Tournois *t)
{
    *t = NULL;
}

Match creerMatch()

Match ajouterMatch()

void liberer(Tournois *t)
{
    //code
    
    struct match_tournois * pt_int = *t;
    while (pt_int != null)
    {
        struct match_tournois * temp = pt_int -> suiv;
        free(pt_int -> info.score);
        free(pt_int -> info.nom1);
        free(pt_int -> info.nom2);
        free(pt_int);
        pt_int = temp ; 
    }
    
}

//faire afficher tournois