#include "hash.h"
void removeINfichier(char *option,char *val, char *nm_fichier);
void exporterAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void importerAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void AfficherFichier(char *nm_fichier);
void extraireFichier(option,nm_fichier);
void printHelp();
void rechercheINfichier(option,val,nm_fichier);
void fusionnerFichier(nm_fichier1,nm_fichier2);