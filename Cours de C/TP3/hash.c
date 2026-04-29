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