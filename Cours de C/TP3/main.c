#include <stdio.h>
#include "contact.h"
#include "maillon.h"
#include "hash.h"
#include "menu.h"
#include "fichier.h"
#include "node.h"


void printHelpArg(){
    printf("Error Appel Fonction\n");
        printf("Demander Aide\n");
        printf("  -->  ./hash -h\n");
}


void ajouterMain(int argc,char *argv[]){
    if (argc != 7){
        printHelpArg();
    }else{
        char * first_name = argv[3];
        char * name = argv[2];
        char * phone = argv[4];
        char * mail = argv[5];
        char * nm_fichier = argv[6];
        ajouterContactFichier(name,first_name,phone,mail,nm_fichier);
    }
}



void rechercherFichierMain(int argc,char *argv[]){
    if (argc != 5){
        printHelpArg();
    }else{
        char *option = argv[2];
        char *val = argv[3];
        char *nm_fichier = argv[4];
        rechercheINfichier(option,val,nm_fichier);
    }
}

void fusionnerFichierMain(int argc,char * argv[]){
    if (argc != 4){
        printHelpArg();
    }else{
         char *nm_fichier1 = argv[2];
        char *nm_fichier2 = argv[3];
        fusionnerFichier(nm_fichier1,nm_fichier2);
    }
}

void afficherFichierMain(int argc,char * argv[]){
    if(argc != 3){
        printHelpArg();
    }else{
        char *nm_fichier = argv[2];
        printf("%s",nm_fichier);
        // AfficherFichier(nm_fichier);
    }
}

void extraireFichierMain(int argc,char * argv[]){
    if (argc != 4){
        printHelpArg();
    }else{
        char *option= argv[2];
        char *nm_fichier = argv[3];
        extraireFichier(option,nm_fichier);
    }
}

void removeFichierMain(int argc,char *argv[]){
    if (argc !=4){
        printHelpArg();
    }else{
        char *val= argv[2];
        char *nm_fichier = argv[3];
        removeINfichier(val,nm_fichier);
    }
}

void triMain(int argc,char *argv[]){
    if(argc != 4){
        printHelpArg();
    }else{
        char *option = argv[2];
        char *nm_fichier = argv[3];
        printf("voici l'option : %s et le nm_fichier : %s\n",option,nm_fichier);
        triFichier(option,nm_fichier);
    }
}

void menuMain(int argc,char *argv[]){
    if(argc != 3){
        printHelp();
    }else{
        char *nm_fichier = argv[2];
        afficheMenuFichier(nm_fichier);
    }
}


int main(int argc, char *argv[]){
    char *fonctionnalite = argv[1];
    if(strcmp(fonctionnalite,"-a") == 0){
        ajouterMain(argc, argv);
    }else if(strcmp(fonctionnalite,"-r") == 0){
        rechercherFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-f")== 0){
       fusionnerFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-l")==0){
        printf("pq ça marche pas !! %d\n",argc);
        afficherFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite, "-e") == 0){
       extraireFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite, "-s") == 0){
        removeFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-h") == 0){
        affiche_aide();
    }else if(strcmp(fonctionnalite,"-t") == 0){
        triMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-i") ==0){
        menuMain(argc,argv);
    
    }else{
        printf("La fonctionnalité n'est pas disponible --> -h (help)");
    }

    // Contact *c =create("tesr","07","Gaborit","mail@mail.fr");
    // Contact *c2 =create("telio","07","Gaborit","mail@mail.fr");
    // Contact *c3 =create("vulian","07","Gaborit","mail@mail.fr");
    // // printContact(*c);
    
    // // add_node(c2,n);
    // // Node *n2  = tri_nodeContact(c3,n);
    // // print_node(n2);
    
    
    
    
}