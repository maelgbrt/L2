#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>

#include "maze.h"
#include "coord.h"
#include "stack.h"

void solve(maze *m)
{
  Stack p;
  coord c;
  bool r;

  printf("on est ds solve : \n");

stack_init(&p);
c.x = 0;
c.y = 0;


  coord c1;
  c1.x = 3;
  c1.y = 7;

  coord c2;
  c2.x = 5;
  c2.y = 2;
  
  // 2. On empile (Push)
  stack_push(&p,c);
  stack_push(&p, c1);
  stack_push(&p, c2);
r=true;
// r := solve_rec(m, c, p)
if (r) {
  for(int i = 0; i < p.NbElement; i++) {
    coord current = p.tabElement[i];
      set_tag(m, current, "o");
      
      printf("Case marquée : (%d, %d)\n", current.x, current.y);
    }
  }
  else {
    printf("Impossible d'atteindre la sortie !!!\n");
  }
}



bool solve_rec(maze * m, coord c ,Stack * p){
  bool res;

  if(!is_target(&m,c)){
    coord current;

    neighboors voisin = list_neighboors(m,c);
    coord prec = stack_pop(p);
    stack_push(c);

    if(voisin.north){
      current.x = c.x;
      current.y = c.y-1;
      if (!equal(current,prec)){
        return solve_rec(m,current,p);

    }
 

  }else{
    printf("Bravo ! Vous avez reusssi !!"); 
    stack_push(&p,c);
    res = true
  }
  return res;
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
  coord c;
  
  init_maze(&m, w, h);
  c.x = 1;
  c.y = 3;
  set_tag(&m, c, "o");
  


  
  bool res= is_target(&m,c);
  printf("Your boolean variable is: %s", res ? "true\n" : "false\n");
  
  
  mark_neighboors(&m,c);

  Stack p;

  stack_init(&p);
  
  coord c1;
  c1.x = 3;
  c1.y = 7;

  coord c2;
  c2.x = 5;
  c2.y = 2;
  
  // 2. On empile (Push)
  stack_push(&p, c1);
  stack_push(&p, c2);
  // stack_push(&p, c3);


  stack_empty(&p);
  solve(&m);

  print_maze(&m);

  free_maze(&m);


  return 0;
}
