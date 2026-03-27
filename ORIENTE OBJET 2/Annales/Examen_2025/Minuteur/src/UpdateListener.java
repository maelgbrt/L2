import java.awt.event.ActionListener;
import java.awt.event.ActionEvent; // <--- CET IMPORT MANQUAIT
import javax.swing.JTextField;

public class UpdateListener implements ActionListener {
    
    private Minuteur modele;
    private MinuteurCanvas dessin;
    private JTextField minutes;

    public UpdateListener(Minuteur m, MinuteurCanvas d,JTextField min){
        this.modele = m;
        this.dessin = d;
        this.minutes = min;
    }


    public void actionPerformed(ActionEvent e) { 
            String texte = minutes.getText();
            double minu = Double.parseDouble(texte);
            modele.setMinutes(minu);
            modele.setRestant(minu);
            dessin.repaint();
            System.out.println("Nouveau temps défini : " + minu);
            modele.sauvegarder("test.txt");
    }
}