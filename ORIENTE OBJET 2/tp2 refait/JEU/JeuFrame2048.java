package JEU;

import fr.univsavoie.java.jeu2048.Jeu2048;

import java.awt.*;
import javax.swing.*;

public class JeuFrame2048 extends JFrame {
    public static final int HAUTEUR = 800;
    public static final int LARGEUR = 800;

    public JeuFrame2048() {
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setTitle("Jeu du 2048");
        this.setSize(HAUTEUR, LARGEUR);
        this.getContentPane().setBackground(Color.GREEN);
        JPanel p = new JPanel();
        p.setLayout(new GridLayout(4, 4, 2, 2));
        JPanel boutons = new JPanel();
        boutons.setLayout(new FlowLayout());
        JButton bGauche = new JButton("Gauche");
        JButton bAvancer = new JButton("Haut");
        JButton bDroite = new JButton("Droite");
        JButton bBas = new JButton("Bas");
        JButton bRecommencer = new JButton("Recommencer");
        boutons.add(bGauche);
        boutons.add(bBas);
        boutons.add(bAvancer);
        boutons.add(bRecommencer);
        boutons.add(bDroite);
        JPanel infos = new JPanel();
        infos.setLayout(new FlowLayout());
        JLabel score = new JLabel("Score");
        JLabel bestscore = new JLabel("Meilleure Score");
        infos.add(score);
        infos.add(bestscore);
        p.setBackground(Color.GRAY);


// GaucheLIstener l1 = new GaucheLIstener(p);
// bGauche.addActionListener(l1);

        Jeu2048 plato = new Jeu2048();
        String[][] tab = plato.getGrilleString();

        DroiteListener l2 = new DroiteListener(p, plato);
        bDroite.addActionListener(l2);

        RecommencerListener l3 = new RecommencerListener(plato);
        bRecommencer.addActionListener(l3);
        for (int i = 0; i < tab.length; i++) {
            for (int j = 0; j < tab[i].length; j++) {
                p.add(new JCasePanel(i, j, plato));
            }
        }


        this.getContentPane().add(infos, "North");
        this.getContentPane().add(boutons, "South");
        this.getContentPane().add(p, "Center");

    }


    public static void main(String[] args) {
        JFrame f = new JeuFrame2048();
        f.setVisible(true);
    }
}












