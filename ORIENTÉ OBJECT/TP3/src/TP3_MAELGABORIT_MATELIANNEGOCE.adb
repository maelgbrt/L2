WITH Ada.Integer_Text_IO;           USE Ada.Integer_Text_IO;
with Ada.Text_IO;                   use Ada.Text_IO;
with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;




procedure Main is
   taille_max_livre : constant Integer := 500;
   type Element is (feu, eau, air, terre);
   package Element_io is new Ada.Text_IO.Enumeration_IO(Element);
   use Element_io;
   type Sort is record
      incantation : Unbounded_String;
      elementaire : Element;
      nb_degat : Integer;
   end record;
   type Tab_Sort is array(1..taille_max_livre) of Sort;
   type Tab_Element is array(Element) of Integer;
   type Livre_Sort is record
      chapitres_sort : Tab_Sort;
      nb_sort : Integer:=0;
   end record;



--cree un sort et le recupere

   function creer_sort return Sort is
    Nv_Sort : Sort;
begin

    Put_Line("Comment se nomme votre sort ?");

    Put_Line("Incantation : ");
    Skip_Line;
    Get_Line(Nv_sort.incantation);

    Put_Line("Quel type d'élément (feu, eau, air, terre) ?");

    loop
        begin
            Put("Élément : ");

            Get(Nv_Sort.elementaire);

            exit;

        exception
            when others =>
                Put_Line("*** ERREUR DE SAISIE : Veuillez entrer 'feu', 'eau', 'air' ou 'terre'. ***");
                Skip_Line;
        end;
    end loop;


    Put_Line("Nombre de dégat : ");
    Get(Nv_sort.nb_degat);

    return Nv_Sort;
end creer_sort;


--On recherche un sort dans le livre de sort par ordre alphabetique qui recupere sa position ou ca position presumer
procedure recherche (
    Livre    : in Livre_Sort;
    Nom_Sort : in Unbounded_String;
    Pos      : out Integer;
    Trouve   : out Boolean
) is
    Nom_Recherche : constant Unbounded_String := Nom_Sort;
    Nom_Chapitre : Unbounded_String;

    I : Integer := 1;
    Arret : Boolean := False;

begin
    Trouve := False;
    Pos := Livre.nb_sort + 1;

    while I <= Livre.nb_sort and not Arret loop

        Nom_Chapitre := Livre.chapitres_sort(I).incantation;

        if To_String(Nom_Chapitre) >= To_String(Nom_Recherche) then

            Pos := I;
            Arret := True;

            if To_String(Nom_Chapitre) = To_String(Nom_Recherche) then
                Trouve := True;
            end if;
        end if;

        if not Arret then
            I := I + 1;
        end if;

    end loop;

end recherche;




procedure Ajouter_sort(Livre:in out Livre_Sort) is
    sort_ajout : Sort;
    trouve:Boolean;
    Pos:Integer;
begin
    sort_ajout := creer_sort;
    recherche(Livre    => Livre,
              Nom_Sort => sort_ajout.incantation,
              Pos      => Pos,
              Trouve   => trouve);

    if not trouve then
         for I in reverse Pos .. Livre.Nb_Sort loop
            Put(I);
             Livre.chapitres_sort(I+1) := Livre.chapitres_sort(I);
        end loop;

        Livre.chapitres_sort(Pos) := sort_ajout;
        Livre.Nb_Sort := Livre.Nb_Sort + 1;
    end if;

end Ajouter_sort;



   procedure demander_nb_degat(Nom_Sort: out Unbounded_String;Degat:out Integer) is
   begin
      Put_Line("Comment se nomme votre sort ?");
      Put_Line("Incantation : ");
      Skip_Line;
      Get_Line(Nom_Sort);
      Put_Line("Nombre de dégat en moins attribué: ");
      Get(Degat);

   end demander_nb_degat;

   procedure ajouter_degat (Livre : in out Livre_Sort) is
    Nom_A_Modifier : Unbounded_String;
    Degat_A_Ajouter : Integer;
    Pos_Trouvee : Integer;
      Est_Trouve : Boolean;

begin
    demander_nb_degat(
        Nom_Sort => Nom_A_Modifier,
        Degat => Degat_A_Ajouter
    );

    recherche(
        Livre    => Livre,
        Nom_Sort => Nom_A_Modifier,
        Pos      => Pos_Trouvee,
        Trouve   => Est_Trouve
    );

      if Est_Trouve then

         Livre.chapitres_sort(Pos_Trouvee).nb_degat := Livre.chapitres_sort(Pos_Trouvee).nb_degat - Degat_A_Ajouter;
    end if;
end ajouter_degat;


   procedure affiche_livre (Livre : Livre_Sort) is
            begin
      for i in 1..Livre.nb_sort loop
         New_Line;
         Put("===== Sort " & Integer'Image(i) &" =====");
         New_Line;
         New_Line;
         Put("Nom du Sort : ");
         Put(Livre.chapitres_sort(i).incantation);
         New_Line;
         Put("Nombre de Degat : ");
         Put(Livre.chapitres_sort(i).nb_degat);
         New_Line;
         Put("Element : ");
         Put(Livre.chapitres_sort(i).elementaire);
                  New_Line;
Put("===============");
           end loop;
           end affiche_livre;




      procedure Affiche_Menu is
   begin
      Put_Line("== MENU ==");
      Put_Line("1 - Ajouter un sort (ou son nombre de degats) ");
      Put_Line("2 - Enlever le nombre de dégats d'un sort");
      Put_Line("3 - Afficher le livre de sort");
      Put_Line("4 - Quitter");
   end Affiche_Menu;






   Choix:Integer;
	Livre : Livre_Sort;

BEGIN
   LOOP
      Affiche_Menu;
      Get(Choix);
      CASE Choix IS
         WHEN 1 => Ajouter_sort(Livre);
         WHEN 2 => ajouter_degat(Livre);
         WHEN 3 => affiche_livre(Livre);
         --WHEN 4 => Put_Line("Au revoir !");
         WHEN OTHERS => Put_Line("Choix impossible...");
      END CASE;
      EXIT WHEN Choix = 4;
      END LOOP;







end Main;

