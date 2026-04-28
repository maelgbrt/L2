#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "annuaire.h"

int hash(char *key, int size){
    int res = 0;
    int i = 0;
    while (key[i] != '\0'){
        res += key[i];
        i ++;
    }
    return res % size; //correpond au modulo
}

void init(Annuaire_hashmap *a, int size)
{
    a->tab = (Maillon ** )malloc(size*sizeof(Maillon*));
    a->size = size;
    for(int i = 0 ; i < size ; i++)
    {
        a->tab[i] = NULL;
    }
}

Contact *create(char *name, char *phone, char *first_name, char *mail) {
    Contact *c = malloc(sizeof(Contact));

    strcpy(c->name,name);
    strcpy(c->first_name,first_name);
    strcpy(c->phone,phone);
    strcpy(c->mail,mail);

    return c; 
}       

Maillon *createMaillon(Contact *c){
    Maillon *m = malloc(sizeof(Maillon));

    m->contact = *c;
    m->next = NULL;

    return m;
}

void menu () {
    int nb;
    printf("Que souhaitez vous faire ?");
      scanf("%d",nb);
    switch ()
    {
    case constant expression:
        /* code */
        break;
    
    default:
        break;
    }
}


void print(Annuaire_hashmap a) {
    for (int i = 0; i < a.size; i++) {
 
        if (a.tab[i] != NULL) {
            printf("\n--- CATEGORIE %d ---\n", i);
            printMaillon(a.tab[i]);
            printf("--------------------------\n");
        }
    }
}

void printMaillon(Maillon *m){
    while(m !=NULL){
        printf("\n================ CONTACT =================== \n");
        printContact(m->contact);
        printf("\n");
        m = (Maillon *)m->next;
    }
}

void printContact(Contact c){
    printf("Prenom : %s \nNom : %s \nTelephone : %s \nMail : %s \n",c.name,c.first_name,c.phone,c.mail);}


void insertMaillon(Maillon *m, Contact *c){
    while(m->next != NULL){
        m = (Maillon *)m->next;
    }
    m->next = createMaillon(c);
}


void add(Annuaire_hashmap *a, Contact *contact){
    int hash_func = hash(contact->name,a->size);
    printf("la valeur est %d, la taille est %d\n",hash_func,a->size);
    if(a->tab[hash_func] != NULL) {
        insertMaillon(a->tab[hash_func],contact);
    }else{
        a->tab[hash_func] = createMaillon(contact);
    }
}



Maillon * findMaillon(Maillon *m,char *val){
    while(m != NULL){
        Contact c = m->contact;
        if (strcmp(c.name, val) == 0 || strcmp(c.mail, val) == 0 ||strcmp(c.phone, val) == 0){
            return m;
        }
        m = m->next;
    }
}


Contact * findContact(Annuaire_hashmap *a, char *val, char option) {
    switch (option) {
        case 'n': {
            int hash_func = hash(val, a->size);
            Maillon *m = findMaillon(a->tab[hash_func], val);
            return (m!= NULL) ? &(m->contact) : NULL;
        }
        case 't':
        case 'm':
            for (int i = 0; i < a->size; i++) {
                Maillon *m = findMaillon(a->tab[i], val);
                if (m != NULL) {
                    return &(m->contact);
                }
            }
            return NULL;
        default:
            return NULL;
    }
}




void removeContact(Annuaire_hashmap *a, char *val, char option) {
    Contact *tmp = findContact(a, val, option);
    if (tmp != NULL) {
        int hash_func = hash(tmp->name, a->size);
        Maillon *current = a->tab[hash_func];
        Maillon *prev = NULL;

        while (current != NULL) {
            if (&(current->contact) == tmp) { 
                
                if (prev == NULL) {
                    a->tab[hash_func] = current->next;
                } 
                else {
                    prev->next = current->next;
                }

                free(current);
                printf("Contact supprime avec succes.\n");
                return;
            }
            prev = current;
            current = current->next;
        }
    } else {
        printf("Suppression impossible : contact introuvable.\n");
    }
}

void fusionnerMaillon(Maillon *m1,Maillon *m2){
        while(m1->next != NULL){
            m1 = m1->next;    
        }
        m1->next = m2;
    }

void fusionner(Annuaire_hashmap *a1,Annuaire_hashmap *a2){
    for(int i = 0 ; i < a2->size; i++){
        if (i < a1->size) {
            if (a1->tab[i] == NULL) {
                a1->tab[i] = a2->tab[i];
            } else if (a2->tab[i] != NULL) {
                fusionnerMaillon(a1->tab[i], a2->tab[i]);
            }
        }
    }
}   

void main(int argc, char *argv[]) {
    
    Contact c = *create("mael","07","gaborit","maelgaborit@gmail.com");
    Contact c2 = *create("telio","058","gaborit","teliogaborit@gmail.com");
    Annuaire_hashmap a;
    init(&a,15);
    add(&a,&c);
    add(&a,&c2);
    print(a);
    Contact *c3 = findContact(&a,"telio",'n');
    if(c3!=NULL){
        printContact(*c3);
    }   
    // findContact(a.tab[10],"mael",'n');
    // Contact *res = findContact(&a[10],"mael","n");
}