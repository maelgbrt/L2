#include <stdio.h>

void main(void){
    int k = 3;
    float f = k; // Conversion ( casting ) implicite


    float f2 = 3.26;
    int k2 = f2 ;
    printf("%f\n%d\n",f,k2);

    //on peut convertir avec 
    int d = ( int ) f2 ;
}