package body liste_circu_vecteur is

   function cmpt_coef2 (L : in liste_circu_vecteur) return Integer is
      pt_int : liste_circu_vecteur := L.Suiv;
      res    : Integer := 0;
   begin
      if L = null then
         res := 0;
      else
         loop
            if pt_int.N (2) > 0.0 then
               res := res + 1;
            end if;
            pt_int := pt_int.Suiv;
            exit when L = pt_int;
         end loop;
      end if;
      return res;
   end cmpt_coef2;

   procedure inserer(L : in out liste_circu_vecteur; V : in vecteur) is
            pt_int : liste_circu_vecteur := L;

      begin 
      if L =null then 
         L:= new Noeud_Liste'(V,null);
         L.Suiv := L;
      else
         while pt_int.Suiv /= L loop
            pt_int := pt_int.Suiv;
         end loop;
         L := new Noeud_Liste'(V,L);
         pt_int.Suiv := L;
        end if;
      end inserer;

         
end liste_circu_vecteur;
