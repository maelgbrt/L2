with Ada.Text_IO;                   use Ada.Text_IO;
with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
with tp3_file;

procedure TP3_Gaborit_Negoce is

   type Client is record
      nom  : Unbounded_String;
      prod : Character;
      nb   : Integer;
   end record;

   type Stock is array (Character range 'a' .. 'c') of Integer;

   function Client_Image (C : Client) return String is
   begin
      return
        "Nom: "
        & To_String (C.nom)
        & ", Prod: "
        & C.prod
        & ", Nb: "
        & Integer'Image (C.nb);
   end Client_Image;

   package File_Clients is new tp3_file (T => Client, Image => Client_Image);
   use File_Clients;
   type File_Attente_Prod is
     array (Character range 'a' .. 'c') of File_Attente;

   Ma_File    : File_Attente_Prod :=
     (others => File_vide); -- ON initialise à vide les files d'attente
   Mes_Stocks : Stock :=
     (others =>
        0); -- on initilaise a  les entiers dans les tables 'a', 'b' ...
   Choix      : Character;

   -- On cherche a recupérer les informations données pr créer un novueau client
   function recup_client return Client is
      Nouveau_Client : Client;

   begin
      skip_line;
      Put_Line ("Votre Nom : ");
      Nouveau_Client.nom := Get_Line;

      Put_Line ("Nom du Produit : ");
      Get (Nouveau_Client.prod);

      Put_Line ("Nombre d'exemplaire du produit");
      Get (Nouveau_Client.nb);

      return Nouveau_Client;
   end recup_client;

   -- Simule un nouveau client en le creer avec la fucntion du dessus et regarde dans les stocks
   procedure Simuler_client (f : in out File_Attente_Prod; s : in out stock) is

      Nouveau_Client : Client;
   begin

      Nouveau_Client := recup_client; --> creation du client

      -- SI il y a assez dans les stocks
      if S (Nouveau_Client.prod) > Nouveau_Client.nb then
         S (Nouveau_Client.prod) :=
           S (Nouveau_Client.prod) - Nouveau_Client.nb;
         Put_Line
           (To_String (Nouveau_Client.nom)
            & " servi avec "
            & Integer'Image (Nouveau_Client.nb)
            & " exemplaires de"
            & Character'Image (Nouveau_Client.prod));

      -- Si les Stocks sont vides
      elsif S (Nouveau_Client.prod) = 0 then
         Put_Line
           (To_String (Nouveau_Client.nom)
            & " en attente du produit "
            & Character'Image (Nouveau_Client.prod));
         Ajoute (f (Nouveau_Client.prod), Nouveau_Client);

      -- Si il n'y pas assez dans les stocks
      else
         Nouveau_Client.nb := Nouveau_Client.nb - S (Nouveau_Client.prod);
         S (Nouveau_Client.prod) := 0;
         Put_Line
           (To_String (Nouveau_Client.nom)
            & " partiellement servi - il lui en manque "
            & Integer'Image (Nouveau_Client.nb));
         Hyper_Prio
           (f (Nouveau_Client.prod),
            Nouveau_Client); --> Ajoute le client au debut de la file d'attente pr pas qu'il ait a ré-attendre
      end if;
   end Simuler_client;


   --Simule l'arrivée d'un article
   procedure Simuler_arrivee (f : in out File_Attente_Prod; S : in out Stock) is
      C          : Client;
      nb_article : Integer;
      P          : Character;
   begin

      --> creation de l'article (on aurait pu le mettre dans une sous fonction mais comme il y avait 4 lignes)
      Put_Line ("QUel est le nouvel article ?");
      Get (P);
      Put_Line ("COmbien en est il arrivé ?");
      Get (nb_article);

      S (P) :=
        S (P)
        + nb_article;--ON ajoue le nb_d'article qui vient d'arrivé au stock

      while S (P) > 0 and not Est_Vide (f (P)) loop
         --> Tq que Stocks ne sont pas vide et que les listes d'attente sont pleines
         Retire (f (P), C);
         if S (P) >= C.nb then
            S (P) := S (P) - C.nb;
            Put_Line ("CIAO " & To_String (C.nom) & " (servi completement)");
            Put_Line
              ("Stock " & Character'Image (P) & " : " & Integer'Image (S (P)));

         else
            -- Sinon
            C.nb := C.nb - S (P);
            Hyper_Prio (f (P), C);
            Put_Line
              ("Client "
               & To_String (C.nom)
               & " partiellement servi, il lui en manque encore "
               & Integer'Image (C.nb));
            S (P) := 0;
         end if;
      end loop;
   end Simuler_arrivee;

begin

   loop
      --On Affiche lle menu ds le terminal avec 3 choix possible renvoyant au procedure precedement inscrite
      Put_Line ("");
      Put_Line ("===== MENU ====");
      PUT_Line ("1 - Simuler l'arrivée d'un nouveau client");
      PUT_Line ("2 - Simuler l'arrivé d'un produit en nb exempalire");
      PUT_Line ("3 - Quitter");
      Get (Choix);
      case Choix is
         when '1'    =>
            Simuler_client (Ma_File, Mes_Stocks);

         when '2'    =>
            Simuler_arrivee (Ma_File, Mes_Stocks);

         when '3'    =>
            Put_Line ("Au revoir");

         when others =>
            PUT_LINE ("Choix Impossible");
      end case;
      exit when Choix = '3';
   end loop;

end TP3_Gaborit_Negoce;


--TP finit --> 25 fEVRIER 10H27
--> Mise en page via VSCODE FORMAT REFRACTOR