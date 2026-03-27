package tp1_package;

public class CompteEnBanque {

	
	//attributs
	private int solde;
	private int numCompt;
	
	//constructeur
	public CompteEnBanque() {
		this(0, 27);
	}
	
	public CompteEnBanque(int solde, int numCompt) {
		this.solde = solde;
		this.numCompt = numCompt;
	}
	
	//Method
	public void deposer(int i){
		solde += i;
	}
	
	public void retirer(int i) {
		solde -= i;
	}
	
	public String toString() {
		return ("Compte en Banque numéro " + numCompt + " a un solde de " + solde + "€");
	}
	



}
