#include "annuaire.h"
#include <stdio.h>
#include <stdlib.h>

void affiche_aide(){
    printf("-a : ajouter un contact\n");
    printf("-l : lister les contacts\n");
    printf("-h : afficher l’aide\n");
    printf("-r : rechercher un contact.\n");
    printf("-e [nptm] : extraire du fichier les noms, prénoms, numéros de téléphone, adresses mail.\n");
    printf("-s : supprimer un contact\n");
    printf("-f : fusionner deux fichiers\n");
}