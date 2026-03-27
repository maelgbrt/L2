import javax.swing.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Graphics;

public class JeuDeLaVieCanvas extends JPanel implements PropertyChangeListener {
    private Conway modele;

    public JeuDeLaVieCanvas(Conway c) {
        this.modele = c;
        this.modele.addPropertyChangeListener(this);
        this.addMouseListener(new SupprimerListener(modele, this));
    }

    @Override
protected void paintComponent(Graphics g) {
    super.paintComponent(g);
    
    boolean[][] grilleActuelle = modele.getGrille();
    int taille = modele.getTaille();
    
    // 1. Taille d'une case
    int case_pr = Math.min(getWidth(), getHeight()) / taille;


    // 2. CALCUL DU DÉCALAGE (Pour centrer la grille entière)
    // On calcule l'espace restant dans le JPanel et on divise par 2

    for (int i = 0; i < taille; i++) {
        for (int j = 0; j < taille; j++) {
            int x = i * case_pr;
            int y = j * case_pr;
            

            if (grilleActuelle[i][j]) {
                g.setColor(Color.BLACK);
                g.fillOval(x, y, case_pr, case_pr);

            }
            

        }
    }
    modele.sauvegarder("fichier.txt");
}

 public void propertyChange(PropertyChangeEvent evt) {
        this.repaint();
    }
}