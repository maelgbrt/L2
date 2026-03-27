package JEU;

import fr.univsavoie.java.jeu2048.Jeu2048;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RecommencerListener implements ActionListener {
    private Jeu2048 j;

    public RecommencerListener (Jeu2048 j){
        this.j = j;
    }

    public void actionPerformed(ActionEvent e){
        j = new Jeu2048();
    }
}
