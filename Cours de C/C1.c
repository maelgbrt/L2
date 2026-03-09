// Code en C

#include <stdio.h>


void main(void)
{
    printf("Hello worlf\n");

    int mon_premier_entier_info403 = 4;
    float flottant = 2.3;

     char *chaine = "hello";
    printf("voici ma chaine : %s\n", chaine);

    for (int i = 0; i < 10 ; i++)
    {
        printf("%1.2f et %d\n",flottant,i); // le d va correspondre au i 
        //-> f correspond float et d à entier
       

    }



    char c;

    while (c != 'a')
    {
        putchar(c); //Traiter Element
        c = getchar(); //Passer à l'element suivant
    }
    
}