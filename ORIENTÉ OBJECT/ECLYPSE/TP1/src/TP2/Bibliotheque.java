package TP2;
import java.util.ArrayList;


public class Bibliotheque {


	    private ArrayList<Rangeable> mesEtageres;

	    public Bibliotheque() {
	        this.mesEtageres = new ArrayList<Rangeable>();
	    }

	    public void ajouter(Rangeable r) {
	        this.mesEtageres.add(r);
	    }

	    public Rangeable recuperer(int i) {
	        if (i >= 0 && i< mesEtageres.size()) {
	            return mesEtageres.get(i);
	        } else {
	            return null;
	        }
	    }

	    public int getNbEtagere() {
	        return this.mesEtageres.size();
	    }
	    
	    public String toString() {
	        return "Bibliothèque contenant " + getNbEtagere() + " étagères.";
	    }
	}

