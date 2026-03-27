with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   N : constant Integer := 10;

   type Table is array (0 .. 9) of Integer;
   tableau_de_i : Table;

   type Tablo is array (1 .. N) of Integer;
   tab_nb_donnee : Tablo;

   type Tab_Matrice is array (1 .. N, 0 .. 9) of Integer;

   chiffre_un : Integer;

   function Chiffre(Nb : in Integer; Position : in Integer) return Integer is
   begin
      return (Nb / (10 ** (Position - 1))) mod 10;
   end Chiffre;

   procedure MAJ_Matrice(M : in out Tab_Matrice; Ligne, Col, Valeur : in Integer) is
   begin

   end MAJ_Matrice;

begin
   -- Initialiser le tableau de compteurs
   for I in 0 .. 9 loop
      tableau_de_i(I) := 0;
   end loop;

   -- Lire les 10 nombres
   for V in 1 .. N loop
      Get(tab_nb_donnee(V));
   end loop;

   -- Boucle sur les positions de chiffre (par exemple 4 chiffres max)
   for j in 1 .. 4 loop
      for i in tab_nb_donnee'Range loop
         chiffre_un := Chiffre(tab_nb_donnee(i), j);
         tableau_de_i(chiffre_un) := tableau_de_i(chiffre_un) + 1;
         Put(tableau_de_i);
         New_Line;
      end loop;
   end loop;


end Main;
