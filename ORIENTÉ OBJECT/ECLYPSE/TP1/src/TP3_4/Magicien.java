package TP3_4;

public class Magicien implements Entites{
	private int posX;
	private int posY;
	
	public Magicien() {
	}
	@Override
	public String recupInitial() {
		return "W";
	}
	 
	 public void donnerToutLeGraal(Chevalier c, Entites[] listeGraals) {
	        System.out.println("Le Magicien Merlin utilise sa magie pour invoquer le Graal !");
	        for (Entites e : listeGraals) {
	        	Graal g = (Graal) e;
	        	if (!c.getSac().contains(g)) {
	                c.setBag(g);
	                System.out.println("Merlin vous donne : " + g.getNom());
	            }
	        }
	    }
	 
	public void setPosition(int nouvelleX, int nouvelleY) {
	    	this.posX = nouvelleX;
	    	this.posY = nouvelleY;
	    }
	
	 public int getX() {
		 return posX;
	 }
	 public int getY() {
		 return posY;
	 }
}
