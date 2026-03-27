#include <stdio.h>
#include <string.h>

typedef struct
{
    char nom[50];
    int age;
    double salaire;
} Employe;

void augmentation(Employe *employe){
    //au lieu de (*employe).nanana on fait struct->champ
    employe->salaire = employe->salaire * 1.5;
    printf("Employe, nouveau salaire %.2f €\n" , employe->salaire);
}

void main(void){
    Employe JD;
    strcpy(JD.nom, "John Doe");
    JD.age = 42;
    JD.salaire = 800;
    printf("Le salaire avant augmentation: %.2f €\n", JD.salaire);
    augmentation(&JD);
    printf("Le salaire apres augmentation: %.2f €\n", JD.salaire);
}