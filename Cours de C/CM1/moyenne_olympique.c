#include <stdio.h>
float min_tab(float tab[],int taille);
float max_tab(float tab[],int taille);
void main(){
    
    float tab[3] = {2.5,6.2,1.8};
    float max = max_tab(tab,3);
    float min = min_tab(tab,3);

    printf("Le max est %f et le min est %f\n",max,min);

    affiche_moyenne_olympique(10);
}

float max_tab(float tab[],int taille){
    float res = tab[0];
    for(int i = 0;i < taille; i++){
        if (tab[i] > res )
        {
            res = tab[i];
        }
    }
    return res;
}

float min_tab(float tab[],int taille){
    float res =tab[0];
    for(int i = 0; i < taille; i++){
        if (tab[i] < res) 
        {
            res = tab[i];
        }
    }
    return res;
}


float somme_tab(float tab[],int taille)
{
    float rs = 0;
    for (int i = 0; i < taille, i ++ )
    {
        res += tab[i];
    }
    return res
}

void affiche_moyenne_olympique(int nb_note)
{
    float notes[nb_note],max,min,somme,notes;

    for (int i = 0; i < nb_note; i++)
    {
        printf("Note du juge n°%d\n",i+1);
        scanf("%f",&tab[i]);
    }
    
    max = max_tab(tab,nb_note);
    min = min_tab(tab,nb_note);
    somme = somme_tab(tab,nb_note);
    notes = (somme - min - max )/(nb_note-2);
    printf("Moyenne olympique %f",notes);
}