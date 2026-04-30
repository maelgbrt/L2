#include "node.h"
#include <stdio.h>

Node * create_node(Contact c) {
    Node *new_node = malloc(sizeof(Node));  
    if (new_node != NULL) {
        new_node->contact = c;
        new_node->left = NULL;
        new_node->right = NULL;
    }
    return new_node;
}

Node * tri_nodeContact(Contact *c,Node *n){
    if (n!=NULL){
        if(strcmp(c->name,n->contact.name) > 0){
            printf("\n%s plus grand que %s\n",c->name,n->contact.name);
            n->right =tri_nodeContact(c,n->right);
        }else{
            printf("\n%s plus petit que %s\n",c->name,n->contact.name);
            n->left = tri_nodeContact(c,n->left);
        }
        return n;
    }else{
        printf("alala c vide\n");
        return create_node(*c);
    }
}


void print_node(Node *n){
    printContact(n->contact);
    
    if(n->left !=NULL){
        printf("\nBranche GAuche\n\n");
        print_node(n->left);
    }
    if (n->right != NULL){
        printf("\nBrache Droite \n\n");
        print_node(n->right);
    }
}



Node * triMaillon (Maillon *m,char *option,Node *n){
    while(m != NULL){
        n = tri_nodeContact(&(m->contact),n);
        m = m->next;
    }
    return n;
}

Node * triHash(Annuaire_hashmap *a,char * option,Node *n){
    for(int i = 0; i < a->size; i ++){
        n = triMaillon (a->tab[i],option,n);
    }
    return n;
}

// Node tri_general()
// Node * n = NULL;
//     Annuaire_hashmap a;
//     init(&a,HASH_TABLE);
//     importerAnnuaire(&a,"test_annuaire_menu");
//     n = triHash(&a,"mael",n);
//     print_node(n);