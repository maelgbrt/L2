package liste_circu_vecteur is
   
   type liste_circu_vecteur is private;
   liste_vect_vide : constant liste_circu_vecteur;
   
   type vecteur is array(1..20) of float;

   function cmpt_coef2 (L : in liste_circu_vecteur) return Integer;
   procedure inserer(L: in out liste_circu_vecteur; V : in vecteur);

private
   type Noeud_Liste;

   type liste_circu_vecteur is access Noeud_Liste;

   liste_vect_vide : constant liste_circu_vecteur := null;

   type Noeud_Liste is record
      N    : vecteur;
      Suiv : liste_circu_vecteur;
   end record;

end liste_circu_vecteur;
