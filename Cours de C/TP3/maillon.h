typedef struct Maillon Maillon;

struct Maillon {
    Contact contact;
    Maillon *next; 
};