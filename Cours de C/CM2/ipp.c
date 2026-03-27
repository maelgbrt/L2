#include <stdio.h>

void main(void)
{
    int i = 2 ;

    int j = i ++; // on effectue avant le j = 2 et apres on ajoute j à i

    int k = ++ i; //on effectue avant le + à i


    printf("%d\n%d\n%d\n",j,k,i);
}