   generic
      type T is private;
      with function Image(Element : T) return String;



package annales is



   type Arbre is private;
   Arbre_vide : constant Arbre;

   --  type liste_arb is private;
   --  liste_arb_vide : constant liste_arb;

   procedure Affiche(a : in Arbre);
   function somme_sup(a : in Arbre; Element : in T) return Integer;


   --  procedure Affiche_ts(liste_arb : in liste_arb);

   
   private
   type noeud;
   type Arbre is access noeud;
   type noeud is record
      val :  T;
      fg, fd : Arbre;
   end record;

   Arbre_vide : constant Arbre := null;



   --  type elem;
   --  type liste_arb is access elem;
   --  type elem is record
   --     n: integer;
   --     a: arbre;
   --     suiv: liste_arb;
   --  end record;

   
end annales;