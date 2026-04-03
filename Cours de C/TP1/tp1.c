#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <stdbool.h>
#include "tp1.h"

void initialize_array(char tab[TAILLE][TAILLE])
{
    for (int i = 0; i < TAILLE; i++)
    {
        for (int j = 0; j < TAILLE; j++)
        {
            tab[i][j] = '.';
        }
    }
}

void afficher_tab(char tab[TAILLE][TAILLE])
{
    for (int i = 0; i < TAILLE; i++)
    {
        if (i == 0)
        {
            for (int j = 0; j < TAILLE; j++)
            {
                if (j == 0)
                {
                    printf(" ");
                }
                printf(" %d ", j);
            }
            printf("\n");
        }

        printf("%d", i);
        for (int j = 0; j < TAILLE; j++)
        {

            printf(" %c ", tab[i][j]);
        }
        printf("\n");
    }
}

void placer_ordi_intelligent(char tab[TAILLE][TAILLE]) {
    int i = 0;
    int nbGrandBateau = NBGRANDBATEAU; 

    while (i < NBATEAU+NBGRANDBATEAU) {
        int x = rand() % TAILLE;
        int y = rand() % TAILLE;

        if (tab[x][y] == '.') {
            
            if (nbGrandBateau > 0) {
                int axe = rand() % 2; 
                int sens = (rand() % 2 == 0) ? 1 : -1; 
                int x2 = x, y2 = y;
                if (axe == 0) x2 += sens; else y2 += sens;

                if (x2 >= 0 && x2 < TAILLE && y2 >= 0 && y2 < TAILLE && tab[x2][y2] == '.') {
                    tab[x][y] = 'G';
                    tab[x2][y2] = 'G';
                    nbGrandBateau--;
                    i++;
                }
            } 
            else {
                tab[x][y] = 'B';
                i++;
            }
        }
    }
}

bool poser_coordonnees(int x, int y, char tab[TAILLE][TAILLE])
{
    bool res = false;
    if (tab[x][y] != 'B')
    {
        tab[x][y] = 'B';
        res = true;
    }
    else
    {
        printf("\n Bateau deja placé ici !!! \n\n");
    }
    return res;
}




void poser_bateaux(char tab[TAILLE][TAILLE]) {
    int i = 1;
    int nbGrandBateauAPoser = NBGRANDBATEAU;
    int nbPetitBateauAPoser = NBATEAU;

    while (nbGrandBateauAPoser > 0) {
        int x, y, x2, y2, choix;
        char pos;

        printf("\n--- Pose du Grand Bateau (2 cases) n°%d ---\n", 3 - nbGrandBateauAPoser);
        printf("Position x : "); scanf("%d", &x);
        printf("Position y : "); scanf("%d", &y);

        if (x < 0 || x >= TAILLE || y < 0 || y >= TAILLE || tab[x][y] != '.') {
            printf("Case invalide ou occupée !\n");
            continue; 
        }

        printf("Axe horizontal (x) ou vertical (y) ? ");
        scanf(" %c", &pos);

        x2 = x; y2 = y;
        if (pos == 'x') {
            printf("1: [%d-%d] ou 2: [%d-%d] ? ", x, x+1, x-1, x);
            scanf("%d", &choix);
            x2 = (choix == 1) ? x + 1 : x - 1;
        } else {
            printf("1: [%d-%d] ou 2: [%d-%d] ? ", y, y+1, y-1, y);
            scanf("%d", &choix);
            y2 = (choix == 1) ? y + 1 : y - 1;
        }

        if (x2 >= 0 && x2 < TAILLE && y2 >= 0 && y2 < TAILLE && tab[x2][y2] == '.') {
            tab[x][y] = 'G';
            tab[x2][y2] = 'G';
            nbGrandBateauAPoser--;
            printf("Grand bateau placé !\n");
        } else {
            printf("Erreur : La deuxième case est hors limite u occupée !\n");
        }
    }

    while (nbPetitBateauAPoser > 0) {
        int x, y;
        printf("\n-- pose du Petit Bateau n°%d ---\n", NBATEAU - nbPetitBateauAPoser);
        printf("Position x : "); scanf("%d", &x);
        printf("Position y : "); scanf("%d", &y);

        if (x >= 0 && x < TAILLE && y >= 0 && y < TAILLE && tab[x][y] == '.') {
            tab[x][y] = 'B';
            nbPetitBateauAPoser--;
            printf("Petit bateau placé !\n");
        } else {
            printf("Case invalide ou occupée !\n");
        }
    }
}











bool tirer(int x, int y, char tab[TAILLE][TAILLE])
{
    bool res = false;

    if (tab[x][y] == 'B')
    {
        printf("Touché ! Coulé !\n");
        tab[x][y] = 'X';
        res = true;
    }
    else if (tab[x][y] == 'X' || tab[x][y] == 'O' || tab[x][y] == '+')
    {
        printf("Déjà tiré ici... Vous passez votre tour.\n");
        res = false;
    }
    else if (tab[x][y] == 'G')
    {
        tab[x][y] = '+'; 
        
        bool encore_un_G = false;
        if (x + 1 < TAILLE && tab[x+1][y] == 'G') encore_un_G = true;
        if (x - 1 >= 0     && tab[x-1][y] == 'G') encore_un_G = true;
        if (y + 1 < TAILLE && tab[x][y+1] == 'G') encore_un_G = true;
        if (y - 1 >= 0     && tab[x][y-1] == 'G') encore_un_G = true;

        if (!encore_un_G)
        {
            printf("Touché ! Coulé !\n");
        }
        else
        {
            printf("Touché !\n");
        }
        res = true;
    }
    else
    {
        printf("Loupé...\n");
        tab[x][y] = 'O';
        res = false;
    }
    
    return res;
}












