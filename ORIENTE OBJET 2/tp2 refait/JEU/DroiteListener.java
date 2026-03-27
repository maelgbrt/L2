package JEU;

import fr.univsavoie.java.jeu2048.Jeu2048;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class DroiteListener implements ActionListener {
    private JPanel p;
    private Jeu2048 j;

    public DroiteListener(JPanel p, Jeu2048 j) {
        this.p = p;
        this.j = j;
    }

    public void actionPerformed(ActionEvent e) {
         System.out.println(j.decaler(j.DROITE));
        System.out.println("Droite");
        // this.p.repaint();
    }
}
