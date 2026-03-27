WITH Ada.Text_IO, Ada.Strings, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;
USE Ada.Text_IO, Ada.Strings, Ada.Strings.Unbounded, Ada.Strings.Unbounded.Text_IO;

with tp2_pile;

procedure tp2 is
   package tp2_pile1 is new tp2_pile(Integer, Integer'Image); use tp2_pile1;

  FUNCTION Get_Terme RETURN Unbounded_String IS
    -- BUT : Lit le prochain terme significatif en ignorant les séparateurs étendus
    Terme : Unbounded_String := Null_Unbounded_String;
    Cc : Character;
    End_Line : Boolean := False;

BEGIN
    begin
        -- Tenter de lire un caractère
        Get(Cc);
    exception
        -- Si le fichier s'arrête brutalement, on renvoie le signal de fin
        when End_Error => return To_Unbounded_String("=="); 
    end;

    -- Sauter tous les séparateurs : espaces, tabulations (HT), 
    -- sauts de ligne (LF) et retours chariot (CR)
    WHILE Cc = ' ' OR Cc = ASCII.HT OR Cc = ASCII.LF OR Cc = ASCII.CR LOOP 
        Get(Cc);
    END LOOP;

    -- Analyse du caractère trouvé
    IF Cc = '=' THEN
        -- Cas particulier : commence par '=' (soit assignation, soit fin)
        Terme := Terme & Cc;
        
        if not End_Of_File then
            Get(Cc);
            -- Si le caractère suivant est aussi '=', c'est la fin du programme (==)
            IF Cc = '=' THEN
                Terme := Terme & Cc;
            -- Si c'est une lettre, c'est une assignation (ex: =A)
            ELSIF Cc in 'A' .. 'Z' THEN
                Terme := Terme & Cc;
            ELSE
                null; -- Cas isolé, ne devrait pas arriver dans ce contexte strict
            END IF;
        end if;

    ELSE
        -- Cas général : on lit un mot ou un nombre jusqu'au prochain séparateur
        WHILE Cc /= ' ' LOOP
            Terme := Terme & Cc;
            
            if End_Of_Line then
                exit; -- Sortir si on atteint la fin de la ligne
            end if;

            Get(Cc);
            -- On s'arrête si on rencontre un séparateur blanc
            exit when Cc = ' ' or Cc = ASCII.LF or Cc = ASCII.CR;
        END LOOP;
    end if;

    RETURN Terme;
END Get_Terme;-- Variables locales pour la gestion de la pile et du calcul
MonTerme : Unbounded_String;
p : Pile;
Element1 : Integer; -- Première opérande dépilée (droite)
Element2 : Integer; -- Seconde opérande dépilée (gauche)
res : Integer;      -- Résultat temporaire

-- Tableau mémoire pour stocker les variables de A à Z, initialisé à 0
Memoire : array(Character range 'A' .. 'Z') of Integer := (others => 0);
S : Unbounded_String;

begin
    p := Pile_vide;
    Put_Line("Entrez votre calcul RPN (terminez par ==) :");

    LOOP
        -- Récupération du prochain élément à traiter
        MonTerme := Get_Terme;
        S := MonTerme;

        -- Opération : Addition
        if S = "+" then
            Depile(p, Element2); -- On récupère le 2ème nombre entré
            Depile(p, Element1); -- On récupère le 1er nombre entré
            Empile(p, Element1 + Element2); -- On empile le résultat

        -- Opération : Soustraction
        elsif S = "-" then
            Depile(p, Element2); 
            Depile(p, Element1);
            Empile(p, Element1 - Element2);

        -- Opération : Multiplication
        elsif S = "*" then
            Depile(p, Element2);
            Depile(p, Element1);
            Empile(p, Element1 * Element2);

        -- Opération : Division
        elsif S = "/" then
            Depile(p, Element2);
            Depile(p, Element1);
            
            -- Sécurité : Vérification de la division par zéro
            if Element2 /= 0 then
                Empile(p, Element1 / Element2);
            else
                Put_Line("Erreur: Division par zero");
                Empile(p, 0); -- On empile 0 pour ne pas casser la suite du calcul
            end if;

        -- On vérifie la longueur (2 chars) et le format (= suivi d'une lettre)
        elsif Length(S) = 2 and then Element(S, 1) = '=' and then Element(S, 2) in 'A' .. 'Z' then
            Depile(p, res); -- On récupère le résultat du sommet de la pile
            Memoire(Element(S, 2)) := res; -- On le stocke dans le tableau mémoire

        -- Gestion de l'utilisation d'une variable (ex: A)
        -- On vérifie que c'est une lettre seule majuscule
        elsif Length(S) = 1 and then Element(S, 1) in 'A' .. 'Z' then
            Empile(p, Memoire(Element(S, 1))); -- On récupère la valeur en mémoire et on l'empile

        -- Gestion des nombres (Entiers)
        -- Si ce n'est pas un opérateur ni une variable, on suppose que c'est un chiffre
        elsif Length(S) > 0 and then Element(S, 1) in '0' .. '9' then
            Empile(p, Integer'Value(To_String(S))); -- Conversion String vers Integer

        -- Gestion de la fin de boucle
        elsif S = "=" then
            null; -- Ignore un '=' seul s'il traine
         elsif S = "==" then
            null;
        else
            Put_Line("Terme invalide : '" & To_String(S) & "'");
        end if;

        -- Condition d'arrêt explicite
        exit when S = "==";

    END LOOP;

    Put_Line("--- Fin du programme ---");
    Put_Line("Resultat final (contenu de la pile) :");
    Affiche(p);

end tp2;