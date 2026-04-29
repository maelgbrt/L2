#include "maillon.h"
#include <stdio.h>

Maillon *createMaillon(Contact *c)
{
    Maillon *m = malloc(sizeof(Maillon));

    m->contact = *c;
    m->next = NULL;

    return m;
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


void insertMaillon(Maillon *m, Contact *c)
{
    while (m->next != NULL)
    {
        m = (Maillon *)m->next;
    }
    m->next = createMaillon(c);
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


void fusionnerMaillon(Maillon *m1, Maillon *m2)
{
    while (m1->next != NULL)
    {
        m1 = m1->next;
    }
    m1->next = m2;
}