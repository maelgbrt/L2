#include <stdio.h>
#include "contact.h"
#include "maillon.h"
#include "hash.h"
#include "menu.h"
#include "fichier.h"
#include "node.h"


//retour help si nécessaire
void printHelpArg(){
    printf("Error Appel Fonction\n");
        printf("Demander Aide\n");
        printf("  -->  ./hash -h\n");
}

//peret d'ajouter un contact dans un fichie
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


//permet de rechercher dans un fichier
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


//permet de fusionner 2 fichier
void fusionnerFichierMain(int argc,char * argv[]){
    if (argc != 4){
        printHelpArg();
    }else{
         char *nm_fichier1 = argv[2];
        char *nm_fichier2 = argv[3];
        printf("%s %s\n",nm_fichier1,nm_fichier2);
        fusionnerFichier(nm_fichier1,nm_fichier2);
    }
}


//Permet d'afficher un fichier
void afficherFichierMain(int argc,char * argv[]){
    if(argc != 3){
        printHelpArg();
    }else{
        char *nm_fichier = argv[2];
        printf("%s",nm_fichier);
        AfficherFichier(nm_fichier);
    }
}


//permet d'extraire une donne dun fichier
void extraireFichierMain(int argc,char * argv[]){
    if (argc != 4){
        printHelpArg();
    }else{
        char *option= argv[2];
        char *nm_fichier = argv[3];
        extraireFichier(option,nm_fichier);
    }
}
//suprrime par donnes dans le fichier
void removeFichierMain(int argc,char *argv[]){
    if (argc !=4){
        printHelpArg();
    }else{
        char *val= argv[2];
        char *nm_fichier = argv[3];
        removeINfichier(val,nm_fichier);
    }
}


//trie par node le fichier selon option
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

//afiche menu interractif
void menuMain(int argc,char *argv[]){
    if(argc != 3){
        printHelpArg();
    }else{
        char *nm_fichier = argv[2];
        afficheMenuFichier(nm_fichier);
    }
}


//menu lien
int main(int argc, char *argv[]){
    char *fonctionnalite = argv[1];
    if(strcmp(fonctionnalite,"-a") == 0){
        ajouterMain(argc, argv);
    }else if(strcmp(fonctionnalite,"-r") == 0){
        rechercherFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-f")== 0){
       fusionnerFichierMain(argc,argv);
    }else if(strcmp(fonctionnalite,"-l")==0){
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

}