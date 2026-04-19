#include <stdlib.h>
#include "stack.h"


void stack_init(Stack *p) {
    p->top = NULL;
    p->NbElement = 0;
}

bool stack_empty(Stack *p)
{
    if (p == NULL) return true;
    return (p->top == NULL);
}


void stack_push(Stack *p, Element e) {
    maillon *nouveau = malloc(sizeof(maillon));
    if (nouveau == NULL) {
        fprintf(stderr, "Erreur : plus de mémoire RAM\n");
        exit(EXIT_FAILURE);
    }

    nouveau->data = e;


    nouveau->next = p->top;

    p->top = nouveau;
    p->NbElement++;
}


Element stack_pop(Stack *p) {
    if (p->top == NULL) {
        Element e_vide = {0}; 
        return e_vide;
    }

    maillon *temp = p->top;

    Element e = temp->data;

    p->top = p->top->next;
    p->NbElement--;

    free(temp);

    return e;
}


void stack_free(Stack *p) {
    if (p == NULL) return;

    maillon *courant = p->top;
    maillon *suivant;

    while (courant != NULL) {
        suivant = courant->next; 
        free(courant);           
        courant = suivant;      
    }

    p->top = NULL;    
    p->NbElement = 0;
}



