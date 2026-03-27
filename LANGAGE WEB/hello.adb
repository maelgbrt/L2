--import des librairies--
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure TP1 is
----------Initialisation des variables----------
----caractere courant/variable de l'élément----

   cc : Character;
   cp : Character := ' ';
   Taille_mots : Integer := 0 ;
   Nb_mots_3l : Integer := 0 ;
   Nb_mots_3e_Sa : Integer := 0 ;
   Nb_doublons : Integer := 0 ;
   Presence_a : Boolean := False ;
   Nb_e : Integer := 0 ;
   Fin_mot : Boolean := False ;
   Nb_maj : Integer := 0 ;

--------Fin initialisation des variales--------

begin
   ----Obtention du  1er element----
   put_Line("Entrez une phrase se terminant par un point");
   get(cc);

   ----Fin Obtention du  1er element----
   while cc /= '.' loop
      -----------------------------traitement de l'élément--------------------------
      --Réecriture de la phrase avec uniquement les lettre entre f ou s ou F et S--
      if (cc >= 'f' and cc <= 's') or (cc >= 'F' and cc <= 'S') then
         put(cc);
      end if;

      --Comptage doublons--
      if cc = cp and cc /= ' ' then
         Nb_doublons := Nb_doublons + 1 ;
      end if;



      --comptage du nb de mots avec au moins 3e sans a --
      if Nb_e >= 3 and Presence_a = False and Fin_mot = True then
         Nb_mots_3e_Sa := Nb_mots_3e_Sa + 1 ;
      end if;

      --comptage du nb de e dans un mot--
      if cc='e' or cc='E' then
         Nb_e := Nb_e + 1 ;
      end if;


      --Observation s'il y a la presence d'un a dans un mot--
      if cc ='a' or cc = 'A' then
         Presence_a := True ;
      end if;



      --comptage e mots de moins de 3 lettres--
      if Fin_mot = True and Taille_mots <= 3 then
         Nb_mots_3l := Nb_mots_3l + 1 ;
      end if;

        --on regarde si la lettre actuelle une majuscule--
      if (cc >= 'A') and (cc <= 'Z') then
         Nb_maj := Nb_maj + 1 ;
      end if;


      -- Taille et analyse de mots--
      if cc/= ' ' then
         Taille_mots := Taille_mots + 1 ;

      else
         --on réinitialise le compteur quand on finit un mot--
         Taille_mots := 0 ;
         Nb_e := 0 ;
         Fin_mot := False ;
         Presence_a := False ;
      end if;

      --on regarde si la lettre actuelle une majuscule--


      --Test la fin du mot--
      if cc = ' ' or cc = '.' then
         Fin_mot := True;
      end if;

      --Obtention de l'élément suivant--
      cp := cc;
      get(cc);
      --fin de l'obtention--
   end loop;

   --Traitement de l'élément final--
   if (Nb_e >= 3) and (Presence_a = False) then
      Nb_mots_3e_Sa := Nb_mots_3e_Sa + 1 ;
   end if;

   put_Line(Character'Image(cc));
   put_Line("Nombre de doublons:" &Nb_doublons'Image);
   put_Line("Nombre de mots avec au moins 3 e et sans a:" &Nb_doublons'Image);
   put_Line("Nombre de mots de moins de 3 lettres:" &Nb_doublons'Image);
   put_Line("Nombre de Majuscules:" &Nb_doublons'Image);



end TP1;
