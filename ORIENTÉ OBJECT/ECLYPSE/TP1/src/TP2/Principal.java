package TP2;

import in.keyboard.Keyboard;


public class Principal {

	public static void main(String[] args) {
		Livre v1 = new Livre("Hugo","Les misérables",20.5);       // 20.5 euros, nbPages non defini
		Livre v2 = new Livre("Hergé","Tintin au Tibet",8.0, 52);  // 8.00 euros, 52 nbPages
		System.out.println(v1.script());
		System.out.println(v2.script());
		System.out.println(v1 + " est plus cher que " + v2 + " est : " + v1.estPlusCher(v2));
			
		// nouvelle étagere de capacité (taille) 10 livres. Initialement vide 
		Etagere et = new Etagere(10);   // taille ou capacité : 10, nbLivres : 0
		et.ajouter(v1);
		et.ajouter(v2);
		System.out.println("il y a "+ et.getNbLivres()+" livres. Voici la liste : "+ et.toString());
		Livre v3 = et.chercher("Hergé","Tarzan"); 
		if (v3 == null) 
		   System.out.println("Le livre n'est pas dans l'étagère");
		else
		   System.out.println("L'étagère contient le livre : " + v3);
		et.supprimer("Hugo","Les misérables");
		System.out.println("il y a "+ et.getNbLivres()+" livres. Voici la liste : "+ et.toString());
		System.out.println("--------------------------");

		
		
		// nouvelle étagère de capacité illimité. Initialement vide 
		EtagereDeux et2 = new EtagereDeux();   // nbLivres prend valeur 0, vide
		et2.ajouter(v1);
		et2.ajouter(v2);
		Livre v4 = et.chercher("Hergé","Tintin au Tibet"); 
		System.out.println("il y a "+ et2.getNbLivres()+" livres. Voici la liste :  "+ et2.toString());
		if (v4 == null) 
			   System.out.println("Le livre n'est pas dans l'étagère");
			else
			   System.out.println("L'étagère contient le livre : " + v4);
		et2.supprimer("Hugo","Les misérables");
		System.out.println("il y a "+ et2.getNbLivres()+" livres. Voici la liste :  "+ et2.toString());
		
		
		System.out.println("---------------question 7-------------");
		
		Etagere et7 = new Etagere(5);
		et7.ajouter(v1);
		et7.ajouter(v2);
		
		EtagereDeux et8 = new EtagereDeux();
		Livre v8 = new Livre("Markobi","Stariways",8.0, 52);  // 8.00 euros, 52 nbPages
		et8.ajouter(v8);
		System.out.println(et7);
		System.out.println(et8);
		
		et7.transferer(et8);
		
		System.out.println("liste 7 apres : " + et7);
		System.out.println("liste 8 apres : " +et8);
		
		System.out.println("-------question 8 -----------");
		System.out.println(v1.compareA(v8));
		System.out.println("-------question 9 -----------");
		Etagere et9 = new Etagere(10);

		et9.ajouter(v1);
		et9.ajouter(v2);
		et9.ajouter(v8);
		System.out.println(et9);
		et9.ranger();
		System.out.println(et9);
		
		
		
		EtagereDeux et10 = new EtagereDeux();

		et10.ajouter(v1);
		et10.ajouter(v2);
		et10.ajouter(v8);
		System.out.println(et10);
		et10.ranger();
		System.out.println(et10);
		
		
		System.out.println("-------------Question 10-------------");
		Etagere etTableau = new Etagere(10);
		EtagereDeux etListe = new EtagereDeux();
		while(true) {
			System.out.print("1 - Afficher une etagere(tableau)\n");

			System.out.print("2 - Ajouter un livre à etagere(tableau)\n");

			System.out.print("3 - Ranger un livre à etagere(tableau)\n");

			System.out.print("4 - Chercher un livre à etagere(tableau)\n");

			System.out.print("5 - Supprimer un livre à etagere(tableau)\n");

			System.out.print("6 - Transferer l'etagere (tableau) vers étagere (liste)\n");

			System.out.print("7 - Afficher une etagere(liste)\n");

			System.out.print("8 - Ajouter un livre à etagere(liste)\n");

			System.out.print("9 - Ranger un livre à etagere(liste)\n");

			System.out.print("10 - Chercher un livre à etagere(liste)\n");

			System.out.print("11 - Supprimer un livre à etagere(liste)\n");

			System.out.print("12 - Transferer l'etagere (liste) vers étagere (tableau)\n");
			
		    int rep = Keyboard.getInt();

		    Rangeable r = null; 
		    
		    if (rep <= 6) {
		        r = etTableau; 
		    } else {
		        r = etListe;
		    }
		   
		    if (rep == 1 || rep == 7) {
		        System.out.println(r);
		    }
		    
		    // CAS 2 : AJOUTER (2 ou 8)
		    else if (rep == 2 || rep == 8){
		        System.out.print("Auteur ? ");
		        String auteur = Keyboard.getString();
		        System.out.print("Titre ? ");
		        String titre = Keyboard.getString();
		        System.out.print("Prix ? ");
		        Double prix = Keyboard.getDouble();
		        System.out.print("Nb de page ? ");
		        Double nbpage = Keyboard.getDouble(); // Attention ton constructeur attend peut-être un int
		        
		        Livre creation = new Livre(auteur,titre,prix,nbpage);
		        r.ajouter(creation);
		    }
		    
		    else if(rep == 3 || rep == 9) {
		        r.ranger();
		        System.out.println("Etagère rangée !");
		        System.out.println(r);
		    }
		    
		    else if(rep == 4 || rep == 10){
		        System.out.println("Quel livre rechercher-vous ?");
		        System.out.print("Auteur ? ");
		        String auteur = Keyboard.getString();
		        System.out.print("Titre ? ");
		        String titre = Keyboard.getString();
		        System.out.println(r.chercher(auteur, titre));
		    }
		    
		    else if(rep == 5 || rep == 11) {
		        System.out.println("Quel livre voulez-vous supprimer ?");
		        System.out.print("Auteur ? ");
		        String auteur = Keyboard.getString();
		        System.out.print("Titre ? ");
		        String titre = Keyboard.getString();
		        r.supprimer(auteur, titre);
		    }
		    
		    else if (rep == 6) {
		        etTableau.transferer(etListe);
		        System.out.println("Transfert Tableau vers Liste effectué.");
		    }
		    else if (rep == 12) {
		        etListe.transferer(etTableau);
		        System.out.println("Transfert Liste vers Tableau effectué.");
		    }
		}
	
	
	
	
	
	
	
	
	
	
	}
}
