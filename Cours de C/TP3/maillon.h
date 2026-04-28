#ifndef MAILLON_H
#define MAILLON_H
#include "contact.h"
#include <stdlib.h> // Pour malloc
#include <string.h> // Pour strcmp

typedef struct Maillon Maillon;

struct Maillon {
    Contact contact;
    Maillon *next; 
};

Maillon *createMaillon(Contact *c);
void printMaillon(Maillon *m);
void insertMaillon(Maillon *m, Contact *c);
Maillon *findMaillon(Maillon *m, char *val);
void fusionnerMaillon(Maillon *m1, Maillon *m2);

#endif