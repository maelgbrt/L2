#include "hash.h"
#include <stdio.h>
#include "maillon.h"


int hash(char *key, int size)
{
    int res = 0;
    int i = 0;
    while (key[i] != '\0')
    {
        res += key[i];
        i++;
    }
    return res % size; // correpond au modulo
}
#include <stdlib.h>
#include <stdio.h>

// Permet d'initialiser un annuaire vide
void init(Annuaire_hashmap *a, int size)
{
    a->tab = (Maillon **)malloc(size * sizeof(Maillon *));
    
    if (a->tab == NULL) {
        fprintf(stderr, "Erreur fatale : Impossible d'allouer la mémoire.\n");
        exit(EXIT_FAILURE); 
    }

    a->size = size;

    for (int i = 0; i < size; i++)
    {
        a->tab[i] = NULL;
    }
}

// Permet d'afficher les contacts d'un annuaire
void print(Annuaire_hashmap a)
{
    for (int i = 0; i < a.size; i++)
    {

        if (a.tab[i] != NULL)
        {
            printf("\n--- CATEGORIE %d ---\n", i);
            printMaillon(a.tab[i]);
            printf("--------------------------\n");
        }
    }
}


// Permet de fusionner deux annuaires
void fusionner(Annuaire_hashmap *a1, Annuaire_hashmap *a2)
{
    for (int i = 0; i < a2->size; i++)
    {
        if (i < a1->size)
        {
            if (a1->tab[i] == NULL)
            {
                a1->tab[i] = a2->tab[i];
            }
            else if (a2->tab[i] != NULL)
            {
                fusionnerMaillon(a1->tab[i], a2->tab[i]);
            }
        }
    }
}

// Permet de vider un annuaire
void vider_annuaire(Annuaire_hashmap *a) {
    for (int i = 0; i < a->size; i++) {
        Maillon *courant = a->tab[i];
        while (courant != NULL) {
            Maillon *temp = courant;
            courant = courant->next;
            free(temp);
        }
        a->tab[i] = NULL; 
    }
    free(a->tab);
}