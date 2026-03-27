import java.awt.Graphics;
import java.awt.Color; // Pour donner une couleur à ta tortue !
import javax.swing.JPanel;

public class TortueCanvas extends JPanel {
    private Tortue modele;

    public TortueCanvas(Tortue modele) {
        this.modele = modele;
        this.setBackground(Color.WHITE); // Optionnel : pour mieux voir le dessin
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        int h = this.getHeight();
        int w = this.getWidth();
        int GrdCercle = 100;
        int PtitCercle = 40;


        // On choisit une couleur pour la tortue
        g.setColor(Color.GREEN);

        // Dessine un cercle de 50x50 pixels au centre du panel
        // On soustraimodele 25 (rayon) pour que le cenmodelere du cercle soimodele au centre du panel
        g.fillOval(modele.getX(), modele.getY() , GrdCercle, GrdCercle);
        g.setColor(Color.RED);


        if(modele.getDirection()==1){
            g.fillOval(modele.getX()+30 , modele.getY()-20, 40, 40);
        }else if  (modele.getDirection() == 2){
            g.fillOval(modele.getX()+30,modele.getY()+80, 40, 40);

        }else if (modele.getDirection() == 3){
            g.fillOval(modele.getX()+80,modele.getY()+30, 40 ,40);

        }else{
            g.fillOval(modele.getX()-20,modele.getY()+30, 40 ,40);

        }
    }
}