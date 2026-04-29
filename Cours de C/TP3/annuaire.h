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
Contact *create(char *name, char *phone,char *first_name, char *email);
Maillon *createMaillon(Contact *c);
void print(Annuaire_hashmap a);
void printMaillon(Maillon *m);
void printContact(Contact c);
void insertMaillon(Maillon *m, Contact *c);
void add(Annuaire_hashmap *a, Contact *contact);
Maillon *findMaillon(Maillon *m, char *val);
Contact *findContact(Annuaire_hashmap *a, char *val, char option);
void removeContact(Annuaire_hashmap *a, char *val, char option);
void fusionnerMaillon(Maillon *m1, Maillon *m2);
void fusionner(Annuaire_hashmap *a1, Annuaire_hashmap *a2);
void ajouterContact (Annuaire_hashmap *a);
void rechercheContact(Annuaire_hashmap *a);
void SupprimerContact(Annuaire_hashmap *a);
void extraire(Annuaire_hashmap *a, char *car);
void ExtraireInfos(Annuaire_hashmap *a);
void menu(Annuaire_hashmap *a);
int main(int argc, char *argv[]);
void destroy(Annuaire_hashmap *a);
void affiche_aide();