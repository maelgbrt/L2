package JEU;

import fr.univsavoie.java.jeu2048.Jeu2048;

import javax.swing.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

public class JCasePanel extends JPanel implements PropertyChangeListener {
    private int y;
    private int x;
    private Jeu2048 jeu;
    private String ch;
    private JLabel text_bloc;
    private String valeur;

    public JCasePanel(int x, int y, Jeu2048 j){
        this.y = y;
        this.x = x;
        this.jeu = j;
        this.valeur = j.getGrilleString()[x][y];

        text_bloc = new JLabel(jeu.getGrilleString()[x][y]);
        if(!jeu.getGrilleString()[x][y].equals("0")){
            this.setBackground(Color.ORANGE);
            this.setLayout(new BorderLayout());
            this.add(text_bloc);

        }
        text_bloc.setFont(new Font("sans-Serif", Font.BOLD, 40));
        text_bloc.setHorizontalAlignment(JLabel.CENTER);
        text_bloc.setVerticalAlignment(JLabel.CENTER);
        jeu.addPropertyChangeListener(this);



    }

    @Override
    public void propertyChange(PropertyChangeEvent propertyChangeEvent) {
        if(jeu.getGrilleString()[x][y].equals("2")) {
            this.setBackground(Color.ORANGE);
            this.setLayout(new BorderLayout());
            this.add(text_bloc);
            text_bloc.setText(jeu.getGrilleString()[x][y]);
        } else if (jeu.getGrilleString()[x][y].equals("4")) {
            this.setBackground(Color.GREEN);
            text_bloc.setText(jeu.getGrilleString()[x][y]);
        }
        else{
            this.setBackground(Color.WHITE);
            text_bloc.setText("");
        }
    }
}
