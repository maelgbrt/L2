#include <stdio.h>
#include <stdlib.h>
#include "fichier.h"

void removeINfichier(char *val, char *nm_fichier)
{
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    removeContact(&a,val,'n');
    exporterAnnuaire(&a,nm_fichier);
}


void rechercheINfichier(char * option,char * val, char *nm_fichier){
    printf("On va remove le fichier %s , l'option est %s et la val est %s",nm_fichier,nm_fichier,option);
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    Contact * c = findContact(&a, val, option[0]);
    if(c != NULL){
        printContact(*c);    
    }else{
        printf("Il n'y a pas ce compte");
    }
}

void ajouterContactFichier(char * name,char * first_name, char * phone, char * mail, char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    Contact *c = create(name,phone,first_name,mail);
    printContact(*c);
    add(&a,c);
    exporterAnnuaire(&a,nm_fichier);
}    



void fusionnerFichier(char * nm_fichier1,char * nm_fichier2){
    Annuaire_hashmap a1;
    Annuaire_hashmap a2;
    importerAnnuaire(&a1,nm_fichier1);
    importerAnnuaire(&a2,nm_fichier2);
    fusionner(&a1,&a2);
    exporterAnnuaire(&a1,nm_fichier1);
}
void printHelp(){
    printf("----------------HELP---------------\n");
    printf("afficjer healp");
}

void AfficherFichier(char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    print(a);
}

void extraireFichier(char * option,char * nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    extraire(&a, option);
}


void importerAnnuaire(Annuaire_hashmap *a, char *nomFichier) {
    FILE *f = fopen(nomFichier, "r");
    if (f == NULL) return; 

    char ligne[256];
    while (fgets(ligne, sizeof(ligne), f)) {
        char name[50], first[50], phone[20], mail[50];
        
        if (sscanf(ligne, "%[^;];%[^;];%[^;];%s", name, first, phone, mail) == 4) {
            Contact *c = create(name, phone, first, mail);
            add(a, c);
        }
    }
    fclose(f);
}

void exporterAnnuaire(Annuaire_hashmap *a, char *nomFichier) {
    FILE *f = fopen(nomFichier, "w");

    if (f == NULL) {
        printf("Erreur : Impossible de créer le fichier %s\n", nomFichier);
        return;
    }

    for (int i = 0; i < a->size; i++) {
        Maillon *courant = a->tab[i];
        
        while (courant != NULL) {
            Contact c = courant->contact;
            fprintf(f, "%s;%s;%s;%s\n", c.name, c.first_name, c.phone, c.mail);
            courant = courant->next;
        }
    }

    fclose(f);
    printf("Annuaire exporté avec succès dans %s\n", nomFichier);
}

void affiche_aide(){
    printf("-a : ajouter un contact\n");
    printf("-l : lister les contacts\n");
    printf("-h : afficher l’aide\n");
    printf("-r : rechercher un contact.\n");
    printf("-e [nptm] : extraire du fichier les noms, prénoms, numéros de téléphone, adresses mail.\n");
    printf("-s : supprimer un contact\n");
    printf("-f : fusionner deux fichiers\n");
}