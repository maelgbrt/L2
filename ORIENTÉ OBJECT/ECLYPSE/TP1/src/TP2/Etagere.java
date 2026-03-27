package TP2;

public class Etagere implements Rangeable {

	//attribut
	private int nbLivre;
	private Livre[] etagere;

	//constructeurs}
	public Etagere(int capacite) {
		this.nbLivre  = 0;
		this.etagere = new Livre[capacite];
	}
	
	public void ajouter(Livre l) {
		if (nbLivre < etagere.length ) {
			etagere[nbLivre] = l;
			nbLivre = nbLivre + 1;
		}
	}
	
	public int getNbLivres() {
		return nbLivre;
	}
	
	private int chercherPosition(String auteur,String titre) {
		int res = -1;
		Livre l = new Livre(auteur, titre);
	    for (int i = 0; i < nbLivre; i++) {
	        if (etagere[i].equals(l)) {
	           res = i;  
	        }
	    }
		return res;
	}
	
	public Livre chercher(String auteur,String titre) {
		int pos = chercherPosition(auteur, titre);
		Livre res = null;
		if (pos != -1) {
			res = etagere[pos];
		}
		return res;
	}

	
	public void supprimer(String auteur, String titre) {
		int pos = chercherPosition(auteur,titre);
		if (pos != -1) {
			for (int i = pos; i < nbLivre;i++) {
				etagere[i] = etagere[i+1];
			}
			nbLivre = nbLivre - 1;
		}
	}

	
	public String toString() {
		String res = "";
		for (Livre l : etagere) {
			res = res + l + ", ";
		}
		return res;
	}

	@Override
	public void transferer(Rangeable rangeable) {
		for(int i = 0; i<etagere.length;i++) {
			rangeable.ajouter(etagere[i]);
			etagere[i] = null;		
		}
		
	}
	
	public void ranger() {
	    for (int i = 0; i < etagere.length; i++) {
	    	if (etagere[i] != null && etagere[i+1] != null){
	    		if(etagere[i].compareA(etagere[i+1])>0){
	    			Livre pass = etagere[i];
	    			etagere[i] = etagere[i+1];
	    			etagere[i+1] = pass;
	    		}
	    	}
	    }
	}
}

