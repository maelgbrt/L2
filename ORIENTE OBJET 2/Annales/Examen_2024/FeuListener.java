import java.awt.event.*; // Pour MouseAdapter et MouseEvent
import javax.swing.*;
import java.awt.*;

public class FeuListener extends MouseAdapter {
    private CercleCanvas rouge;
    private CercleCanvas orange;
    private CercleCanvas vert;
    private FeuRouge feuRouge;
    private JLabel NbCycles;

    public FeuListener(CercleCanvas rouge, CercleCanvas orange, CercleCanvas vert, FeuRouge feuRouge, JLabel NbCycles) {
        this.rouge = rouge;
        this.orange = orange;
        this.vert = vert;
        this.feuRouge = feuRouge;
        this.NbCycles = NbCycles;
        System.out.println("FeuListener créé avec succès !");
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        Object source = e.getSource(); // Juste pour éviter un warning de variable non utilisée
        if (feuRouge.isManuel()) {
            if (source == rouge) {
                System.out.println("Cercle rouge cliqué !");
                feuRouge.setEtat(Color.RED);
            } else if (source == orange) {
                System.out.println("Cercle orange cliqué !");
                feuRouge.setEtat(Color.ORANGE);
            } else if (source == vert) {
                System.out.println("Cercle vert cliqué !");
                feuRouge.setEtat(Color.GREEN);
            }
            NbCycles.setText("Nombre de cycles : " + feuRouge.getNbCycles());
            rouge.repaint();
            orange.repaint();
            vert.repaint();
            feuRouge.sauver("feuRouge.ser"); // Sauvegarde à chaque changement d'état
        }
    }
}