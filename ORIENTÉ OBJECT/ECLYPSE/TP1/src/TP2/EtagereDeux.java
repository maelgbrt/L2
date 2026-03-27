package TP2;
import java.util.ArrayList;


public class EtagereDeux implements Rangeable {	
    ArrayList<Livre> etagere = new ArrayList<Livre>();
    
    //methods
    public void ajouter(Livre l){
    	etagere.add(l);
    }
    
	public int getNbLivres() {
		return etagere.size();
	}
	

	
	private int chercherPosition(String auteur,String titre) {
		int res = -1;
		Livre l = new Livre(auteur, titre);
	    for (int i = 0; i < etagere.size(); i++) {
	        if (etagere.get(i).equals(l)) {
	           res = i;  
	        }
	    }
		return res;
	}
	
	public Livre chercher(String auteur,String titre) {
		int pos = chercherPosition(auteur, titre);
		Livre res = null;
		if (pos != -1) {
			res = etagere.get(pos);
		}
		return res;
	}
	
	
	public void supprimer(String auteur, String titre) {
		int pos = chercherPosition(auteur,titre);
		etagere.remove(pos);
	}
	
	
	
	
	
	public String toString() {
		String res = "";
		for (Livre l : etagere) {
			res = res + l + ", ";
		}
		return res;
	}

	public void transferer(Rangeable rangeable) {
		for(Livre l :etagere) {
			rangeable.ajouter(l);	
		}
		etagere.clear();
	}
	
	
	
	
	public void ranger() {
	    for (int i = 0; i < etagere.size()-1; i++) {
	    	if (etagere.get(i) != null && etagere.get(i+1) != null){
	    		if(etagere.get(i).compareA(etagere.get(i+1))>0){
	    			Livre pass = etagere.get(i);
	    			etagere.set(i, etagere.get(i+1));
	    			etagere.set(i+1, pass);
	    		}
	    	}
	    }
	}
}

