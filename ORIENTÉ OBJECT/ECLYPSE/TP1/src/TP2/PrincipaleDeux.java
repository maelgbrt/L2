package TP2;
import in.keyboard.Keyboard;

public class PrincipaleDeux {

    public static void main(String[] args) {
        
        Bibliotheque maBiblio = new Bibliotheque();
        
        System.out.println("--- GESTION DE LA BIBLIOTHEQUE ---");

        while(true) {
            System.out.println("\n--------------------------------");
            System.out.println("Il y a actuellement " + maBiblio.getNbEtagere() + " étagères.");
            System.out.println("1. Ajouter une étagère (vide)");
            System.out.println("2. Afficher une étagère");
            System.out.println("3. Ajouter un livre dans une étagère");
            System.out.println("4. Chercher un livre");
            System.out.println("5. Supprimer un livre");
            System.out.println("6. Transférer le contenu d'une étagère vers une autre");
            System.out.println("7. Ranger une étagère");
            System.out.println("8. Quitter");
            System.out.print("Votre choix : ");
            
            int rep = Keyboard.getInt();

            if (rep == 8) {
                System.out.println("Au revoir !");
                break; 
            }

            if (rep == 1) {
                System.out.println("Quel type ? 1 = Tableau (fixe), 2 = Liste (illimitée)");
                int type = Keyboard.getInt();
                
                if (type == 1) {
                    System.out.print("Quelle capacité (taille max) ? ");
                    int taille = Keyboard.getInt();
                    maBiblio.ajouter(new Etagere(taille)); 
                } else {
                    maBiblio.ajouter(new EtagereDeux());
                }
                System.out.println("Étagère ajoutée avec succès !");
            }

            else if (rep >= 2 && rep <= 7) {
                
                if (rep == 6) {
                    System.out.print("Numéro de l'étagère SOURCE (de départ) ? ");
                    int idSource = Keyboard.getInt();
                    System.out.print("Numéro de l'étagère DESTINATION (d'arrivée) ? ");
                    int idDest = Keyboard.getInt();
                    
                    Rangeable source = maBiblio.recuperer(idSource);
                    Rangeable destination = maBiblio.recuperer(idDest);
                    
                    if (source != null && destination != null) {
                        source.transferer(destination);
                        System.out.println("Transfert terminé.");
                    } else {
                        System.out.println("Erreur : Un des numéros d'étagère n'existe pas.");
                    }
                } 
                
                else {
                    System.out.print("Sur quelle étagère travailler (Numéro de 0 à " + (maBiblio.getNbEtagere()-1) + ") ? ");
                    int index = Keyboard.getInt();
                    
                    Rangeable r = maBiblio.recuperer(index);

                    if (r == null) {
                        System.out.println("Erreur : Cette étagère n'existe pas !");
                    } 
                    else {
                        if (rep == 2) { 
                            System.out.println(r);
                        }
                        else if (rep == 3) {
                            System.out.print("Auteur ? ");
                            String aut = Keyboard.getString();
                            System.out.print("Titre ? ");
                            String tit = Keyboard.getString();
                            System.out.print("Prix ? ");
                            double prix = Keyboard.getDouble();
                            System.out.print("Pages ? ");
                            int pg = Keyboard.getInt();
                            r.ajouter(new Livre(aut, tit, prix, pg));
                        }
                        else if (rep == 4) {
                            System.out.print("Auteur cherché ? ");
                            String aut = Keyboard.getString();
                            System.out.print("Titre cherché ? ");
                            String tit = Keyboard.getString();
                            System.out.println(r.chercher(aut, tit));
                        }
                        else if (rep == 5) {
                            System.out.print("Auteur à supprimer ? ");
                            String aut = Keyboard.getString();
                            System.out.print("Titre à supprimer ? ");
                            String tit = Keyboard.getString();
                            r.supprimer(aut, tit);
                        }
                        else if (rep == 7) {
                            r.ranger();
                            System.out.println("Étagère rangée !");
                            System.out.println(r);
                        }
                    }
                }
            }
        }
    }
}