import java.awt.*;
import java.awt.event.ActionListener;

import javax.swing.*;

public class MinuteurFrame extends JFrame {
    private Minuteur modele;

    public MinuteurFrame (Minuteur m){
        this.modele = m;
        this.setSize(600, 600);
        this.setTitle("Minuteur du Turfu");
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        //fenetre principal
        this.getContentPane().setLayout(new BorderLayout());
        

        //panel north
        JPanel panelNorth = new JPanel(new FlowLayout());
        JLabel texte_duree = new JLabel("Durée : ");
        JTextField minutes = new JTextField("3.0");
        JButton bUpdate = new JButton("Update");
        panelNorth.add(texte_duree);
        panelNorth.add(minutes);
        panelNorth.add(bUpdate);
        this.getContentPane().add(panelNorth, BorderLayout.NORTH);


        //panel south
        JPanel panelSouth = new JPanel(new FlowLayout());
        JButton bStart = new JButton("Start");
        JButton bStop = new JButton("Stop");
        panelSouth.add(bStart);
        panelSouth.add(bStop);
        this.getContentPane().add(panelSouth,BorderLayout.SOUTH);


        //dessin
        MinuteurCanvas dessin = new MinuteurCanvas(modele);
        modele.addPropertyChangeListener(dessin); // <--- CETTE LIGNE EST CRUCIALE

        this.getContentPane().add(dessin,BorderLayout.CENTER);
        
        //actionListener Button
        bUpdate.addActionListener(new UpdateListener(modele,dessin,minutes));
        //actionListener Button
       bStart.addActionListener(e -> modele.StartListener());
        // bStop.addActionListener(new StopListener(modele,dessin));
            bStop.addActionListener(e -> modele.stop());


    }

        

    

    public static void main(String[] args) {
        Minuteur modele = new Minuteur();
        // modele.charger("test.txt");
        MinuteurFrame f = new MinuteurFrame(modele);
        f.setVisible(true);
    }
}