
#define TAILLE 10
#define NBATEAU 5
#define NBGRANDBATEAU 2
void sauvegarder_partie(char tabO[TAILLE][TAILLE], char tabJ[TAILLE][TAILLE]);
bool charger_partie(char tabO[TAILLE][TAILLE], char tabJ[TAILLE][TAILLE]);
void partie(char tabOrdi[TAILLE][TAILLE], char tabJoueur[TAILLE][TAILLE]);
void afficher_tab_ordi(char tab[TAILLE][TAILLE]);
bool choisir_ou_tirer(char tab[TAILLE][TAILLE]);
bool tirer(int x, int y, char tab[TAILLE][TAILLE]);
void poser_bateaux(char tab[TAILLE][TAILLE]);
bool poser_coordonnees(int x, int y, char tab[TAILLE][TAILLE]);
void placer_ordi_intelligent(char tab[TAILLE][TAILLE]);
void afficher_tab(char tab[TAILLE][TAILLE]);
void initialize_array(char tab[TAILLE][TAILLE]);