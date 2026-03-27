#include <stdio.h>



void modifie(float *reel){
    *reel = 7.2;
}
void main(void){
    float mon_f = 3.56;
    modifie(&mon_f);
    // va permettre de le modifier dans le main

    printf("%p\n",&mon_f);

    printf("%f\n",mon_f);
}