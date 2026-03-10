// Code en C

#include <stdio.h> //pr le printf

#include "tableau.h"
#include "fonctions.h"

    struct Etudiant
    {
        char nom[50];
        int age;
        float moyenne;
    };


// on  va declarer dans autre fichier pour rviter den avoir plein en entête
// int power(int value, int exp);

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


    printf("\n");

    int tab[3];

    tab[0] = 1 ;
    tab[1] = 3 ;
    tab[2] = 7 ;

    printf("%d\n", tab[1]);
    
      printf("\n");


    int res = power(2,6);
    printf("%d\n",res);

    char c;

    multiplier_par_7(3);
    multiplier_par_7_avec_pointeur(&mon_premier_entier_info403);

        struct Etudiant julien;
        julien.age = 42;
        printf("%d\n",julien.age);


    // while (c != 'a')
    // {
    //     putchar(c); //Traiter Element
    //     c = getchar(); //Passer à l'element suivant

    // }
  
}

    int power(int value, int exp)
    {
        int res = 1;
        for (int i = 1 ; i <= exp; i++)
        {
            res = res * value;
        }
        return res;
    }

    void multiplier_par_7(int n){
        
        n = 7 * n;
        printf("ENtier multiplié par 7 : %d\n" , n);

    }

   void multiplier_par_7_avec_pointeur(int *n){
        
        *n = 7 * (*n);
    }

