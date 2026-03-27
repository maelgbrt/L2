#include <stdio.h> //pr le printf et le getchar
int somme_tab(int tab[],int taille);
int moyenne(int a, int b, int c);

void main()
{
    // int cpt = 0;
    // char cc = getchar();

    // while (cc != EOF)
    // {
    //     cpt ++;
    //     cc = getchar();
    // }
    // printf("Nbr de caractères : %d",cpt);

    //---------POUR LE TABLEAU-----------//
    int tab[5] = {5,4,3,25,11};
    int somme = somme_tab(tab,5);
    printf("La somme du tab es %d\n" , somme);


    //---------POUR LA MOYENNE-----------//
    int a,b,c;
    scanf("%d %d %d",&a,&b,&c); //&a crrespond a la case -> a regarde la valeur de la case (&a en out, a en in)
    int moyen = moyenne(a, b , c);
    printf("la moyenne est %d\n", moyen);
}

    int somme_tab(int tab[] , int taille)
{
    int res = 0;

    for (int i = 0; i< taille; i ++)
    {
        res += tab[i];
    }
    return res;
}

    int moyenne(int a, int b , int c)
{
    int res = (a + b + c) / 3;
    return res;
}

        menu()