#define NAME_MAX_LENGHT 50
#define FIRST_NAME_MAX_LENGHT 50
#define PHONE_MAX_LENGHT 20
#define MAIL_MAX_LENGHT 50


typedef struct 
{
    char name[NAME_MAX_LENGHT];
    char first_name[FIRST_NAME_MAX_LENGHT];
    char phone[PHONE_MAX_LENGHT];
    char mail[MAIL_MAX_LENGHT];
}Contact;


typedef struct Maillon Maillon;

struct Maillon {
    Contact contact;
    Maillon *next; 
};

typedef struct {
    Maillon **tab;
    int size;
}Annuaire_hashmap;


int hash(char *key, int size); //hash ce que l'on souhaite hasher(le key)
void init(Annuaire_hashmap *a, int size); 
Maillon *createMaillon(Contact *c);
void insertMaillon(Maillon *m, Contact *c);
void printContact(Contact c);
void printMaillon(Maillon *m);
Contact *create(char *name, char *phone,char *first_name, char *email);
// void add(Annuaire_hashmap *a, Contact *contact);
// Contact *find(Annuaire_hashmap *a,char *val,char option);
// void remove(Annuaire_hashmap *a,char *name);
void print(Annuaire_hashmap a);
// void fusionner(Annuaire_hashmap *a,Annuaire_hashmap *b);


// void destroy(Hashmap *map);
// void print(Hashmap h);