bool choisir_ou_tirer(char tab[TAILLE][TAILLE])
{
    bool res = false;
    int x, y;
    printf("Tirer en position x : ");
    scanf("%d", &x);
    printf("Tirer en position y : ");
    scanf("%d", &y);
    if (x >= 0 && x < TAILLE && y >= 0 && y < TAILLE)
    {
        if (tirer(x, y, tab))
        {
            res = true;
        }
    }
    else
    {
        printf("Vous êtes en dehors du plateau");
    }
    return res; 
}          











void afficher_tab_ordi(char tab[TAILLE][TAILLE])
{
    for (int i = 0; i < TAILLE; i++)
    {
        if (i == 0)
        {
            for (int j = 0; j < TAILLE; j++)
            {
                if (j == 0)
                {
                    printf(" ");
                }
                printf(" %d ", j);
            }
            printf("\n");
        }

        printf("%d", i);
        for (int j = 0; j < TAILLE; j++)
        {
            if (tab[i][j] == 'B' || tab[i][j] == 'G')
            {
                printf(" . ");
            }
            else
            {
                printf(" %c ", tab[i][j]);
            }
        }
        printf("\n");
    }
}











void partie(char tabOrdi[TAILLE][TAILLE], char tabJoueur[TAILLE][TAILLE])
{
    int nbbateau_joueur= NBATEAU + NBGRANDBATEAU*2;
    int nbbateau_ordi = NBATEAU + NBGRANDBATEAU*2;


    while (nbbateau_joueur > 0 && nbbateau_ordi > 0)
    {
        printf("\n A vous de jouer \n");

        printf("Le plateau de l'ordi\n");
        afficher_tab_ordi(tabOrdi);
        if (choisir_ou_tirer(tabOrdi))
        {
            nbbateau_ordi--;
        }
        printf("il reste a l'ordi %d bateau", nbbateau_ordi);

        // ordi qui jouent
        printf("\nOrdinateur jouent \n");
        int x = rand() % TAILLE;
        int y = rand() % TAILLE;
        if (tirer(x, y, tabJoueur))
        {
            nbbateau_joueur--;
        }
        printf("il reste %d au joueur bateau", nbbateau_joueur);
        printf("Le plateau du joueur\n");
        afficher_tab(tabJoueur);
        sauvegarder_partie(tabOrdi,tabJoueur);
    }
    if (nbbateau_joueur == 0)
    {
        printf("\n Le joueur a perdu \n");
        printf("\n tab ordi \n");
        afficher_tab(tabOrdi);
        printf("\n tab Joueur \n");
        afficher_tab(tabJoueur);
        printf("\n Le nb de bateau de Ordi restant est %d", nbbateau_ordi);
    }
    else
    {
        printf("L'ordi a perdu");
        printf("\n tab ordi \n");
        afficher_tab(tabOrdi);
        printf("\n tab Joueur \n");
        afficher_tab(tabJoueur);
        printf("\n Le nb de bateau du Joueur restant est %d", nbbateau_joueur);
    }
}












void main(void)
{
    char tab_joueur[TAILLE][TAILLE];
    char tab_ordi[TAILLE][TAILLE];
    char choix;

    printf("Voulez-vous charger la partie précédente ? (y/n) : ");
    scanf(" %c", &choix);

    if (choix == 'y' && charger_partie(tab_ordi, tab_joueur)) {
        partie(tab_ordi, tab_joueur);
    } else {
        initialize_array(tab_joueur);
        initialize_array(tab_ordi);
 
    printf("\n =============TAB DE ORDI================\n");
    afficher_tab(tab_ordi);
    srand(time(NULL));
    placer_ordi_intelligent(tab_ordi);

    printf("\n ========== DEMARER LA PARTIE ============ \n \n");
    poser_bateaux(tab_joueur);
    afficher_tab(tab_joueur);
    partie(tab_ordi, tab_joueur);
        }
    }














// fopen

// FILE * fopen("")

// fprintf



void sauvegarder_partie(char tabO[TAILLE][TAILLE], char tabJ[TAILLE][TAILLE]) {
    FILE *f = fopen("save.bin", "wb"); // Mode binaire pour les tableaux
    if (f != NULL) {
        fwrite(tabO, sizeof(char), TAILLE * TAILLE, f);
        fwrite(tabJ, sizeof(char), TAILLE * TAILLE, f);
        fclose(f);
        printf("Partie sauvegardée !\n");
    }
}

bool charger_partie(char tabO[TAILLE][TAILLE], char tabJ[TAILLE][TAILLE]) {
    FILE *f = fopen("save.bin", "rb"); 
    if (f == NULL) {
        printf("Aucune sauvegarde trouvée.\n");
        return false;
    }
    
    fread(tabO, sizeof(char), TAILLE * TAILLE, f);
    fread(tabJ, sizeof(char), TAILLE * TAILLE, f);
    
    fclose(f);
    printf("Partie chargée avec succès !\n");
    return true;
}
