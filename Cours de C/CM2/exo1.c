#include <stdio.h>



void swap(int *n1,int *n2){
    int tmp = *n1;
    *n1 = *n2;
    *n2 = tmp;
}



void main(void)
{

    int a = 3 ;
    int b = 7 ;
    swap(&a,&b);

    printf("a vaut il 7 ? %d\n", a );
    printf("a vaut il 3 ? %d\n", b );

}
