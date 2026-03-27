package tp1_package;

import java.util.* ;


public class Personne {

//attributs
	private String nom;
	private String prenom;
	private String sexe;
	private String etat_civil;
	private int date_nais;
	
	
	//constructeur
	public Personne(String nom,String prenom,String sexe,String etat_civil,int date_nais) {
		this.nom = nom;
		this.prenom = prenom;
		this.sexe = sexe;
		this.etat_civil= etat_civil;
		this.date_nais = date_nais;
	}
	
	//method
	public String toString() {
		return ("Nom : "+nom+"\nPrenom : "+prenom+"\nSexe : "+sexe+"\nSituation : "+etat_civil+"\nDate de Naissance : "+date_nais + "\nAge :"+age());
	}
	
	
	//method
	public int age() {
		GregorianCalendar aujourDHui = new GregorianCalendar ( ) ;
		int anneeCourante = aujourDHui.get(Calendar.YEAR ) ;
		return anneeCourante - date_nais;
}
	
	public boolean estPlusAge(Personne p) {
		return age() > p.age();
	}

}

