with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with piles; use piles;

procedure principal is

   type alphabet_pile is array('a'..'z') of pile;
   tab    : alphabet_pile;
   cc     : Character;
   terme  : Unbounded_String;
   X      : Unbounded_String;
   fini   : Boolean := False;

   procedure afficher_et_vider(P : in out pile) is
   begin
      while not est_vide(P) loop
         depile(P, X);
         Put(To_String(X));
      end loop;
   end afficher_et_vider;

begin

   for C in 'a'..'z' loop
      tab(C) := init_pile;
   end loop;

   Get(cc);  -- on lit le premier caractère

   while not fini loop

      if cc = '*' then
         Get(cc);  -- on lit le caractère après '*'

         if cc = '.' then
            -- fin : on affiche tout
            for C in 'a'..'z' loop
               afficher_et_vider(tab(C));
            end loop;
            fini := True;

         elsif cc in 'a'..'z' then
            -- '*x' : afficher et vider la pile x
            afficher_et_vider(tab(cc));
            Get(cc);  -- on avance                            
         end if;

      elsif cc in 'a'..'z' then
         -- début d'un mot : on récupère le terme complet avec get_terme
         terme := get_terme;
         empile(tab(cc), terme);
         Get(cc);  -- on avance après le terme

      else
         -- caractère ignoré (majuscule, chiffre...)
         Get(cc);
      end if;

   end loop;

end principal;