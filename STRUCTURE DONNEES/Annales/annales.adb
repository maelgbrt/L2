with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; -- Pour les Integer

package body annales is
    


    procedure Affiche(a : in Arbre) is
        begin
        if a /= null then
            Put (Image(a.val));Element : in Integer
            Affiche (a.fg);
            Affiche (a.fd);
        end if;
    end Affiche;



end annales;