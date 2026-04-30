#include "contact.h"

typedef struct 
{
    char *name;
    int age;
    char *email;
}Person;

typedef struct {
    Person **persons;
    int size;
}Hashmap;

Person * REMOVED = (Person*)(-1);

int hash(char *key, int size);
void init(Hashmap *h, int size);
Person *create(char *name, int age, char *email);
void add(Hashmap *map,char *name, int age, char *email);
Person* find(Hashmap h, char *name);
void remove(Hashmap *map, char *name);
void destroy(Hashmap *map);
void print(Hashmap h);
