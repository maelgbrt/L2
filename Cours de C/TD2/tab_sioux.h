#define SIZE_MAX 100
typedef struct
{
    int tab[SIZE_MAX];
    int size
}tab_sioux;

int size_tab_sioux(tab_sioux t);
void print_tab_sioux(tab_sioux *t,int x);
int remove_tab_sioux(tab_sioux *t);
void add_tab_sioux(tab_sioux *t,int x);