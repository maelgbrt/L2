#include <stdlib.h>
#include "hashmap.h"


//un tableau de pointeur de pointeur 
void init(Hashmap *h, int size){
    h->persons = (Person **)malloc(size*sizeof(Person*));
    h->size = size;
    for (int i = 0 ; i < size ; i++ ){
        h->persons[i] = NULL;
    }
}


//tableau de charactere pas un charactere
int hash(char *key,int size){
    int res = 0;
    int i = 0;
    while (key[i] != '\0'){
        res += key[i];
        i ++;
    }
    return res % size; //correpond au modulo
} 

Person *create(char *name,int age,char *email){
    //allouer mémoire
    Person *res = (Person *)malloc(sizeof(Person));
    res->name = strdup(name);
    res->age = age;
    res->email = strdup(email);
    return res;
}


// void add(Hashmap *h,char *name,int age,char *email){
//     int index =  hash(name,h->size);
//     Person *p = create(name,age,email);
//     h->persons[index] = p;
// }
void add(Hashmap *h,char *name,int age,char *email){
    int cmpt = 0;
    int index =  hash(name,h->size);
    Person *p = create(name,age,email);
    while (h->persons[index] != NULL && cmpt < h->size)
    {
        index = (index + 1)%h->size;
        cmpt ++;
    }
    h->persons[index] = p;
    
    
}
// Person * find (Hashmap h,char *name){
//     return h.persons[hash(name,h.size)];
// }

Person * find (Hashmap h,char *name){
    int index = hash(name,h.size);
    Person * p = h.persons[index];
    while (p != NULL && p!= REMOVED && (p->name,name)!= 0){
        index = (index +1)%h.size;
        p = h.persons[index];
    }
}

void free_person(Person *p){
    free(p->name);
    free(p->age);
    free(p->email);
}

void remove (Hashmap *h, char * name){
    int index = hash(name,h->size);
    if(h->persons[index]!= NULL){
        free_person(h->persons[index]);
        h->persons[index] = NULL;
    }
}

