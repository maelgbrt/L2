import java.awt.*; 
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent; // LE BON IMPORT ICI
import javax.swing.*;

// Supprime l'import org.w3c.dom...
import javax.swing.*;

import org.w3c.dom.events.MouseEvent;

public class TortueFrame extends JFrame{
    private Tortue modele;

    public TortueFrame (Tortue modele){
        this.modele = modele;
        this.setSize(600,600);
        this.setTitle("Jeu de la Tortue");


        this.getContentPane().setLayout(new BorderLayout());
        //panel south
        JPanel pSouth = new JPanel(new FlowLayout());
        JButton bDroite = new JButton("Droite");
        JButton bGauche = new JButton("Gauche");
        JButton bAvancer = new JButton("Avancer");
        pSouth.add(bDroite);
        pSouth.add(bGauche);
        pSouth.add(bAvancer);
        this.getContentPane().add(pSouth,BorderLayout.SOUTH);

        //dessin
        TortueCanvas dessin = new TortueCanvas(modele);
        this.getContentPane().add(dessin,BorderLayout.CENTER);

        bDroite.addActionListener(e -> {
        modele.tournerDroite();
        System.out.println("droite");
        dessin.repaint();
         });
       
        bGauche.addActionListener(e -> {
        modele.tournerGauche();
        System.out.println("gauche");
        dessin.repaint();
        });

        bAvancer.addActionListener(e -> {
            modele.avancer();
            dessin.repaint();
        });
        
        dessin.addMouseListener(new MouseAdapter() {
    public void mouseClicked(MouseEvent e) {
        System.out.println("yo");
    }
});
    }

    public static void main(String[] args) {
        Tortue modele = new Tortue();
        TortueFrame f = new TortueFrame(modele);
        f.setVisible(true);
    }
}