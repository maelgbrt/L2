typedef struct
{
    char *nom1;
    char *nom2;
    int (*score)[2];
    int nbSet;

} Match;



typedef struct match_tournois {
    Match info;
    struct match_tournois *suiv;
} match_tournois;

typedef struct match_tournois * Tournois;

void initialiser( Tournois *t);
void ajouterMatch (Tournois *t, char *j1, char *j2, int sets[][2],int nbSet );
void afficher (Tournois t);
void liberer(Tournois *t);
 