#include <stdio.h>

int addition(int a, int b)
{
    return a + b ;
}

int soustraction(int a, int b)
{
    return a - b;
}

void main(void)
{
    int (*pointeur_fonction)(int,int);
    pointeur_fonction = addition;
    printf("Addition : %d\n", pointeur_fonction(7,2));

    pointeur_fonction = soustraction;
    printf("Addition : %d\n", pointeur_fonction(3,2));

}