with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Characters.Handling;
use Ada.Characters.Handling;


procedure Main is
   cc: Character;
 	MotsansS : Boolean := True;
   nb_doublons : Integer := 0;
   cp : Character := ' ';
   compt_provisoire : Integer := 0;
   EstUnMot : Boolean := False;
   compt : Integer := 0;
   compt_Maj : Integer := 0;
   cpt_e :Integer:=0;
   cpt_mot_avec_e_ss_s : Integer :=0;
begin
   Get(cc);

   -- doublons
   while (cc /= '.') loop
      if (cp = cc) and (cc/= ' ') then
         nb_doublons := nb_doublons +1;
      end if;
   -- fin doublons

      if( cp = ' ') and (cc /= ' ') then
         EstUnMot := True;
         MotsansS := True;
      elsif(cc = ' ') then
         EstUnMot := False;
         if (compt_provisoire <= 3) then
            compt := compt + 1;
         end if;
         compt_provisoire :=0;
      end if;

     if (EstUnMot) then
         compt_provisoire := compt_provisoire +1;
      end if;




        if( Is_Upper(cc)) then
         compt_Maj := compt_Maj +1;
      end if;

      if (EstUnMot) and (MotsansS)then
         if (cc = 'a') then
            MotsansS := False;
         elsif (cc = 'e') then
            cpt_e := cpt_e +1;
         end if;
      else
         cpt_e :=0;
         if (cpt_e >= 3) then
            cpt_mot_avec_e_ss_s := cpt_mot_avec_e_ss_s +1;
            end if;

      end if;


      cp := cc;
      Get(cc);
      Put("Nb provisoire");
      Put (compt_provisoire);
      New_Line;
   end loop;

   if (compt_provisoire <= 3) then
      compt := compt + 1;
   end if;

   Put("nombre de doublons:");
   Put(nb_doublons);
   New_Line;
   Put("Nombre de Mots de 3 caractères ou moins");
   Put(compt);
   New_Line;
   Put("Nombre de Majuscule");
   Put(compt_Maj);
         New_Line;
         Put("Nombre de mot avec min 3 e et pas de s");
           Put(cpt_mot_avec_e_ss_s);


end Main;
