with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Recursif_Et_Iteratif is
   type noeud;
type liste is access noeud;
type noeud is record
 x, y: integer;
 b: boolean;
 suiv: liste;
end record;


function bizarre (L : in Liste) return Integer is
   res : Integer := 0;
   nb_true : Integer := 0;
   pt_int : liste := L;
begin
   while pt_int /= null loop
      
      if pt_int.x = pt_int.y then
         res := res + pt_int.x;
      end if;
      
      if pt_int.b then
         nb_true := nb_true +1;
      end if;
      pt_int := pt_int.suiv;
   end loop;
   return res - nb_true;
end bizarre;



function bizarre_recursive (L : in liste) return Integer is
   res : Integer:=0;
      begin
      if L = null then
      res := 0;
      else
      if L.x = L.y then
         res := L.x;
      end if;
      if L.b then
         res := res -1;
      end if;
      res := res + bizarre_recursive (L.suiv);
      end if;
      return res;
   end bizarre_recursive;

L8 : liste := new noeud'(4,0,True,null);
L7 : liste := new noeud'(-3,-3,False,L8);
L6 : liste := new noeud'(5,7,False,L7);
L5 : liste := new noeud'(4,5,True,L6);
L4 : liste := new noeud'(8,7,False,L5);
L3 : liste := new noeud'(6,6,True,L4);
L2 : liste := new noeud'(5,4,True,L3);
Ma_Liste : liste := new noeud'(3,3,False,L2);




begin
Put(bizarre (Ma_Liste));
Put(bizarre_recursive (Ma_Liste));

end Recursif_Et_Iteratif;