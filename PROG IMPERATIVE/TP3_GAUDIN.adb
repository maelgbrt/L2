with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Ada.Text_IO.Enumeration_IO; use Ada.Text_IO.Enumeration_IO; ***ne pas mettre***
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Principale is
 --But de la procedure Principale : Permet de Manipuler un Livre et fait appel plusieures procedure internes : 
    --Affiche_Menu : Afficher le menu pour l'utilisateur
    --Ajout_Sort_or_Degat : Permet d'ajouter un sort ou de modifier le nb de degats d'un sort
    --Enleve_Degat : Permet de retirer des dégâts à un sort et même de supprimer le sort si degat = 0
    --Affiche_Liste_Sort : Affiche la liste des sorts dans le Livre
 --Schéma Utilisé : REPETER
    N: CONSTANT Integer := 100;

   TYPE Element_Sort IS (Terre, Eau, Air, Feu);
   PACKAGE Element_Sort_io is new enumeration_io(Element_Sort);
   Use Element_Sort_io;

   TYPE Sort IS RECORD
      Incant: Unbounded_String;
      Elem: Element_Sort;
      Degat: Integer;
   END RECORD;

   TYPE Tab_Sort IS ARRAY (1..N) OF Sort;
   TYPE Tab_Element IS ARRAY (Element_Sort) OF Integer;

   TYPE Livre IS RECORD
      Tab: Tab_Sort;
      Nb_Sort: Integer;
   END RECORD;

   L: Livre; 
   S1: Sort;
   Incant, Nom_Sort : Unbounded_String; -- a suppr?
   Choix, Nb_Increment, Nb_Decrement: Integer; -- a suppr?

   PROCEDURE Affiche_Menu IS
    --But de la procedure Affiche_Menu : Afficher le menu de choix pour l'utilisateur dans la console
   BEGIN
      Put_Line("== Choisissez une opération à effectuer : ==");
      Put_Line("1. Ajouter un sort (ou son nombre de dégâts)");
      Put_Line("2. Enlever le nombre de dégâts d'un sort");
      Put_Line("3. Afficher le livre de sort");
      Put_Line("4. Quitter");
   END Affiche_Menu;

    procedure recherche_seq_triee (cherche : in Unbounded_String;
                                   L :in Livre;
                                   y_est :out boolean;
                                   ici: out integer) is 
    --But de la procedure recherche_seq_triee : Permet de rechercher une Unbounded_string dans un tableau trié de ce même type et de mettre a jour des variables reutilisables
   --Schéma Utilisé : TANT QUE
   --IN
      --cherche : l'incantation (ou nom) de notre sort que l'on traite
      --L :  Le Livre qui contient "nos sorts et le nb de sort"
   --OUT
      --y_est : booleen qui indique si on a trouver ou non "cherche"
      --ici : integer qui indique l'endroit où se trouve "cherche" s'il est present, et la place qu'il devrait occuper dans notre Livre s'il est absent.
        trouve : boolean := false;
        indice : integer := 1;
        begin
        while indice <= L.nb_sort and cherche >= L.tab(indice).incant and not trouve loop
            trouve := L.tab(indice).incant = cherche;
            indice := indice + 1;
        end loop;
        y_est := trouve;
        if trouve then
            ici := indice-1;
            new_line;
            put("on a trouvé l'incantation à la page ");
            put(ici);
        else
            ici := indice;
            new_line;
            put("L'incantation recherchée n'appartient pas au Livre, on peut l'inserer à la page ");
            put(ici);
        end if;
        end recherche_seq_triee;



    procedure Ajoute_degats(L : in out Livre;  
                            Nb_Increment :in integer;
                            ici: in integer) is
   --But de la procedure Ajoute_degats : Permet d'augmenter le nombre de dégât d'un sort
   --IN
      --Nb_Increment : Le nombre de dégat que l'on veut ajouter à la valeur actuelle de dégât du sort
      --ici : integer qui indique l'endroit où se trouve "cherche" s'il est present, et la place qu'il devrait occuper dans notre Livre s'il est absent.
   --IN/OUT
      --L : Le Livre qui contient "nos sorts et le nb de sort"
        begin
            L.tab(ici).Degat:=L.tab(ici).Degat + Nb_Increment;
            put("Les dégâts du sort ont été augmentés");
        end Ajoute_degats;



    procedure Ajoute_Sort(L : in out Livre; -- attention sensible à la premiere majuscule!!!!!
                          S1 : in Sort;
                          ici : in integer) is
    --But de la procedure Ajoute_Sort : Permet d'ajouter un sort dans un livre à la bonne position grâce à la variable ici en parametre
   --Schéma Utilisé : POUR
   --IN
      --S1 : Un sort qui l'on souhaite ajouter au "livre trié"
      --ici : integer qui indique l'endroit où se trouve "cherche" s'il est present, et la place qu'il devrait occuper dans notre Livre s'il est absent.
   --IN/OUT
      --L : Le Livre qui contient "nos sorts et le nb de sort"
        begin
        if L.nb_sort < N then
            -- Décalage vers la droite à partir de la fin jusqu'à la valeur de ici
            for J in reverse ici .. L.Nb_Sort loop
                L.Tab(J+1) := L.Tab(J);
            end loop;
            L.tab(ici) := S1;
            L.Nb_Sort := L.Nb_Sort + 1;
        else 
            put("le livre est plein");
        end if;
    end Ajoute_Sort;




    procedure Ajout_Sort_or_Degat (L : in out Livre) is -- get special? comme le nb de increment? -- a supprimer et mettre en variable locale dans ajout et augmente
    --But de la procedure Ajout_Sort_or_Degat : Recupere des informations demandées à l'utilisateur pour soit Ajouter un sort ou bien Augmenter le nombre de dégât d'un sort. en fonction de la presence ou de l'absence du sort dans le Livre
    --appel plusieures procedure de la procedure principale:
    --recherche_seq_triee
    --Ajoute_degats
    --Ajoute_Sort
   --IN/OUT
      --L : Le Livre qui contient "nos sorts et le nb de sort"
        S1 : Sort;           
        y_est : boolean;
        ici : integer;
        Incantation: Unbounded_String;
        Element_in_get: Element_Sort;
        Nb_Increment : Integer;
        begin
        put("l'incantation du sort svp : ex: Abracadabra [1ere lettre en majuscule]");
        new_line;
        Skip_line;
        Incantation := Get_Line;
        recherche_seq_triee(Incantation, L, y_est, ici); --veriier L.tab (pas de i non?)
            if y_est then --mise à jour de degat
                new_line;
                put("le sort est déjà inscrit dans le Livre, de combien voulez vous augmennter ses dégâts? : ");
                get(Nb_Increment);
                Ajoute_degats(L, Nb_Increment, ici);
            else  --ajouter un sort dnas le Livre
                put("le sort n'appartient pas encore au Livre.");
                new_line;
                put("Pour l'ajouter, donner l'element du sort: ");
                new_line;
                get(Element_in_get);
                new_line;
                put("Pour l'ajouter, donner le nombre de degât du sort: ");
                get(Nb_Increment);
                S1.incant := Incantation;
                S1.elem := Element_in_get;
                S1.Degat := Nb_Increment;
                Ajoute_Sort(L, S1, ici);
            end if;
        end Ajout_Sort_or_Degat;






    procedure Enleve_Degat(L : in out Livre) is
    --But de la procedure Enleve_Degat : Permet de diminuer le nombre de dégât d'un sort ou de le supprimer si son nombre de dégat est à 0
    --appel d'une procedure de la procedure principale:
    --recherche_seq_triee
   --Schéma Utilisé : POUR
   --IN/OUT
      --L : Le Livre qui contient "nos sorts et le nb de sort"
                       
        -- 3 cas : degat>0 => reduction des degâts du sort
        --         degat vaut 0 => suppression du sort 
        --         degat<0 => retour message erreur
        Incantation: Unbounded_String;
        Nb_Decrement : Integer;
        y_est : boolean;
        ici : integer;
        begin
        put("l'incantation du sort que vous voulez modifier");
        new_line;
        Skip_line;
        Incantation := Get_Line;
        recherche_seq_triee(Incantation, L, y_est, ici);
        if y_est then
            if L.tab(ici).incant = Incantation then
                new_line;
                put("nombre reduction de degat : " );
                get(Nb_Decrement);
                if L.tab(ici).Degat - Nb_Decrement = 0 then --cas : sort tombe à 0 degât => supprimer
                    -- Décalage pour supprimer le sort
                    for J in ici .. L.Nb_Sort-1 loop
                        L.Tab(J) := L.Tab(J+1);
                    end loop;
                    -- Nettoyage de L.tab(Nb_Sort) non obligatoire car nb_sort est mis à jour  et nous permet de garder le controle sur la stabilité de la lecture du code en ne regardant jamais les indices au dela de nb_Sort
                    L.Nb_Sort := L.Nb_Sort - 1;
                    put("Le sort à une puissance de dégât de 0, il a été supprimé du Livre");
                elsif L.tab(ici).Degat - Nb_Decrement > 0 then -- cas reduction degat du sort
                    L.tab(ici).Degat := L.tab(ici).Degat - Nb_Decrement;
                    put("Reduction de dégat du sort appliquée");
                else                                    --cas où la reduction est trop forte pour le sort, ou erreur utilisateur
                    put("On ne peut soustraire autant de dégats car le sort n'en possède pas tant, rien n'a été modifié dans le Livre."); --voir cas quittez ou appel menu (deja traité je pense par la boucle menu)
                end if;
            end if;
        else 
            put("le sort n'a pas pu subir la reduction de dégât ");
        end if;
        end Enleve_Degat;




    procedure Affiche_Liste_Sort(L : in Livre) is
    --But de la procedure Affiche_Liste_Sort : Afficher la liste des nom des sorts (incantations) d'un Livre.
   --Schéma Utilisé : POUR
   --IN
      --L : Le Livre qui contient "nos sorts et le nb de sort"
    begin
    if L.Nb_Sort = 0 then
        Put_Line("Le livre est vide.");
    else
        Put_Line("Liste des sorts:");
        for I in 1..L.Nb_Sort loop
            Put(I, Width => L.Nb_Sort);
            Put(". ");
            Put(To_String(L.Tab(I).Incant));
            Put(" (Element: ");
            Put(Element_Sort'Image(L.Tab(I).Elem));
            Put(", Degats: ");
            Put(L.Tab(I).Degat, Width => 0);
            Put(")");
            New_Line;
        end loop;
    end if;
    end Affiche_Liste_Sort;



BEGIN
 --******* Mon Livre de Test ********
--   L.Nb_Sort := 3;

--   L.Tab(1).Incant := To_Unbounded_String("Abracadabra");
--   L.Tab(1).Elem := Feu;
--   L.Tab(1).Degat := 50;

--   L.Tab(2).Incant := To_Unbounded_String("Hydroblast");
--   L.Tab(2).Elem := Eau;
--   L.Tab(2).Degat := 35;

--   L.Tab(3).Incant := To_Unbounded_String("Terranova");
--   L.Tab(3).Elem := Terre;
--   L.Tab(3).Degat := 40;
   LOOP
      Affiche_Menu;
      Get(Choix); -- on recupere un integer
      CASE Choix IS
         WHEN 1 => Ajout_Sort_or_Degat(L);
         WHEN 2 => Enleve_Degat(L);
         WHEN 3 => Affiche_Liste_Sort(L);
         WHEN 4 => Put_Line("Au revoir !");
         WHEN OTHERS => Put_Line("Choix impossible...");
      END CASE;
      EXIT WHEN Choix = 4;
   END LOOP;
END Principale;