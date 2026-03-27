
import javax.swing.JFrame; // 1. Il faut importer la classe JFrame*
import javax.swing.JPanel; // 2. Il faut importer la classe JPanel*
import javax.swing.JLabel; // 2. Il faut importer la classe JPanel*
import javax.swing.JButton; // 2. Il faut importer la classe JButton*
import java.awt.BorderLayout; // MANQUANT : Pour utiliser BorderLayout
import java.awt.GridLayout; // MANQUANT : Pour utiliser BorderLayout
import java.awt.FlowLayout;   // MANQUANT : Pour utiliser FlowLayout
import javax.swing.*;
import java.awt.*; // Indispensable pour Color et BorderLayout/GridLayout
import java.awt.event.*; // Indispensable pour ActionListener
public class FeuFrame extends JFrame{

    private FeuRouge feuRouge;
    private JLabel NbCycles;

    public FeuFrame(FeuRouge feuRouge){
        this.feuRouge = feuRouge;
        this.setSize(400,600);
        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.setTitle("Le feu Rouge");


        this.setLayout(new BorderLayout());
        //panel south
        JPanel south = new JPanel(new FlowLayout());
        JButton OnOff = new JButton("Auro On/Off");
        NbCycles = new JLabel("Nombre de cycles : " + feuRouge.getNbCycles());
        south.add(OnOff);
        south.add(NbCycles);
        this.getContentPane().add(south, BorderLayout.SOUTH);
        OnOff.addActionListener(e -> {

    feuRouge.setManuel(!feuRouge.isManuel());

    if (feuRouge.isManuel()) {
        OnOff.setText("Auto On");
        System.out.println("Mode manuel activé !");
    } else {
        OnOff.setText("Auto Off");
        feuRouge.startAutomatic();
        System.out.println("Mode automatique activé !");
    }

    feuRouge.sauver("feuRouge.ser");
});

        //panel center
        JPanel center = new JPanel(new GridLayout(3,1));
        Color couleurInitiale = feuRouge.getEtat(); // On peut récupérer la couleur initiale du feu
       // Dans le constructeur de FeuFrame
// On crée les 3 cercles une seule fois
CercleCanvas rouge = new CercleCanvas(Color.RED, feuRouge);
CercleCanvas orange = new CercleCanvas(Color.ORANGE, feuRouge);
CercleCanvas vert = new CercleCanvas(Color.GREEN, feuRouge);

    center.add(vert);
    center.add(orange);
    center.add(rouge);
    this.getContentPane().add(center, BorderLayout.CENTER);

    rouge.addMouseListener(new FeuListener(rouge,orange,vert,feuRouge,NbCycles));
    orange.addMouseListener(new FeuListener(rouge,orange,vert,feuRouge,NbCycles));
    vert.addMouseListener(new FeuListener(rouge,orange,vert,feuRouge,NbCycles));
    
    }

public static void main (String []args){
FeuRouge feuRouge = FeuRouge.restaurer("feuRouge.ser");
    FeuFrame f = new FeuFrame(feuRouge);

    f.setVisible(true);
}

}