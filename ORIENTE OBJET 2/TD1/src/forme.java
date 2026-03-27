import javax.swing.*;
import java.awt.*;

public class forme extends JFrame { // La classe doit hériter de JFrame

    public forme() { // Constructeur
        this.setTitle("Ma Fenêtre");
        this.setSize(400, 300);

        // Définition du Layout
        this.getContentPane().setLayout(new BorderLayout());

        // Création et ajout du bouton
        JButton btest = new JButton("texte du bouton");
        this.getContentPane().add(btest, BorderLayout.SOUTH);

        // Création de Label
        JLabel labelNom = new JLabel("Gaborit");
        JLabel labelAge= new JLabel("19 ans");
        JLabel labelPrenom = new JLabel("Mael");

        //  Création d'un panel
        JPanel panel_center = new JPanel();
        panel_center.setLayout(new GridLayout(2, 4));
        panel_center.add(labelNom);
        panel_center.add(labelPrenom);
        panel_center.add(labelAge);


        this.getContentPane().add(panel_center,BorderLayout.CENTER);
        this.setVisible(true);
    }

    public static void main(String[] args) {
        new forme(); // Lance l'application
    }
}