package fr.univsavoie.java.swing.tortue;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

/**
 * Une classe pour representer la tortue
 * 
 * La tortue peut avancer, tourner à droite ou tourner à gauche. Elle est à un
 * endroit donné et est orientée dans une direction donnée.
 * 
 * @author Stéphane Talbot
 */
public class Tortue {
    
    /**
     * Support de la notification lors des modifications 
     * des propriétés x, y et direction de la tortue.
     * 
     * Dans la pratique on délègue la gestion des PropertyChangeListener 
     * à une instance de PropertyChangeSupport.
     */
    private PropertyChangeSupport pcs;

	/**
	 * Position de la tortue
	 */
	private int x, y;
	/**
	 * Orientation de la tortue
	 */
	private int direction;
	/**
	 * Constante définissant l'orientation <em>nord</em> pour les tortues.
	 */
	public static final int NORD = 1;
	/**
	 * Constante définissant l'orientation <em>sud</em> pour les tortues.
	 */
	public static final int SUD = 2;
	/**
	 * Constante définissant l'orientation <em>est</em> pour les tortues.
	 */
	public static final int EST = 3;
	/**
	 * Constante définissant l'orientation <em>ouest</em> pour les tortues.
	 */
	public static final int OUEST = 4;

	/**
	 * Construit une tortue (constructeur sans paramètres).
	 * 
	 * La tortue par défaut est créée à la position de coordonnées (0,0) et est
	 * orientée vers le sud (i.e. vers les y positifs).
	 */
	public Tortue() {
		this(0, 0, Tortue.SUD);
	}

	/**
	 * Construit une tortue à une position donnée et avec une orientation
	 * donnée.
	 * 
	 * La tortue est créée à la position de coordonées <em>(x,y)</em> avec
	 * l'orientation, <em>dir</em>.
	 * 
	 * @param x
	 *            entier correspondant à l'abscisse de la tortue,
	 * @param y
	 *            entier correspondant à l'ordonnée de la tortue,
	 * @param dir
	 *            entier correspondant à la direction de la tortue (4
	 *            orientations possibles).
	 * 
	 * @see Tortue#NORD
	 * @see Tortue#SUD
	 * @see Tortue#EST
	 * @see Tortue#OUEST
	 */
	public Tortue(int x, int y, int dir) {
	    // L'instance de PropertyChangeSupport va gérer la gestion des notifications
	    this.pcs = new PropertyChangeSupport(this);
		this.x = x;
		this.y = y;
		this.direction = dir;
	}

	/**
	 * Fait avancer la tortue.
	 * 
	 * La tortue avance de 10 dans la direction où pointe sa tête.
	 * 
	 * @see Tortue#getDirection()
	 * @see Tortue#getX()
	 * @see Tortue#getY()
	 * 
	 */
	public void avancer() {
		switch (this.getDirection()) {
		case NORD:
			this.setY(this.getY() - 10);
			break;
		case EST:
			this.setX(this.getX() + 10);
			break;
		case SUD:
			this.setY(this.getY() + 10);
			break;
		case OUEST:
			this.setX(this.getX() - 10);
			break;
		}
	}

	/**
	 * Renvoie la direction actuelle de la tortue.
	 * 
	 * @return un entier correspondant à une des quatre directions possibles de
	 *         la tortue.
	 * 
	 * @see Tortue#NORD
	 * @see Tortue#SUD
	 * @see Tortue#EST
	 * @see Tortue#OUEST
	 * @see Tortue#direction
	 * @see Tortue#setDirection(int)
	 */
	public int getDirection() {
		return this.direction;
	}

	/**
	 * Renvoie l'abscisse de la tortue.
	 * 
	 * <br>
	 * Remarque : l'axe des abscisses est orienté Ouest → Est
	 * 
	 * @return un entier correspondant à l'abscisse de la tortue.
	 * 
	 * @see Tortue#x
	 * @see Tortue#setX(int)
	 */
	public int getX() {
		return this.x;
	}

	/**
	 * Renvoie l'ordonnée de la tortue.
	 * 
	 * <br>
	 * Remarque : l'axe des ordonnées est orienté Nord → Sud
	 * 
	 * @return un entier correspondant à l'ordonnée de la tortue.
	 * 
	 * @see Tortue#y
	 * @see Tortue#setY(int)
	 */
	public int getY() {
		return this.y;
	}

