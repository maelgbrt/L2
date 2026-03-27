with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with tp3_file; 


procedure main_part1 is
     

     package Integer_package is new tp3_file(T => Integer, Image => Integer'Image);
     use Integer_package;

      Ma_File : File_Attente := File_vide;
      Element: Integer;
         begin
         if Est_Vide (Ma_File) then
         Put ("c vide");
         end if;

         Put_Line ("");
      
         Ajoute(Ma_File,5);

         Ajoute (Ma_File,6);

         Ajoute (Ma_File,7);

         Affiche (Ma_File);

         Retire (Ma_File, Element);

         Put (Integer'Image(Element));
         Put_Line ("");

         Affiche (Ma_File);

         if Est_Vide (Ma_File) then
         Put ("est vide");
         end if;

         Hyper_Prio (Ma_File, 12);

         Affiche (Ma_File);

         if Est_Vide (Ma_File) then
         Put ("c vide");
         end if;
      
      end main_part1;
