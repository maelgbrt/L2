#define NB_RANGEE_MAX 10
#define NB_COL_MAX 10
#define NB_SALLE 10

typedef enum {
    Standard,
    Premium,
    VIP
}TypePlace;

typedef struct {
    int numero;
    bool reserve;
    TypePlace type;
}Place;

typedef struct
{
    Place places[NB_RANGEE_MAX][NB_COL_MAX];
    int nb_rangees;
    int nb_cols;
}Salle;

typedef Salle Cinema[NB_SALLE];
void init_cinema(Cinema C, int nb_places[][2]);
void afficher_cinema(Cinema c);
