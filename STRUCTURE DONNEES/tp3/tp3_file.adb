WITH Ada.Text_IO;
USE Ada.Text_IO;


package body tp3_file is

  function est_vide (f : in File_Attente) return boolean is
      begin
         return f.tete = file_vide.tete;
   end est_vide;

   procedure Ajoute(f : in out File_Attente; Element : in T) is
       begin
       if est_vide (f) then
         f.tete := new noeud'(Element,null);
         f.dernier := f.tete;
      else
         f.dernier.suiv := new noeud'(Element,null);
         f.dernier := f.dernier.suiv;
      end if;
      end Ajoute;


   procedure Retire(f : in out File_Attente; Element : out T) is
      begin
         if not Est_Vide (f) then
            Element := f.tete.info;
            f.tete := f.tete.suiv;
            if f.tete = null then
            f.dernier := null;
            end if;
         end if;
      end Retire;


     procedure Hyper_Prio (f: in out File_Attente; Element : in T) is
      begin
         if Est_Vide (f) then
         f.tete := new noeud'(Element,null);
         f.dernier := f.tete;
         else
         f.tete := new noeud'(Element,f.tete);
         end if;
      end Hyper_Prio;



  procedure Affiche(f : in File_Attente) is
     pt_int : liste := f.tete; 
   begin
      while pt_int /= null loop
         Put(Image(pt_int.info) & " ");
         pt_int := pt_int.suiv;
      end loop;
      New_Line;
   end Affiche;









end tp3_file;