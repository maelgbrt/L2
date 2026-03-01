import java.awt.Color;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.Serializable;
import java.util.Random;
import java.awt.Color;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.*;


public class Conway implements Serializable,Runnable {
private Thread myThread;

    private static final long serialVersionUID = 1L;
    private transient PropertyChangeSupport pcs;
    private boolean[][] grille;
    private int taille;
    private boolean manuel;

    public Conway() { this(20); }

    public Conway(int taille) {
        super();
        this.pcs = new PropertyChangeSupport(this);
        this.taille = taille;
        this.grille = new boolean[taille][taille];
        this.manuel = false;
        
        // --- INITIALISATION (Remplissage aléatoire pour les tests) ---
        Random rand = new Random();
        for (int i = 0; i < taille; i++) {
            for (int j = 0; j < taille; j++) {
                this.grille[i][j] = rand.nextBoolean(); // 50% de cellules vivantes
            }
        }
    }

    public synchronized boolean[][] getGrille() { return grille.clone(); }

    private synchronized void setGrille(boolean[][] grille) {
        this.grille = grille;
        this.taille = grille.length;
        getSafePcs().firePropertyChange("grille", null, this.grille);
    }

    public int getTaille() { return taille; }

    // --- LOGIQUE DU JEU DE LA VIE (Suivant) ---
    public synchronized void suivant() {
        boolean[][] newGrille = new boolean[taille][taille];

        for (int x = 0; x < taille; x++) {
            for (int y = 0; y < taille; y++) {
                int voisins = compterVoisins(x, y);
                
                if (grille[x][y]) {
                    // Cellule vivante : survit si 2 ou 3 voisins
                    newGrille[x][y] = (voisins == 2 || voisins == 3);
                } else {
                    // Cellule morte : naît si exactement 3 voisins
                    newGrille[x][y] = (voisins == 3);
                }
            }
        }
        this.setGrille(newGrille);
    }

    // Méthode utilitaire pour compter les 8 voisins autour d'une cellule
    private int compterVoisins(int x, int y) {
        int count = 0;
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                if (i == 0 && j == 0) continue; // On ne compte pas la cellule elle-même
                
                int nx = x + i;
                int ny = y + j;

                // Vérification des bords de la grille
                if (nx >= 0 && nx < taille && ny >= 0 && ny < taille) {
                    if (grille[nx][ny]) count++;
                }
            }
        }
        return count;
    }

    public synchronized void toggle(int x, int y) {
        if (x >= 0 && x < taille && y >= 0 && y < taille) {
            grille[x][y] = !grille[x][y];
            getSafePcs().firePropertyChange("grille", null, null);
        }
    }

    // Sécurité pour le PropertyChangeSupport (transient)
    private PropertyChangeSupport getSafePcs() {
        if (pcs == null) pcs = new PropertyChangeSupport(this);
        return pcs;
    }

    public void addPropertyChangeListener(PropertyChangeListener l) { getSafePcs().addPropertyChangeListener(l); }
    public void removePropertyChangeListener(PropertyChangeListener l) { getSafePcs().removePropertyChangeListener(l); }


 public void sauvegarder(String Nomfichier) {
    try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(Nomfichier))) {
        oos.writeObject(this);
    } catch (FileNotFoundException e) {
        System.err.println("Erreur : Impossible de créer le fichier " + Nomfichier);
    } catch (IOException e) {
        System.err.println("Erreur lors de la sauvegarde : " + e.getMessage());
    }
}

public void charger(String nomFichier) {
    try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(nomFichier))) {
        Conway modele = (Conway) ois.readObject();
        this.taille = modele.getTaille();
        this.setGrille(modele.getGrille());
        
    } catch (IOException | ClassNotFoundException e) {
        System.err.println("Impossible de charger le fichier : " + e.getMessage());
        this.taille = 20;
        this.grille = new boolean[taille][taille];
        Random rand = new Random();
        for (int i = 0; i < taille; i++) {
            for (int j = 0; j < taille; j++) {
                this.grille[i][j] = rand.nextBoolean();
            }
        }
                this.setGrille(this.grille);

    }


}


public boolean isManuel(){
    return manuel;
}
public void startAutomatic(){
    if ((!this.isManuel()) && (myThread == null)) {
    myThread = new Thread(this);
    myThread.setDaemon(true);
    myThread.start();
}
}

public void run() {
    while (!manuel) {
        try {
            Thread.sleep(1000);
            System.out.println("Changement d'état automatique : ");
            this.suivant();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
    myThread = null; // IMPORTANT
}
}