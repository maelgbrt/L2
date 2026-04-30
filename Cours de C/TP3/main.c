#include <stdio.h>
#include "contact.h"
#include "maillon.h"
#include "hash.h"
#include "menu.h"
#include "fichier.h"


int main(int argc, char *argv[]){
    char *fonctionnalite = argv[1];
    printf("La focntionnalité est %s\n",fonctionnalite);
    // Annuaire_hashmap *a;    
    // init(&a,20);
    
    
    if(strcmp(fonctionnalite,"-a") == 0){
        printf("Vs avez choisi -a");

    }else if(strcmp(fonctionnalite,"-i") == 0){
        menuDef();
    }else if(strcmp(fonctionnalite,"-r") == 0){
        char *option = argv[2];
        char *val = argv[3];
        char *nm_fichier = argv[4];

        rechercheINfichier(option,val,nm_fichier);
    }else if(strcmp(fonctionnalite,"-f")== 0){
        char *nm_fichier1 = argv[2];
        char *nm_fichier2 = argv[3];
        fusionnerFichier(nm_fichier1,nm_fichier2);
    }else if(strcmp(fonctionnalite,"-l")==0){
        printf("oko\n");
        char *nm_fichier = argv[2];
        AfficherFichier(nm_fichier);
    }else if(strcmp(fonctionnalite, "-e") == 0){
        char *option= argv[2];
        char *nm_fichier = argv[3];
        printf("l'option est %s et nm_fichier est %s",option,nm_fichier);
        extraireFichier(option,nm_fichier);
    }else if(strcmp(fonctionnalite, "-s") == 0){
        char *option= argv[2];
        char *val= argv[3];
        char *nm_fichier = argv[4];
        printf("Voici loption %s et la valeur de l'option %s puis le nm fichier %s\n",option,val,nm_fichier);
        removeINfichier(option,val,nm_fichier);
    }else if(strcmp(fonctionnalite,"-h") == 0){
        printHelp();

    }else{
        printf("La focntionnalité n'est pas disponible --> -h (help)");
    }



    // menu(&a);
    }

    // argv[0] est toujours le nom du programme ("./hash")
//     printf("Nom du programme : %s\n", argv[0]);
//  Contact c = *create("mael", "07", "gaborit", "maelgaborit@gmail.com");
//     Contact c2 = *create("telio", "058", "gaborit", "teliogaborit@gmail.com");
//     Annuaire_hashmap a;
//     init(&a, 15);
//     add(&a, &c);
//     add(&a, &c2);
//     print(a);
//     Contact *c3 = findContact(&a, "telio", 'n');
//     if (c3 != NULL)
//     {
//         printContact(*c3);
//     }
    // printf("========test extraction ======");
    // extraire(&a,"nt");
    // menu(&a);

    // findContact(a.tab[10],"mael",'n');
    // Contact *res = findContact(&a[10],"mael","n");


    // Annuaire_hashmap *a;
//    int argc, char *argv[]
