#ifndef __PILE_H__
#define __PILE_H__

#include <stdio.h>
#include <stdbool.h>
#include "coord.h"

#define PILEMAX 100

typedef coord Element;

// Structure d'un maillon de la pile
typedef struct _stack
{
  coord *tabElement;
  int NbElement;
  int capacite; 
} Stack;

/**
 * Configuration :
 *
 *   0                     n           PILEMAX-1
 *   |                     |             |
 *   V                     V             V
 *  ---------------------------------------
 *  |*|*|*|*|*|*|*|*|*|*|*| | | | | | | | |
 *  ---------------------------------------
 *
 */

void stack_init(Stack *p, int taille_initiale);
bool stack_empty(Stack *stack);

Element stack_pop(Stack *stack);

void stack_push(Stack *stack, Element e);
void stack_free(Stack *p);

#endif
