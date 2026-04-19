#include <stdlib.h>
#include "stack.h"

void stack_init(Stack *p, int taille_initiale) {
    if (p != NULL) {
        p->NbElement = 0;
        p->capacite = taille_initiale;
        p->tabElement = malloc(taille_initiale * sizeof(coord));
        
        if (p->tabElement == NULL) {
            fprintf(stderr, "Erreur : échec de l'allocation mémoire\n");
            exit(EXIT_FAILURE);
        }
    }
}
bool stack_empty(Stack *p)
{
  bool res;
  if(p !=NULL){
    if(p->NbElement == 0){
      res = true;
    }else{
      res = false;
    }
  }
  printf("La liste est %s \n", res ? "vide" : "pas vide");
  return res;
}
Element stack_pop(Stack *p)
{

    if (p->NbElement > 0) {
        p->NbElement--;
        return p->tabElement[p->NbElement];
    }

    Element e_vide = {0}; 
    return e_vide; 
}

void stack_push(Stack *p, Element e)
{
  if (p->NbElement == p->capacite){
        p->capacite *= 2; 
        p->tabElement = realloc(p->tabElement, p->capacite * sizeof(coord));
        
        if (p->tabElement == NULL) {
            fprintf(stderr, "Erreur : impossible d'agrandir la pile\n");
            exit(EXIT_FAILURE);
        }
    }
    
    p->tabElement[p->NbElement] = e;
    p->NbElement++;
}

void stack_free(Stack *p) {
    if (p != NULL && p->tabElement != NULL) {
        free(p->tabElement);
        p->tabElement = NULL;
        p->NbElement = 0;
        p->capacite = 0;
    }
}










