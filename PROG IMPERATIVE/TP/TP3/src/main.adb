procedure Main is
   taille_max_livre : constant Integer := 500;
   type Element is (feu, eau, air, terre);
   type Sort is record
      incantation : Unbounded_String;
      elementaire : Element;
      nb_degat : Integer;
   end record;
   type Tab_Sort is array(1..taille_max_livre) of Sort;
   type Tab_Element is array(Element) of Integer;
   type Livre_Sort is record
      chapitres_sort : Tab_Sort;
      nb_sort : Integer;
   end record;


begin

   PROCEDURE Affiche_Menu IS
   BEGIN
      Put_Line("== MENU ==");
      Put_Line("1 - Ajouter un sort (ou son nombre de degats) ");
      Put_Line("2 - Enlever le nombre de dégats d'un sort");
      Put_Line("3 - Afficher le livre de sort");
      Put_Line("4 - Quitter");
   END Affiche_Menu;


   Choix: Integer;














BEGIN
   LOOP
      Affiche_Menu;
      Get(Choix);
      CASE Choix IS
         WHEN 1 => Ajouter_sort(Livre_Sort);
         --WHEN 2 => Enlever_nb_degat(Livre_Sort);
         --WHEN 3 => Afficher_Livre_Sort(Livre_Sort);
         --WHEN 4 => Put_Line("Au revoir !");
         WHEN OTHERS => Put_Line("Choix impossible...");
      END CASE;
      EXIT WHEN Choix = 4;
      END LOOP;




      procedure Ajouter_sort(L : Livre_Sort) is
         Nv_Sort : Sort;
         Put_Line("Comment se nomme votre sort ?");
         Put("Incantation : ");
         Get(Nv_sort.incantation);






end Main;

