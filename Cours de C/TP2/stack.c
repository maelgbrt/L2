#include <stdlib.h>
#include "stack.h"

void stack_init(Stack *p)
{
  if (p != NULL){
    p->NbElement = 0;
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
  if ( p->NbElement < PILEMAX){
    p->tabElement[p->NbElement] = e;
    p->NbElement++;
  }
}


