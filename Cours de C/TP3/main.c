#include "contact.c"
#include "maillon.c"
#include "hash.c"
// #include "annuaire.c"


int main(int argc, char *argv[]){
    
 Contact c = *create("mael", "07", "gaborit", "maelgaborit@gmail.com");
    Contact c2 = *create("telio", "058", "gaborit", "teliogaborit@gmail.com");
    Annuaire_hashmap a;
    init(&a, 15);
    add(&a, &c);
    add(&a, &c2);
    print(a);
    Contact *c3 = findContact(&a, "telio", 'n');
    if (c3 != NULL)
    {
        printContact(*c3);
    }
    // printf("========test extraction ======");
    // extraire(&a,"nt");
    menu(&a);

    // findContact(a.tab[10],"mael",'n');
    // Contact *res = findContact(&a[10],"mael","n");


    // Annuaire_hashmap *a;
   
}