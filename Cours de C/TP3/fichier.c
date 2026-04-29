#include <stdio.h>
#include <stdlib.h>
#include "fichier.h"

void removeINfichier(char *option,char *val, char *nm_fichier)
{
    Annuaire_hashmap a;
    init(&a,100);
    importerAnnuaire(&a,nm_fichier);
    removeContact(&a,val,option[0]);
    exporterAnnuaire(&a,nm_fichier);
}


void printHelp(){
    printf("----------------HELP---------------\n");
    printf("afficjer healp");
}

void AfficherFichier(char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,100);
    importerAnnuaire(&a,nm_fichier);
    print(a);
}

void extraireFichier(char * option,char * nm_fichier){
    Annuaire_hashmap a;
    init(&a,100);
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