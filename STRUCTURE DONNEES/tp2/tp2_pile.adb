with System.Dim.Float_IO;
package body tp2_pile is

   procedure Empile(p : in out Pile; Element : in G)is 
      begin
         p := new noeud'(Element,p);
      end Empile;

   procedure Depile(p : in out Pile; Element : out G) is
      begin
         if not est_vide(p) then
            Element := p.info;
            p := p.suiv;
         end if;
      end Depile;

   function est_vide (p : in Pile) return boolean is
      begin
         return p = pile_vide;
      end est_vide;

 procedure Affiche(p : in Pile) is
   pt_int : Pile := p;
begin
   while pt_int /= null loop
      put(Image(pt_int.info) & " ");  -- espace
      pt_int := pt_int.suiv;
   end loop;
   New_Line;
end Affiche;
end tp2_pile;