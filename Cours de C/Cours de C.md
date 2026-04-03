# Cours de C

## Mot de Passe
mot de passe : _info403_

## CM 1
Pour lancer le code
```
gcc -o C1 C1.c
./C1
```
Le code:

[CM1](/CM1)


# CM 2 : Les pointeurs d'Epsteins

|         |         | valeur    | adresse    |
| ------- | ------- | ------- | ------- |
| variable| int a    | a    | &a   |
| pointeur| int *a    | *a    | a    |


# CM 3

```
#include <stdio.h>
#include <stdlib.h>
#definie N 4

int *initialize_array()
{
    int *tab = (int * )malloc(N*sizeof(int));
    <!-- int *tab = malloc(N * sizeof(int)); -->
    for ( int i = 0 ; i < n ; i++ )
    {
        tab [i] = 2 * i ;
    }
    return tab;
}


void main(void)
{
    int tab* = initialize_array();

    malloc
    for (int i =0 ; i < N; i++) 
    {
        printf("%d\n", tab[i]);
    }

    tab = (int * )realloc(tab, 4* sizeof(int));

    free(tab); //libère la place pris par la malloc
}



```

on a **malloc** et **realloc**

realloc modifie la taille du stockage alloué

Ecrivez un prg qui qui definie une structure point avec 2 coordoneeés flottant x et y qui allow dynamiquement un tab de N point (N demandé a l'utilisateur) 

```

typedef struct
{
    float x;
    float y;
}Point;


void main(void)
{
    int n;
    printf("Combien de points voulez-vous ?");
    scanf("%d\n",&n);
    <!-- Point *points = (Points *)calloc(n * sizeof(Point)) -->
    Point *points = (Points *)malloc(n * sizeof(Point))
    //un pointeur vers point

    for (int i = 0 ; i < n ; i++)
    {
        printf("Donnez les coordonnéees du point %d : \n",i);
        scanf("%f %f", &points[i].x,&points[i].y);
    }

      for (int i = 0 ; i < n ; i++)
    {
        printf("%f %f", points[i].x,points[i].y);
    }
}

```

sudo apt install valgrind : permet de suivre la mémoire alloué

## La récursivité
```
typedef struct _element
{
    int valeur;
    struc _element *suivant
}Element;

void main(void)
{
    Element x;
    x.valeur = 12;

    Element y;
    y.valeur = 16;


    x.suivant = &y;
    y.suivant = NULL;

    Element *ptr = &x;

    while (ptr != NULL)
    {
        printf("%d\n",ptr->valeur);
        ptr = ptr->suivant;
    }
}
```

Reflechir Arbre Binaire 


