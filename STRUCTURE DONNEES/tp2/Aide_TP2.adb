WITH Ada.Text_IO, Ada.Strings, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;
USE Ada.Text_IO, Ada.Strings, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;
 
PROCEDURE Aide_TP2 IS
 
   FUNCTION Get_Terme RETURN Unbounded_String IS
      -- BUT : permet d'obtenir le terme suivant dans la ligne de commande terminee par =
      -- Attention : suppose que chaque terme est separe du suivant par au moins un espace
      -- VALEUR RETOURNEE : une chaine qui represente le terme
      Terme : Unbounded_String := Null_Unbounded_String;
      -- le terme que je construis caractere par caractere et qui sera le resultat
      Cc : Character;
      -- le caractere courant
   BEGIN
      -- obtenir un caractere
      Get(Cc);
      -- sauter tous les espaces
      WHILE Cc = ' ' LOOP
         Get(Cc);
      END LOOP;
      -- prendre les caracteres de l'utilisateur tant que l'on n'est pas sur un espace
      -- les concatener (operateur &) pour creer le terme
      -- le cas du terme = est particulier car il n'est pas suivi d'un espace
      WHILE Cc /= ' ' AND Cc /= '=' LOOP
         Terme := Terme & Cc;
         Get(Cc);
      END LOOP;
      -- cas particulier du = : c'est un terme a part entiere a creer
      IF Cc = '=' THEN
         Terme := Terme & Cc;
      END IF;
      RETURN Terme;
   END Get_Terme;
 
   -- un exemple d'utilisation de cette fonction qui va decouper
   -- une expression complete en termes successifs
   MonTerme : Unbounded_String; -- contiendra les termes successifs
 
BEGIN
   Put_Line("Entre une ligne complete pour que j'affiche chaque terme : ");
   LOOP
      MonTerme := Get_Terme;
      Put(MonTerme);
      New_Line;
      EXIT WHEN MonTerme = "=";
      -- schema repeter ou tous les termes sont a traiter de la meme maniere
   END LOOP;
END Aide_TP2;