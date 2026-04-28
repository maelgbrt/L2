#ifndef HASH_H
#define HASH_H
#include "maillon.h"

typedef struct Annuaire_hashmap {
    Maillon **tab;
    int size;
} Annuaire_hashmap; // Le nom est ici, donc le typedef est complet

int hash(char *key, int size);
void init(Annuaire_hashmap *a, int size);
void print(Annuaire_hashmap a);

#endif