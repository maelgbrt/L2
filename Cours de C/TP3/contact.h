#ifndef CONTACT_H
#define CONTACT_H

#define NAME_MAX_LENGHT 50
#define FIRST_NAME_MAX_LENGHT 50
#define PHONE_MAX_LENGHT 20
#define MAIL_MAX_LENGHT 50

typedef struct Annuaire_hashmap Annuaire_hashmap;

typedef struct 
{
    char name[NAME_MAX_LENGHT];
    char first_name[FIRST_NAME_MAX_LENGHT];
    char phone[PHONE_MAX_LENGHT];
    char mail[MAIL_MAX_LENGHT];
}Contact;

void printContact(Contact c);
void add(Annuaire_hashmap *a, Contact *contact);
Contact *create(char *name, char *phone, char *first_name, char *mail);
Contact *findContact(Annuaire_hashmap *a, char *val, char option);
void removeContact(Annuaire_hashmap *a, char *val, char option);
void ajouterContact (Annuaire_hashmap *a);
void rechercheContact(Annuaire_hashmap *a);
void SupprimerContact(Annuaire_hashmap *a);

#endif
