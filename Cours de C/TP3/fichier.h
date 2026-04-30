#include "hash.h"
void removeINfichier(char *val, char *nm_fichier);
void exporterAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void importerAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void AfficherFichier(char *nm_fichier);
void extraireFichier(char *option,char *nm_fichier);
void printHelp();
void rechercheINfichier(char *option,char *val,char *nm_fichier);
void fusionnerFichier(char *nm_fichier1,char *nm_fichier2);
void ajouterContactFichier(char * name,char * first_name, char * phone, char * mail, char *nm_fichier);