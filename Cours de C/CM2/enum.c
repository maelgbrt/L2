#include <stdio.h>

enum months
{
    JAN,
    FEV,
    MAR,
    AVRIL
};

typedef enum months mois;


void main(void){
    mois current = MAR;

    printf("%d\n",current);
}