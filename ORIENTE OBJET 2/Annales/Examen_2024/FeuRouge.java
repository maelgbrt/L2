import java.awt.Color;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.*;

public class FeuRouge implements Serializable, Runnable {
     private Thread myThread;

    private static final long serialVersionUID = 1L;

    // transient car non sérialisable
    private transient PropertyChangeSupport pcs;

    private Color etat;
    private int nbCycles;
    private boolean manuel;

    public FeuRouge() {
        this.etat = Color.RED;
        this.nbCycles = 0;
        this.manuel = true;
        this.pcs = new PropertyChangeSupport(this);
    }

    // IMPORTANT : recréer pcs après désérialisation
    private void readObject(ObjectInputStream ois) 
            throws IOException, ClassNotFoundException {
        ois.defaultReadObject();
        this.pcs = new PropertyChangeSupport(this);
    }

    // Getters
    public int getNbCycles() {
        return nbCycles;
    }

    public Color getEtat() {
        return etat;
    }

    public boolean isManuel() {
        return manuel;
    }

    // Setters avec notification
    public void setManuel(boolean nouvelleValeur) {
        boolean old = this.manuel;
        if (old != nouvelleValeur) {
            this.manuel = nouvelleValeur;
            pcs.firePropertyChange("manuel", old, nouvelleValeur);
        }
    }

    public void setEtat(Color nouvelEtat) {
        if (nouvelEtat == null) return;

        Color old = this.etat;
        if (!nouvelEtat.equals(old)) {
            this.etat = nouvelEtat;
            pcs.firePropertyChange("etat", old, nouvelEtat);

            if (nouvelEtat.equals(Color.RED)) {
                int oldCycles = nbCycles;
                nbCycles++;
                pcs.firePropertyChange("nbCycles", oldCycles, nbCycles);
            }
        }
    }

    public void changerEtat() {
        if (etat.equals(Color.RED)) {
            setEtat(Color.GREEN);
        } else if (etat.equals(Color.GREEN)) {
            setEtat(Color.ORANGE);
        } else {
            setEtat(Color.RED);
        }
    }

    // Listeners
    public void addPropertyChangeListener(PropertyChangeListener l) {
        pcs.addPropertyChangeListener(l);
    }

    public void removePropertyChangeListener(PropertyChangeListener l) {
        pcs.removePropertyChangeListener(l);
    }

    // Sauvegarde avec nom de fichier paramétrable
    public void sauver(String nomFichier) {
        try (ObjectOutputStream oos =
                     new ObjectOutputStream(new FileOutputStream(nomFichier))) {
            oos.writeObject(this);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Restauration propre
   public static FeuRouge restaurer(String nomFichier) {
    try (ObjectInputStream ois =
                 new ObjectInputStream(new FileInputStream(nomFichier))) {

        return (FeuRouge) ois.readObject();

    } catch (IOException | ClassNotFoundException e) {
        return new FeuRouge(); // si pas de fichier → nouveau feu
    }
}


public void startAutomatic() {
 if (! this.isManuel() && (myThread == null || !myThread.isAlive())) {
 myThread = new Thread(this);
 myThread.setDaemon(true);
 myThread.start();
 
 }

 
}


@Override
public void run() {
    while (!manuel) {
        try {
            Thread.sleep(1000);
            changerEtat();
            System.out.println("Changement d'état automatique : " + etat);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
    myThread = null; // IMPORTANT
}


}