#ifndef FICHIER_H
#define FICHIER_H

#include <stdio.h>
#include <stdlib.h>
#include "fichier.h"
#include "extraire.h"
#include "hash.h"
#include "node.h"
#include "contact.h"
#include "menu.h"

void affiche_aide();
void removeINfichier(char *val, char *nm_fichier);
void exporterAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void importerAnnuaire(Annuaire_hashmap *a, char *nomFichier);
void AfficherFichier(char *nm_fichier);
void extraireFichier(char *option,char *nm_fichier);
void printHelp();
void rechercheINfichier(char *option,char *val,char *nm_fichier);
void fusionnerFichier(char *nm_fichier1,char *nm_fichier2);
void ajouterContactFichier(char * name,char * first_name, char * phone, char * mail, char *nm_fichier);
void triFichier(char *option,char *nm_fichier);
void exporterNode(Node * n,char *nm_fichier);
void printRecFichier(Node *n,FILE *f);
void afficheMenuFichier(char *nm_fichier);
#endif