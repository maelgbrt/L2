package TP2;

public interface Rangeable {
	public int getNbLivres();
	public void ajouter(Livre l);
	public Livre chercher(String auteur,String titre);
	public void supprimer(String auteur,String titre);
	public String toString();
	public void transferer(Rangeable rangeable);
	public void ranger();
}


