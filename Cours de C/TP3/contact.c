#include "annuaire.h"
#include <stdio.h>
#include <stdlib.h>


void printContact(Contact c)
{
    printf("Contact !!!\n");
    printf("Prenom : %s \nNom : %s \nTelephone : %s \nMail : %s \n", c.name, c.first_name, c.phone, c.mail);
}


void add(Annuaire_hashmap *a, Contact *contact)
{
    int hash_func = hash(contact->name, a->size);
    printf("la valeur est %d, la taille est %d\n", hash_func, a->size);
    if (a->tab[hash_func] != NULL)
    {
        insertMaillon(a->tab[hash_func], contact);
    }
    else
    {
        a->tab[hash_func] = createMaillon(contact);
    }
}


Contact *findContact(Annuaire_hashmap *a, char *val, char option)
{
    switch (option)
    {
    case 'n':
    {
        int hash_func = hash(val, a->size);
        Maillon *m = findMaillon(a->tab[hash_func], val);
        return (m != NULL) ? &(m->contact) : NULL;
    }
    case 't':
    case 'm':
        for (int i = 0; i < a->size; i++)
        {
            Maillon *m = findMaillon(a->tab[i], val);
            if (m != NULL)
            {
                return &(m->contact);
            }
        }
        return NULL;
    default:
        return NULL;
    }
}

void removeContact(Annuaire_hashmap *a, char *val, char option)
{
    Contact *tmp = findContact(a, val, option);
    if (tmp != NULL)
    {
        int hash_func = hash(tmp->name, a->size);
        Maillon *current = a->tab[hash_func];
        Maillon *prev = NULL;

        while (current != NULL)
        {
            if (&(current->contact) == tmp)
            {

                if (prev == NULL)
                {
                    a->tab[hash_func] = current->next;
                }
                else
                {
                    prev->next = current->next;
                }

                free(current);
                printf("Contact supprime avec succes.\n");
                return;
            }
            prev = current;
            current = current->next;
        }
    }
    else
    {
        printf("Suppression impossible : contact introuvable.\n");
    }
}



void ajouterContact (Annuaire_hashmap *a) {
    
    char first_name[FIRST_NAME_MAX_LENGHT];
    char phone[PHONE_MAX_LENGHT];
    char mail[MAIL_MAX_LENGHT];
    char name[NAME_MAX_LENGHT];
    printf("Son Nom ?\n");
    scanf("%s",name);
    printf("Son Nom de Famille ?\n");
    scanf("%s",first_name);
    printf("Son numéro de Téléphone ?\n");
    scanf("%s",phone);
    printf("Son Mail ?\n");
    scanf("%s",mail);

    Contact *c = create(name, phone,first_name,mail);
    printContact(*c);
    add(a, c);
}



void rechercheContact(Annuaire_hashmap *a){
    printf("Rechercher le contact par quoi (n/t/m) ou s pour sortir ?\n");
    char choice;
        
        scanf(" %c",&choice);
        switch (choice)
        {
            case 'n':
                printf("Quel est son nom ? \n");
                char name[NAME_MAX_LENGHT];
                scanf("%s/n",name);
                Contact *c = findContact(a,name,'n');
                if (c != NULL)
                    {
                    printContact(*c);
                    }
                else{
                    printf("====pas trouve====");
                }
            break;
            case 't':
            printf("Quel est son numéro de telephone ?\n");
            char phone[PHONE_MAX_LENGHT];
            scanf("%s",phone);
            Contact *c2 = findContact(a,phone,'t');
                if (c2 != NULL)
                    {
                    printContact(*c2);
                    }
                    else{
                    printf("====pas trouve====");
                }
            break;
            case 'm':
            printf("Quel est sont adresse mail ?\n");
            char mail[MAIL_MAX_LENGHT];
            scanf("%s",mail);
            Contact *c3 = findContact(a,mail,'m');
                if (c3 != NULL)
                    {
                    printContact(*c3);
                    }else{
                    printf("====pas trouve====");
                }
            break;
            default:
            break;
        }
}



void SupprimerContact(Annuaire_hashmap *a){
    printf("COmment voulez vous le supprimer(n/t/m) ?\n");
    char choice;
    scanf(" %c",&choice);
    switch (choice)
    {
    case 'n':
        printf("Quel est son nom ?\n");
        char nom[NAME_MAX_LENGHT];
        scanf("%s",nom);
        removeContact(a,nom ,'n');
        break;
    case 't':
        printf("Quel est son numéro de telephone ?\n");
        char phone[PHONE_MAX_LENGHT];
        scanf("%s",nom);
        removeContact(a,phone ,'t');
        break;
    case 'm':
        printf("Quel est son mail ?\n");
        char mail[MAIL_MAX_LENGHT];
        scanf("%s",mail);
        removeContact(a,mail ,'m');
        break;
    default:
        break;
    }
}