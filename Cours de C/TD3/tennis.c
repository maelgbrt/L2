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

Match creerMatch(char *j1,char *j2,int sets[][2],int nbSet){
    Match res;
    res.nom1 = malloc(strlen(j1)+1);
    res.nom2 = malloc(strlen(j2)+1);
    strcpy(res.nom1,j1);
    strcpy(res.nom2,j2);

    res.score = malloc(nbSet*2*sizeof(int));
    for(int i = 0 ; i < nbSet ; i++){
        res.score[i][0] = sets[i][0];
        res.score[i][1] = sets[i][1];
    }
    res.nbSet = nbSet;
    return res;
}



void ajouterMatch(Tournois *t, char *j1,char *j2,int sets[][2],int nbSet)
{
struct match_tournois *temp = malloc(sizeof(struct match_tournois));
temp -> info = creerMatch(j1,j2,sets,nbSet);
temp -> suiv = *t;
*t = temp;
}

void liberer(Tournois *t)
{
    
    struct match_tournois * pt_int = *t;
    while (pt_int != NULL)
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

void sauvegarder(Tournois t, char * nom_fichier){
    fopen()
}