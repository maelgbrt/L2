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
    bool fin = false;
    char nom_fichier[50] = "tournoi.txt";
    int opt = getopt(argc,argv,"a:f:p"); // prend parametre quand appele le fichier ./tennis  ou ./tennis -p (arg ici est p) ou optarg prend ce qui y a apres -f "kfkgkf" (prend ce qui il ya entre guillements)
    do {
        switch (opt)
    {
    case 'f':
        strcpy(nom_fichier,optarg);
        ;
    case 'p':
        charger(&t,nom_fichier);
        afficher(t);
        liberer(&t);
    case 'a':
        charger(&t,nom_fichier)
        parser_match(&t,optarg);
        sauvegarder(t,nom_fichier);
        liberer(&t);
    case -1 : 
        fin = true;
    default:
        printf("pas reconnue..\n");
    }
}
while (!fin);
}



void parser_match(Tournois * t, char * resultat){
    char * nom1  = strtok(resultat,",");
    char * nom2  = strtok(NULL,",");
    char * temp  = strtok(NULL,",");
    int nb_set = atoi(temp); // change char en entier
    int score[nb_set][2];
    for (int i = 0; i < nb_set; i++)
    {
        char * set  = strtok(NULL,",");
        sscanf(set, "%d-%d",&score [i][0],&score[i][1]);// a apartir dune ch cara

    }
   ajouterMatch(t,nom1,nom2,score,nb_set); 
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
    FILE * fichier = fopen(nom_fichier,"w");
    if (fichier == NULL){
        perror("Error lors de l'ouverture");
        exit(EXIT_FAILURE);
    }
    Tournois pt_int = t;
    while (pt_int != NULL)
    {
        fprintf(fichier,"%s,%s,%d\n",
        pt_int -> info.nom1,
        pt_int -> info.nom2,
        pt_int -> info.nbSet);
        for (int i = 0; i < pt_int->info.nbSet; i++)
        {
            fprintf(fichier,"%d %d \n",
            pt_int->info.score[i][0],
            pt_int->info.score[i][i]);
        }
        pt_int = pt_int->suiv;
    }
    fclose(fichier);
}
//eopremet de deifnir que nom_fichier sera une adresse
void charger(Tournois *t,char * nom_fichier){
    FILE * fichier = fopen(nom_fichier,"r");
    if (fichier == NULL)
    {
        perror("Erreur lors de l'ouverture");
        exit(EXIT_FAILURE);
    }
    initialiserTournois(t);
    char nom1[100], nom2[100];
    int nb_set;
    int temp = fscanf(fichier,"%[^,],%[^,],%d\n",nom1,nom2,&nb_set);
    while (temp == 3 )
    {
        int score[nb_set][2];
        for (int i = 0; i < nb_set; i++)
        {
            fscanf(fichier,"%d,-%d\n",&score[i][0],&score[i][1]);
        }
        ajouterMatch(t,nom1,nom2,score,nb_set);
        temp = fscanf(fichier,"%[^,],%[^,],%d\n",nom1,nom2,&nb_set);

    }
    fclose(fichier);
    
}