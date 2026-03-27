with Ada.Text_IO;         
use Ada.Text_IO;
with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;

procedure Main is

   type noeud ;
   type liste is access noeud;
   type noeud is record
      info : Integer;
      suivant : liste;
   end record;

   procedure Affiche_Menu is
   begin
      Put_Line("== MENU ==");
      Put_Line("1 - Tester si liste est vide");
      Put_Line("2 - Afficher le premier element");
      Put_Line("3 - Compter nombre d'elements de la liste");
      Put_Line("4 - Afficher la liste");
      Put_Line("5 - Tester si valeur est dans la liste");
      Put_Line("6 - Inserer valeur dans la liste");
      Put_Line("7 - Supprimer element de la liste");
      Put_Line("8 - Quitter");
   end Affiche_Menu;

   Choix : Integer;
   Ma_Liste: liste := new noeud'(info => 10, suivant => new noeud'(info => 20, suivant => new noeud'(info => 30, suivant => null)));


   function est_vide(L : in liste) return Boolean is
   begin
       return L = null;
   end est_vide;

   procedure afficher_premier (L : in out liste) is
   begin
      Put (L.info);
   end afficher_premier;

   function cmpt_elements (L : in out liste) return Integer is
   pt_intermediaire : liste := L ;
   cpt : Integer := 0 ;
   begin
      while pt_intermediaire /= NULL loop
         cpt := cpt + 1 ;
         pt_intermediaire := pt_intermediaire.suivant;
      end loop;
      return cpt;
   end cmpt_elements;


   procedure afficher_liste(L : in out liste) is
   pt_intermediaire : liste := L ;
   begin
   while pt_intermediaire /= NULL loop
   Put (pt_intermediaire.info);
   pt_intermediaire := pt_intermediaire.suivant;
   end loop;
   end afficher_liste;

   function est_ds_liste (L : in liste; val : in Integer) return Integer is
      trouve : Boolean := False ;
      pt_intermediaire : liste := L ;
      res : Integer := -1;
      cpt : Integer := 0;
      begin
      while trouve = False and pt_intermediaire /= NULL loop
         cpt := cpt +1 ;
         trouve := pt_intermediaire.info = val;
         pt_intermediaire := pt_intermediaire.suivant;
      end loop;
      if trouve then
         res := cpt;
      end if;
      return res;
      end est_ds_liste;


   procedure inserer (L : in out liste; val : in Integer; pos : in Integer) is
   pt_intermediaire : liste := L;
   cmpt : Integer := 1 ;
   begin
   if pos = 1 or L = NULL then
      L := new noeud'(val,pt_intermediaire);
      Put("Disposé en position 1");
   else
   while cmpt /= pos -1 and pt_intermediaire.suivant /= null loop
         pt_intermediaire := pt_intermediaire.suivant;
         cmpt := cmpt +1 ;
   end loop;
      pt_intermediaire.suivant := new noeud'(val,pt_intermediaire.suivant);
   end if;
   end inserer;

procedure supprimer(L : in out liste; val : in Integer) is
   Actuel : liste := L;
   Precedent : liste := null;
begin
   while Actuel /= null and Actuel.info /= val loop
      Precedent := Actuel;
      Actuel := Actuel.suivant;
   end loop;

   if Actuel /= null then
      if Precedent = null then
         L := Actuel.suivant;
      else
         Precedent.suivant := Actuel.suivant;
      end if;
      
   end if;
end supprimer;

begin

   LOOP
      New_Line;
      Affiche_Menu;
      Get(Choix);
      CASE Choix IS
         WHEN 1 => 
         if(est_vide(Ma_Liste)) then
            Put_Line ("Est vide");
            Put_Line ("");
         else
            Put_Line("N'est pas vide");
            New_Line;
         end if;
         WHEN 2 => 
         Put ("Le premier élément est");
         afficher_premier(Ma_Liste);
         New_Line ;
         New_Line;
         WHEN 3 => 
            Put("Nombre d'elements : ");
            Put(cmpt_elements(Ma_Liste), 0);
            New_Line;

         WHEN 4 => afficher_liste(Ma_Liste);
         WHEN 5 => Put(est_ds_liste(Ma_Liste,30));
         WHEN 6 => inserer(Ma_Liste,15,6);
         WHEN 7 => supprimer(Ma_Liste,20);
         WHEN 8 => Put_Line("Au revoir !");
         WHEN OTHERS => Put_Line("Choix impossible...");
      END CASE;
      EXIT WHEN Choix = 8;
      END LOOP;

end Main;