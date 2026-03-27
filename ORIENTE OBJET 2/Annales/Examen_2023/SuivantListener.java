import javax.swing.*;
import java.awt.*; // Indispensable pour Color et BorderLayout/GridLayout
import java.awt.event.*; // Indispensable pour ActionListener

public class SuivantListener implements ActionListener{
    private Conway modele;
    private JeuDeLaVieCanvas dessin;
    public SuivantListener (Conway c,JeuDeLaVieCanvas canvas){
        this.modele = c;
        this.dessin = canvas;
    }

    public void actionPerformed (ActionEvent e){
        
        modele.suivant();
        dessin.repaint();
    }
}