with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
use Ada.Strings.Unbounded.Text_IO;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with tp3_file;

procedure Main_avec_comm_et_test is

   type Client is record
      nom  : Unbounded_String;
      prod : Character;
      nb   : Integer;
   end record;

   type Stock is array (Character range 'a'..'c') of Integer;

   function Client_Image (C : Client) return String is
   begin
      return "Nom: " & To_String(C.nom) & ", Prod: " & C.prod & ", Nb: " & Integer'Image(C.nb);
   end Client_Image;

   package File_Clients is new tp3_file(T => Client, Image => Client_Image);
   use File_Clients;
   type File_Attente_Prod is array (Character range 'a'..'c') of File_Attente;


   Ma_File : File_Attente_Prod ;
   Mes_Stocks : Stock;
   Choix : Character;
   nbArticle : Integer;
   le_produit : Character;

   -- permet de creer un client avec les inforamtions donnees dans la console
   function recup_client return Client is
      Nouveau_Client : Client;

      begin
      skip_line;
      Put_Line ("Votre Nom : ");
      -- C'est Get_Line pour les Unbounded_String
      Nouveau_Client.nom := Get_Line;

      Put_Line ("Nom du Produit : ");
      Get(Nouveau_Client.prod); -- le get suffit car c'est des entiers ou des charactères

      Put_Line ("Nombre d'exemplaire du produit");
      Get(Nouveau_Client.nb);
   
   return Nouveau_Client;
   end recup_client;



   procedure Simuler_client(f : in out File_Attente_Prod; s: in out stock) is

   Nouveau_Client : Client;
   begin
      
      Nouveau_Client := recup_client;

      --Si il y a assez de stock
      if S(Nouveau_Client.prod) > Nouveau_Client.nb then
         S(Nouveau_Client.prod) := S(Nouveau_Client.prod) - Nouveau_Client.nb;
         Put_Line (To_String(Nouveau_Client.nom) & " servi avec " & Integer'Image(Nouveau_Client.nb)  & " exemplaires de" & Character'Image(Nouveau_Client.prod));

      --Si il n'y pas de stock
      elsif S(Nouveau_Client.prod) = 0 then
         Put_Line (To_String(Nouveau_Client.nom) & " en attente du produit " & Character'Image(Nouveau_Client.prod));
         Ajoute (f(Nouveau_Client.prod), Nouveau_Client);
      
      --Sinon
      else
         Nouveau_Client.nb := Nouveau_Client.nb - S(Nouveau_Client.prod);
         S(Nouveau_Client.prod) := 0;
         Put_Line (To_String(Nouveau_Client.nom) & " partiellement servi - il lui en manque " &  Integer'Image(Nouveau_Client.nb));
         Hyper_Prio (f(Nouveau_Client.prod), Nouveau_Client);
         end if;
   end Simuler_client;

   procedure Simuler_arrivee (f : in out File_Attente_Prod; nb_article : in Integer; P : in Character; S: in out Stock)is
   --Simule l'arrive de nouveau Stock donnee et elimine si necessaire les personnes en attentes
      C : Client;
      begin
      S(P) := S(P) + nb_article; --On ajoute le nb d'article qui arrive au stock deja enregistré
      while S(P) > 0 and not Est_Vide(f(P)) loop --Tt que Stock ne sont pas vide et que les listes d'attente non plus
         Retire(f(P),C);
         if S(P) >= C.nb then -- SI il y a assez de Stock
            S(P) := S(P) - C.nb;
            Put_Line ("CIAO " & To_String(C.nom) & " (servi completement)");
         else -- Si il n'y a a pas assez de stock
            C.nb := C.nb - S(P);
            Hyper_Prio(f(P),C);
            Put_Line ("Client " & To_String(C.nom) & " partiellement servi, il lui en manque encore " & Integer'Image(C.nb));
            S(P) := 0;
         end if;
      end loop;      
   end Simuler_arrivee;

   --affiche les stocks et les listes d'attentes en cours
   procedure Affichage(f:in out File_Attente_Prod; S :in out Stock) is
   begin
   Put_Line ("--- Les Files d'attentes ---");
      Put("File A : "); Affiche (f('a'));
      Put_Line ("");
      Put("File B : "); Affiche (f('b'));
      Put_Line ("");
      Put ("File C : "); Affiche (f('c'));

      Put_Line ("--- Les Stocks ---");
      Put_Line ("Stock A : " & Integer'Image(S('a')));
      Put_Line ("Stock B : " & Integer'Image(S('b')));
      Put_Line ("Stock C : " & Integer'Image(S('c')));
   end Affichage;
begin

   
   Ma_File('a') := file_vide;
   Ma_File('b') := file_vide;
   Ma_File('c') := file_vide;

   Mes_Stocks('a') := 0;
   Mes_Stocks('b') := 0;
   Mes_Stocks('c') := 0;

   nbArticle := 5;
   le_produit  := 'a';


   loop
   Put_Line("===== MENU ====");
   PUT_Line("1 - Simuler l'arrivée d'un nouveau client");
   PUT_Line("2 - Simuler l'arrivé d'un produit en nb exempalire");
   PUT_Line("3 - Quitter");
   Get (Choix);
   case Choix is
      when '1' => Simuler_client(Ma_File,Mes_Stocks);
      when '2' => Simuler_arrivee(Ma_File,nbArticle,le_produit,Mes_Stocks);
      when '3' => Put_Line ("Au revoir");
      when '4' => Affichage(Ma_File,Mes_Stocks);
      WHEN OTHERS => PUT_LINE("Choix Impossible");
   end case;
   exit when Choix = '3';
   end loop;


   
end Main;