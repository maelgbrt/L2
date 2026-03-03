with Ada.Text_IO; use Ada.Text_IO;
--  with Ada.Strings.Unbounded; 
--  use Ada.Strings.Unbounded;
--  with Ada.Strings.Unbounded.Text_IO;
--  use Ada.Strings.Unbounded.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Wide_Wide_Text_IO;
--  with annales;

procedure main is
--     package Mon_Affichage_int is new annales (
--      T     => Integer,
--      Image => Integer'Image
--  );
-- Niveau 3 : Les feuilles


   type noeud;
   type Arbre is access noeud;
   type noeud is record
      val :  Integer;
      fg, fd : Arbre;
   end record;

   type noeud_liste;
   type liste is access noeud_liste;
   type noeud_liste is record
      n:Integer;
      suiv : liste;
   end record;



   type elem;
   type liste_arb is access elem;
   type elem is record
      n: integer;
      a: arbre;
      suiv: liste_arb;
   end record;


   --  Arbre_vide : constant Arbre := null;



   F5  : Arbre := new Noeud'(5,  null, null);
   F15 : Arbre := new Noeud'(15, null, null);
   F25 : Arbre := new Noeud'(25, null, null);
   F35 : Arbre := new Noeud'(35, null, null);

   -- Niveau 2 : Les nœuds intermédiaires
   N10 : Arbre := new Noeud'(10, F5,  F15);
   N30 : Arbre := new Noeud'(30, F25, F35);

   -- Niveau 1 : La Racine
   Mon_Grand_Arbre : Arbre := new Noeud'(20, N10, N30);

   

   --POur la liste 
   L1 : liste := new noeud_liste'(10,null);
   L2 : liste := new noeud_liste'(45,L1);
   L3 : liste := new noeud_liste'(12,L2);
   L4 : liste := new noeud_liste'(6,L3);

   Ma_Liste : liste := new noeud_liste'(25,L3);


   procedure Affiche(a : in Arbre) is
        begin
        if a /= null then
            Put (a.val);
            Affiche(a.fg);
            Affiche(a.fd);
        end if;
    end Affiche;


   function somme_sup(a : in Arbre; Element : in Integer) return Integer is
    res : Integer := 0;
    begin
      if a /= null then
         if a.val >= Element then
            res := res + a.val + somme_sup (a.fg, Element) + somme_sup (a.fd, Element);
         else
            res := res + somme_sup (a.fg, Element)+  somme_sup (a.fd,Element);
         end if;
      end if;
      return res;
    end somme_sup;



    function mega_somme(L : liste_arb) return liste is
      begin
      if L /= null then
         return new noeud_liste'(somme_sup (L.a,L.n),mega_somme (L.suiv));
      else
      return null;
      end if;
   end mega_somme;


   procedure Affiche_liste (l : in liste) is
begin
   if l /= null then 
      -- On précise qu'on veut le Put pour les ENTIERS
      Ada.Integer_Text_IO.Put(Item => l.n, Width => 1);
      
      -- On précise qu'on veut le saut de ligne de Text_IO
      Ada.Text_IO.New_Line; 
      
      Affiche_liste(l.suiv);
   end if;
end Affiche_liste;


begin
Affiche (Mon_Grand_Arbre);
Put_Line ("");
Put(somme_sup (Mon_Grand_Arbre, 30));
Put_Line ("");
Affiche_liste(Ma_Liste);







end main;