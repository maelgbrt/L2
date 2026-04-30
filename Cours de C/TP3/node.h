#ifndef NODE_H
#define NODE_H
#include "contact.h"
#include "maillon.h"
#include "hash.h"

typedef struct node {
    Contact contact;
    struct node *left;
    struct node *right;    
}Node;

// #ifndef HASH_H
// #define HASH_H
// #include "maillon.h"
// #define HASH_TABLE 100

Node *create_node(Contact c);
Node * tri_nodeContact(Contact *c,Node *n);
// void tri_nodeMaillonName(Maillon *m,Node *n);
void add_node(Contact *c, Node *n);
void print_node(Node *n);
Node * triHash(Annuaire_hashmap *a,char * option,Node *n);
Node * triMaillon (Maillon *m,char *option,Node *n);

#endif