	/**
	 * Modifie la direction de la tortue.
	 * 
	 * @param d
	 *            un entier correspondant à une des quatre directions possibles
	 *            de la tortue.
	 * 
	 * @see Tortue#NORD
	 * @see Tortue#SUD
	 * @see Tortue#EST
	 * @see Tortue#OUEST
	 * @see Tortue#direction
	 * @see Tortue#getDirection()
	 */
	private void setDirection(int newDir) {
	    int oldDir = this.direction;
		this.direction = newDir;
		// notification de la modification aux listeners
		this.pcs.firePropertyChange("direction", oldDir, newDir);
	}

	/**
	 * Modifie l'abscisse de la tortue.
	 * 
	 * <br>
	 * Remarque : l'axe des abscisses est orienté Ouest --> Est
	 * 
	 * @param x
	 *            entier correspondant à la nouvelle valeur de l'abscisse de la
	 *            tortue,
	 * 
	 * @see Tortue#x
	 * @see Tortue#getX()
	 */
	private void setX(int newX) {
        int oldX = this.x;
        this.x = newX;
        // notification de la modification aux listeners
        this.pcs.firePropertyChange("x", oldX, newX);
	}

	/**
	 * Modifie l'ordonnée de la tortue.
	 * 
	 * <br>
	 * Remarque : l'axe des ordonnées est orienté Nord --> Sud
	 * 
	 * @param y
	 *            entier correspondant à la nouvelle valeur de l'ordonnée de la
	 *            tortue,
	 * 
	 * @see Tortue#y
	 * @see Tortue#getY()
	 */
	private void setY(int newY) {
        int oldY = this.y;
        this.y = newY;
        // notification de la modification aux listeners
        this.pcs.firePropertyChange("y", oldY, newY);
	}

	/**
	 * Fait tourner la tortue d'un quart de tour à droite.
	 * 
	 * @see Tortue#getDirection()
	 * @see Tortue#tournerGauche()
	 * 
	 */
	public void tournerDroite() {
		switch (this.getDirection()) {
		case NORD:
			this.setDirection(Tortue.EST);
			break;
		case EST:
			this.setDirection(Tortue.SUD);
			break;
		case SUD:
			this.setDirection(Tortue.OUEST);
			break;
		case OUEST:
			this.setDirection(Tortue.NORD);
			break;
		}
	}

	/**
	 * Fait tourner la tortue d'un quart de tour à gauche.
	 * 
	 * @see Tortue#getDirection()
	 * @see Tortue#tournerDroite()
	 * 
	 */
	public void tournerGauche() {
		this.tournerDroite();
		this.tournerDroite();
		this.tournerDroite();
	}

    /**
     * @param listener
     * @see java.beans.PropertyChangeSupport#addPropertyChangeListener(java.beans.PropertyChangeListener)
     */
    public void addPropertyChangeListener(PropertyChangeListener listener) {
        pcs.addPropertyChangeListener(listener);
    }

    /**
     * @param listener
     * @see java.beans.PropertyChangeSupport#removePropertyChangeListener(java.beans.PropertyChangeListener)
     */
    public void removePropertyChangeListener(PropertyChangeListener listener) {
        pcs.removePropertyChangeListener(listener);
    }

    /**
     * @param propertyName
     * @param listener
     * @see java.beans.PropertyChangeSupport#addPropertyChangeListener(java.lang.String, java.beans.PropertyChangeListener)
     */
    public void addPropertyChangeListener(String propertyName, PropertyChangeListener listener) {
        pcs.addPropertyChangeListener(propertyName, listener);
    }

    /**
     * @param propertyName
     * @param listener
     * @see java.beans.PropertyChangeSupport#removePropertyChangeListener(java.lang.String, java.beans.PropertyChangeListener)
     */
    public void removePropertyChangeListener(String propertyName, PropertyChangeListener listener) {
        pcs.removePropertyChangeListener(propertyName, listener);
    }

    /**
     * @return
     * @see java.beans.PropertyChangeSupport#getPropertyChangeListeners()
     */
    public PropertyChangeListener[] getPropertyChangeListeners() {
        return pcs.getPropertyChangeListeners();
    }

    /**
     * @param propertyName
     * @return
     * @see java.beans.PropertyChangeSupport#getPropertyChangeListeners(java.lang.String)
     */
    public PropertyChangeListener[] getPropertyChangeListeners(String propertyName) {
        return pcs.getPropertyChangeListeners(propertyName);
    }
}
