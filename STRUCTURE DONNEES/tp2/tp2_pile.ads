with Ada.Text_IO; use Ada.Text_IO;

generic
   Type G is private; 
   with function Image (Element : in G) return String;


package tp2_pile is
   
   type Pile is private;
      Pile_vide : constant Pile; 

   procedure Empile(p : in out Pile; Element : in G);
   procedure Depile(p : in out Pile; Element : out G);
   
   function Est_Vide(p : in Pile) return Boolean;
   procedure Affiche(p : in Pile);

private
   type noeud;
   type Pile is access noeud;
   
   type noeud is record
      info : G;
      suiv : Pile;
   end record;

   Pile_vide : constant Pile := null;

end tp2_pile;