#include "annuaire.h"
#include <stdio.h>


void menu(Annuaire_hashmap *a)
{
    int nb;
    do
    {
        printf("\nQue voulez vous faire ?\n1 : Ajouter un contact \n2 : Afficher tous les contacts \n3 : Rechercher un contact\n4 : Extraire\n5 : Supprimer un contact \n6 : fusionner deux annuaires \n7 : Sortir\n");
        scanf("%d", &nb);
        switch (nb)
        {
        case 1:
            printf("Ajouter un contact\n");
            ajouterContact(a);
            break;
        case 2:
            printf("Afficher tous les contacts: \n");
            print(*a);
            break;
        case 3:
            printf("Rechercher un contact : \n");
            rechercheContact(a);
            break;
        case 4:
            printf("Extraire : \n");
            ExtraireInfos(a);
            break;
        case 5:
            printf("Supprimer un contact \n");
            SupprimerContact(a);
            break;

        case 6:
            printf("Fusionner deux annuaire \n");
            // (fusionnerAnnuairea);
            break;
        case 7:
            printf("Fin du Programme, Merci et à Bientôt !!\n");
        default:
            printf("Sortir\n");
        };

    } while (nb !=7);
}   

