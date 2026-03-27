with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

procedure main is
   Ligne : String (1 .. 200);
   Long  : Natural;
begin
   Put ("Tape ta phrase : ");  -- message visible
   Get_Line (Ligne, Long);     -- lit la ligne
   Put_Line ("Tu as écrit : " & Ligne (1 .. Long));
end main;
