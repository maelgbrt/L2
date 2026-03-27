#include <stdio.h>
#include "menu.h"

void main()
{
    int choix;
    do
    {
        affiche_menu();
        scanf("%d",&choix);
        switch (choix)
        {
        case 1:

            demande_nom();
            break;

        case 2:

            calcul_somme();
            break;

        default:

            printf("Saluke !!!\n");
            break;
            
        }
    } while ( choix != 0 );
    
}

void affiche_menu()
{
    printf("1 - Nom Utilisateur\n");
    printf("2 - Somme de 2 flottants\n");
    printf("0 - Quitter\n");
}

void demande_nom()
{
    char nom[100];
    printf("What is your fucking name ?\n");
    scanf("%s",nom);// comme c un tableau c deja un pointeur
    printf("%s %s %s\n","Bienvenue",nom,"!");
}

void calcul_somme ()
{
    float a,b;
    printf("Entrez 2 float : ");
    scanf("%f %f",&a,&b);
    printf("La sommes est de %f\n",a+b);
}

