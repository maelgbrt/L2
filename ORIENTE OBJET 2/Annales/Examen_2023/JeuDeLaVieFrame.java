import javax.swing.*;
import java.awt.*; // Indispensable pour Color et BorderLayout/GridLayout
import java.awt.event.*; // Indispensable pour ActionListener

public class JeuDeLaVieFrame extends JFrame {
    // Code de la classe JeuDeLaVieFrame
    private Conway modele;

 
        public JeuDeLaVieFrame(Conway modele) {
            this.modele = modele;
            this.setSize(300,300);
            this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
            this.setTitle("Jeu de la vie");


            this.getContentPane().setLayout(new BorderLayout());

            //panel center
            JeuDeLaVieCanvas dessin = new JeuDeLaVieCanvas(modele);
            this.getContentPane().add(dessin,BorderLayout.CENTER);

            //panel south
            JPanel pSouth = new JPanel(new FlowLayout());
            JButton bSuivant = new JButton("Suivant");
            JButton bAuto = new JButton("Start/Stop");
            pSouth.add(bSuivant);
            pSouth.add(bAuto);
            this.getContentPane().add(pSouth,BorderLayout.SOUTH);

            //les focnrionnalités boutons
        bSuivant.addActionListener(new SuivantListener(modele, dessin));
        bAuto.addActionListener(e ->{
    modele.setManuel(!modele.isManuel());
});
            
    }


        public static void main(String []args){
            Conway m = new Conway();
            m.charger("fichier.txt");
            JeuDeLaVieFrame j =new JeuDeLaVieFrame(m);
            j.setVisible(true);
        }
    }
