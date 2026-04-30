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



Node * tri_nodeContact(Contact *c, Node *n, char *option) {
    if (n == NULL) {
        return create_node(*c);
    }

    int cmp = 0;

    if (strcmp(option, "m") == 0) {
        cmp = strcmp(c->mail, n->contact.mail);
        printf("tri par mail\n");
        printf("les mails : %s et %s \n",c->mail,n->contact.mail);

    }else if(strcmp(option,"t") == 0){
        cmp = strcmp(c->phone,n->contact.phone);
    }else if(strcmp(option,"p") == 0){
        cmp = strcmp(c->first_name,n->contact.first_name);
    }
    else {
        cmp = strcmp(c->name, n->contact.name);
    }
    if (cmp > 0) {
        n->right = tri_nodeContact(c, n->right, option);
    } else if(cmp < 0){
        n->left = tri_nodeContact(c, n->left, option);
    }else{
        printf("Doublon détecté (%s) : entrée ignorée.\n", option);
    }

    return n;
}



void destroy_tree(Node *n) {
    if (n == NULL) return;

    destroy_tree(n->left);
    destroy_tree(n->right);

    free(n); 
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
        n = tri_nodeContact(&(m->contact),n,option);
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
