#include "extraire.h"
#include <stdio.h>



void extraire(Annuaire_hashmap *a, char *car)
{
    if (a != NULL && car != NULL)
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


    void extraireInfos(Annuaire_hashmap *a){
        char choice[10];
        printf("Quelles infos voulez vous obtenir ?\n");
        scanf("%s",choice);
        extraire(a,choice);
        }
