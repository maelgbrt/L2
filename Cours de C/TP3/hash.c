#include "annuaire.h"


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

void init(Annuaire_hashmap *a, int size)
{
    a->tab = (Maillon **)malloc(size * sizeof(Maillon *));
    a->size = size;
    for (int i = 0; i < size; i++)
    {
        a->tab[i] = NULL;
    }
}
