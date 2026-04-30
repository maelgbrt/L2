#include "fichier.h"

void removeINfichier(char *val, char *nm_fichier)
{
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    removeContact(&a,val,'n');
    exporterAnnuaire(&a,nm_fichier);
    vider_annuaire(&a);
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
    vider_annuaire(&a);
}

void ajouterContactFichier(char * name,char * first_name, char * phone, char * mail, char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    Contact *c = create(name,phone,first_name,mail);
    printContact(*c);
    add(&a,c);
    exporterAnnuaire(&a,nm_fichier);
    vider_annuaire(&a);
}    


//fusionne deux annuaire
void fusionnerFichier(char * nm_fichier1,char * nm_fichier2){
   
    Annuaire_hashmap a1;
    Annuaire_hashmap a2;
    init(&a2, HASH_TABLE);
    init(&a1, HASH_TABLE);
    importerAnnuaire(&a1,nm_fichier1);
    importerAnnuaire(&a2,nm_fichier2);
    fusionner(&a1,&a2);
    exporterAnnuaire(&a1,nm_fichier1);
    vider_annuaire(&a1);
    vider_annuaire(&a2);
}

//affiche donnes d'un fichier
void AfficherFichier(char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    print(a);
    vider_annuaire(&a);
}

//initialise un hash vide et recup donnee fichier 
void extraireFichier(char * option,char * nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    extraire(&a, option);
    vider_annuaire(&a);
}

//importe un fichier et tranforme un hashage
void importerAnnuaire(Annuaire_hashmap *a, char *nomFichier) {
    FILE *f = fopen(nomFichier, "r");
    if (f == NULL) return; 

    char ligne[256];
    while (fgets(ligne, sizeof(ligne), f)) {
        char name[50], first[50], phone[20], mail[50];
        
        if (sscanf(ligne, "%[^;];%[^;];%[^;];%s", name, first, phone, mail) == 4) {
            Contact *c = create(name, phone, first, mail);
            add(a, c);
            free(c);
        }
    }
    fclose(f);
}


//transforme un hash vide en fichier 
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


//menu help
void affiche_aide(){
    printf("-a : ajouter un contact\n");
    printf("-l : lister les contacts\n");
    printf("-h : afficher l’aide\n");
    printf("-r : rechercher un contact.\n");
    printf("-e [nptm] : extraire du fichier les noms, prénoms, numéros de téléphone, adresses mail.\n");
    printf("-s : supprimer un contact\n");
    printf("-f : fusionner deux fichiers\n");
}



//Permet d'importer un annuaire et de transformer son hashage en arbre node
void triFichier(char *option,char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    Node * n = NULL;
    n = triHash(&a,option,n);
    exporterNode(n,nm_fichier);
    vider_annuaire(&a);
    destroy_tree(n);
}

//exporte un arbre node en fichier
void exporterNode(Node * n,char *nm_fichier){
     FILE *f = fopen(nm_fichier, "w");

    if (f == NULL) {
        printf("Erreur : Impossible de créer le fichier %s\n",nm_fichier);
        return;
    }
    if(n!=NULL){
        printRecFichier(n,f);
    }
    fclose(f);
    printf("Tri exporté avec succès dans %s\n", nm_fichier);
}


//appel recursif pr ecrire sur le fichier (gauche -> centre -> droite )
void printRecFichier(Node *n, FILE *f) {
    if (n == NULL) {
        return; 
    }
    Contact c = n->contact;
    printRecFichier(n->left, f);
    fprintf(f, "%s;%s;%s;%s\n", c.name, c.first_name, c.phone, c.mail);
    printRecFichier(n->right, f);
}


//affiche le menu interractif -i
void afficheMenuFichier(char *nm_fichier){
    Annuaire_hashmap a;
    init(&a,HASH_TABLE);
    importerAnnuaire(&a,nm_fichier);
    menu(&a);
    vider_annuaire(&a);
}