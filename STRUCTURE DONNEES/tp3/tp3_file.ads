generic
   type T is private; 
   with function Image (Element : in T) return String;

package tp3_file is

   type File_Attente is private;
   File_vide : constant File_Attente;

      
   function Est_Vide(f: in File_Attente) return Boolean;
   procedure Ajoute(f : in out File_Attente; Element : in T);
   
     procedure Retire(f: in out File_Attente; Element : out T); 
   
     procedure Hyper_Prio (f: in out File_Attente; Element : in T);
     procedure Affiche(f : in File_Attente);

private


   type noeud;
   type liste is access noeud;

   type noeud is record
      info: T;
      suiv: liste;
   end record;

   type File_Attente is record
      tete, dernier: liste;
   end record;

   File_vide : constant File_Attente := (tete => null, dernier => null);

end tp3_file;