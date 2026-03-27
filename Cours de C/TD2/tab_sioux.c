#include <stdio.h>
#include "tab_sioux.h"


void main(void){
    
}

int size_tab_sioux(tab_sioux t){
    return t.size;
}

void print_tab_sioux(tab_sioux t){
    for(int i; i < t.size; i++){
        printf("La valeur est %d ", t.tab[i]);
    }

}

int remove_tab_sioux(tab_sioux *t){
    if (t->size > 0)
    {
        int taille = t->size;
        t->size--;
    }
    
}


void add_tab_sioux(tab_sioux *t,int x){
    if(t->size < SIZE_MAX);
    t->tab[t->size] = x;
    t->size++;
}