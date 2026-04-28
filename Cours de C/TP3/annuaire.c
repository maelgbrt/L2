#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "annuaire.h"

int hash(char *key, int size)
{
    int res = 0;
    int i = 0;
    while (key[i] != '\0')
    {
        res += key[i];
        i++;
    }
    return res % size; // correpond au modulo
}

void init(Annuaire_hashmap *a, int size)
{
    a->tab = (Maillon **)malloc(size * sizeof(Maillon *));
    a->size = size;
    for (int i = 0; i < size; i++)
    {
        a->tab[i] = NULL;
    }
}

Contact *create(char *name, char *phone, char *first_name, char *mail)
{
    Contact *c = malloc(sizeof(Contact));

    strcpy(c->name, name);
    strcpy(c->first_name, first_name);
    strcpy(c->phone, phone);
    strcpy(c->mail, mail);

    return c;
}

Maillon *createMaillon(Contact *c)
{
    Maillon *m = malloc(sizeof(Maillon));

    m->contact = *c;
    m->next = NULL;

    return m;
}


void print(Annuaire_hashmap a)
{
    for (int i = 0; i < a.size; i++)
    {

        if (a.tab[i] != NULL)
        {
            printf("\n--- CATEGORIE %d ---\n", i);
            printMaillon(a.tab[i]);
            printf("--------------------------\n");
        }
    }
}

void printMaillon(Maillon *m)
{
    while (m != NULL)
    {
        printf("\n================ CONTACT =================== \n");
        printContact(m->contact);
        printf("\n");
        m = (Maillon *)m->next;
    }
}

void printContact(Contact c)
{
    printf("Contact !!!\n");
    printf("Prenom : %s \nNom : %s \nTelephone : %s \nMail : %s \n", c.name, c.first_name, c.phone, c.mail);
}

void insertMaillon(Maillon *m, Contact *c)
{
    while (m->next != NULL)
    {
        m = (Maillon *)m->next;
    }
    m->next = createMaillon(c);
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

Maillon *findMaillon(Maillon *m, char *val)
{
    while (m != NULL)
    {
        Contact c = m->contact;
        if (strcmp(c.name, val) == 0 || strcmp(c.mail, val) == 0 || strcmp(c.phone, val) == 0)
        {
            return m;
        }
        m = m->next;
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

void fusionnerMaillon(Maillon *m1, Maillon *m2)
{
    while (m1->next != NULL)
    {
        m1 = m1->next;
    }
    m1->next = m2;
}

void fusionner(Annuaire_hashmap *a1, Annuaire_hashmap *a2)
{
    for (int i = 0; i < a2->size; i++)
    {
        if (i < a1->size)
        {
            if (a1->tab[i] == NULL)
            {
                a1->tab[i] = a2->tab[i];
            }
            else if (a2->tab[i] != NULL)
            {
                fusionnerMaillon(a1->tab[i], a2->tab[i]);
            }
        }
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


void fusionnerAnnuaire(Annuaire_hashmap *a1){
    printf("Quel annuaire voulez vous ajouter ?\n");
    Annuaire_hashmap *a2;
    scanf("%p",a2);
    printf("Le a2 = %p",a2);
}



void menu(Annuaire_hashmap *a)
{
    int nb;
    do
    {
        printf("\nQue voulez vous faire ?\n1 : Ajouter un contact \n2 : Afficher tous les contacts \n3 : Rechercher un contact\n4 : Extraire\n5 : Supprimer un contact \n6: fusionner deux annuaires \n7 : Sortir\n");
        scanf("%d", &nb);
        switch (nb)
        {
        case 1:
            printf("Ajouter un contact\n");
            ajouterContact(a);
            break;
        case 2:
            printf("Afficher tous les contacts: \n");
            print(*a);
            break;
        case 3:
            printf("Rechercher un contact : \n");
            rechercheContact(a);
            break;
        case 4:
            printf("Extraire : \n");
            break;
        case 5:
            printf("Supprimer un contact \n");
            SupprimerContact(a);
            break;

        case 6:
            printf("Fusionner deux annuaire \n");
            fusionnerAnnuaire(a);
            break;
        case 7:
            printf("Fin du Programme, Merci et à Bientôt !!\n");
        default:
            printf("Sortir\n");
        };

    } while (nb !=7);
}   

int main(int argc, char *argv[])
{

    Contact c = *create("mael", "07", "gaborit", "maelgaborit@gmail.com");
    Contact c2 = *create("telio", "058", "gaborit", "teliogaborit@gmail.com");
    Annuaire_hashmap a;
    init(&a, 15);
    add(&a, &c);
    add(&a, &c2);
    print(a);
    Contact *c3 = findContact(&a, "telio", 'n');
    if (c3 != NULL)
    {
        printContact(*c3);
    }
    menu(&a);
    // findContact(a.tab[10],"mael",'n');
    // Contact *res = findContact(&a[10],"mael","n");
}




































void extraire(Annuaire_hashmap *a, char *car)
{
    if (a == NULL || car == NULL)
        return;

    for (int i = 0; i < a->size; i++)
    {
        Maillon *m = a->tab[i];
        while (m != NULL)
        {
            Contact c = m->contact;
            for (int j = 0; car[j] != '\0'; j++)
            {
                switch (car[j])
                {
                case 'n':
                    printf("%s\n", c.name);
                    break;
                case 'p':
                    printf("%s\n", c.first_name);
                    break;
                case 't':
                    printf("%s\n", c.phone);
                    break;
                case 'm':
                    printf("%s\n", c.mail);
                    break;
                }
            }
            m = m->next;
        }
    }
}















void destroy(Annuaire_hashmap *a){
    for (int i = 0; i< a->size;i++){
    Maillon *m = a->tab[i];
    if(m!=NULL){
        while(m!=NULL){
            Maillon *tmp = m;
            m = m->next;
            free(tmp);
            }
        }
    }
}