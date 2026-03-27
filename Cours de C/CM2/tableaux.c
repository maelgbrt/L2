#include <stdio.h>

void main (void)
{
    int tab[] = {1,2,3,4,5,6,7,8,9};

    printf("%p\n", tab);
    printf("%p\n", &tab[0]);
    printf("%p\n", &tab[1]);

}

    