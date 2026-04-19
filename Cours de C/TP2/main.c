#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>

#include "maze.h"
#include "coord.h"
#include "stack.h"





bool is_visited(maze *m, coord next){
  return (m->cells[next.x][next.y].tag[0] == '.' || m->cells[next.x][next.y].tag[1] == '.');
}

bool solve_rec(maze *m, coord c, Stack *p) {
    if (is_target(m, c)) return true;

    set_tag(m, c, "."); 
    stack_push(p, c);

    neighboors v = list_neighboors(m, c);
    coord next;
    
    if (v.north) {
        next.x = c.x;
        next.y = c.y -1;
        if (!is_visited(m, next)) { // On ne va au Nord que si ce n'est pas visité
            if (solve_rec(m, next, p)) return true;
        }
    }
    if (v.south) {
      next.x = c.x;
      next.y = c.y +1;
        if (!is_visited(m, next)) { // On ne va au Nord que si ce n'est pas visité
            if (solve_rec(m, next, p)) return true;
        }
    }
    if (v.west) {
      next.x = c.x -1;
      next.y = c.y;
        coord next = {c.x-1, c.y};
        if (!is_visited(m, next)) { // On ne va au Nord que si ce n'est pas visité
            if (solve_rec(m, next, p)) return true;
        }
    }
    if (v.east) {
        next.x = c.x +1 ;
        next.y = c.y;
        if (!is_visited(m, next)) { // On ne va au Nord que si ce n'est pas visité
            if (solve_rec(m, next, p)) return true;
        }
    }


    // Si on veut que le tag disparaisse si on fait marche arrière :
    set_tag(m, c, "."); 
    
    stack_pop(p);
    return false;
}

// void solve(maze *m)
// {
//   Stack p;
//   coord c;
//   c.x = 0;
//   c.y = 0;
//   bool r;
//   stack_init(&p, 100);  


//   printf("on est ds solve : \n");

// r = solve_rec(m, c, &p);
// if (r) {
//   for(int i = 0; i < p.NbElement; i++) {
//     coord current = p.tabElement[i];
//       set_tag(m, current, "o");
      
//       printf("Case marquée : (%d, %d)\n", current.x, current.y);
//     }
//   }
//   else {
//     printf("Impossible d'atteindre la sortie !!!\n");
//   }
//   stack_free(&p);

// }


void solve(maze *m) {
    Stack p;
    coord start = {0, 0};
    bool r;

    stack_init(&p); 

    printf("on est ds solve : \n");

    r = solve_rec(m, start, &p);

    if (r) {
        printf("Chemin trouvé ! Nombre de pas : %d\n", p.NbElement);
        
        while (!stack_empty(&p)) {
            coord current = stack_pop(&p);
            set_tag(m, current, "o");
            printf("Case marquée : (%d, %d)\n", current.x, current.y);
        }
    } else {
        printf("Impossible d'atteindre la sortie !!!\n");
    }

    stack_free(&p); 
}




void usage(const char *name)
{
  fprintf(stderr, "Usage : %s w h\n", name);
  fprintf(stderr, "Affiche un labyrinthe de dimension w x h\n");
  fprintf(stderr, "Options :\n");
  fprintf(stderr, " w : largeur du labyrinthe\n");
  fprintf(stderr, " h : hauteur du labyrinthe\n");
}

int main(int argc, char **argv)
{
  maze m;
  int w = (argc > 1 ? atoi(argv[1]) : 10);
  int h = (argc > 2 ? atoi(argv[2]) : 10);

  if (w < 0 || h < 0 || w * h < 2)
  {
    usage(argv[0]);
    exit(EXIT_FAILURE);
  }
  
  init_maze(&m, w, h);

  
  solve(&m);

  print_maze(&m);

  free_maze(&m);


  return 0;
}
