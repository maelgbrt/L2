package TP3_4;

public class Graal extends Object_Quete {

	//attributs
	private int poids;
	
	//constructeur
	public Graal(String nom, int pv,int poids,String initial) {
		this.nom = nom;
		this.pv = pv;
		this.poids = poids;
		this.initial = initial;
	}
	
	public int getPoids() {
		return poids;
	}
	
	//affichage
	@Override
	public String toString() {
		return  "Le graal est " + nom + " il a " + pv + " de pv et pèse " + poids + " kg.";
	}
}
