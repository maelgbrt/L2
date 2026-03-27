import javax.swing.*;
import java.awt.*; // Indispensable pour Color et BorderLayout/GridLayout
import java.awt.event.*; // Indispensable pour ActionListener

public class SupprimerListener extends MouseAdapter{
    private Conway modele;
    private JeuDeLaVieCanvas dessin;

    public SupprimerListener (Conway c, JeuDeLaVieCanvas d){
        this.modele = c;
        this.dessin = d;
    }

    public void mouseClicked(MouseEvent e) {
        int n = modele.getTaille();
        
        // On utilise 'dessin' pour récupérer les dimensions
        int largeur = dessin.getWidth();
        int hauteur = dessin.getHeight();
        
        int cote = Math.min(largeur, hauteur) / n;

        if (cote > 0) {
            int i = e.getX() / cote;
            int j = e.getY() / cote;
            System.out.println("Case cliquée : i=" + i + " j=" + j);
        
            modele.toggle(i,j);
            dessin.repaint();
    
        }}



}