#include <stdio.h>
#include "cinema.h"
#include <stdbool.h>

void init_cinema(Cinema c, int nb_places[][2]){
    for(int i = 0 ; i < NB_SALLE ; i ++ ){
        init_salle(&c[i],i,nb_places[i]);
    }
}

void init_salle(Salle *s,int num, int nb_places[]){
    s->nb_rangees = nb_places[0];
    s->nb_cols = nb_places[1];
    for (int i =0 ; i < s->nb_rangees; i++){
        for(int j = 0 ; j < s->nb_cols ; j++){
            init_place(&(s->places[i][j]),num,i,j);
        }
    }
}

void init_place(Place *p, int num, int r, int c){
    p->numero = creer_numero(num,r,c);
    p->reserve = false;
    p->type = obtenir_type(r);
}

int creer_numero(int num, int r, int c){
    return num*NB_COL_MAX*NB_RANGEE_MAX + r * NB_COL_MAX+ c;
    //donnnee noramlement
}

TypePlace obtenir_type(int rangee){
    TypePlace res;
    switch(rangee){
        case 0 : res = VIP ; break;
        case 1 : 
        case 2 : res = Premium; break;
        default : res = Standard;
    }
    return res;
}

void afficher_cinema(Cinema c){
    for (int i = 0; i < NB_SALLE; i++)
    {
        afficher_salle(c[i]);
    }
}

void afficher_salle(Salle s)
{
    for (int i = 0; i < s.nb_rangees; i++)
    {
        printf("%d",i);
        for (int j = 0; i < s.nb_cols; j++)
        {
            afficher_place(s.places[i][j]);
        }
        printf("\n");
    }
    
}

void afficher_place (Place p){
    char c;
    switch (p.type)
    {
    case VIP: c = 'V' ; break;
    case Premium: c = 'P' ; break;
    case Standard: c = 'S' ; break;
    }
    printf("%d %c",p.numero,c);
}

void main(){
    Cinema cinema;
    int nb_place[][2] = {45,2}
}