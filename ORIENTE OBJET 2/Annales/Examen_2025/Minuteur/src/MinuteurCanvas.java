import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Graphics;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent; // IMPORT OBLIGATOIRE
import java.beans.PropertyChangeListener; // IMPORT OBLIGATOIRE

public class MinuteurCanvas extends JPanel implements PropertyChangeListener{
    private Minuteur modele;
    

    public MinuteurCanvas(Minuteur m){
        this.modele = m ;
    }

    @Override
protected void paintComponent(Graphics g) {
    super.paintComponent(g);
    int h = getHeight();
    int w = getWidth();
    int t = Math.min(h, w) * 8 / 10;

    // Calcul du ratio : temps restant / temps total
    double restant = modele.getRestant();
    double total = modele.getMinutes();
    System.out.println(total);
    
    // Si total est 3.0 et restant est 1.5, ratio = 0.5 (50%)
    double ratio = (total > 0) ? (restant / total) : 0;
    int a = (int) (ratio * 360);
    double sous = total *2/10;

    if (restant > sous) {
        g.setColor(Color.GREEN);
    } else {
        g.setColor(Color.RED);
    }
    
    // Dessin de l'arc (on part de 90° pour midi, et on tourne en négatif)
    g.fillArc((w - t) / 2, (h - t) / 2, t, t, 90, a);
    
    g.setColor(Color.BLACK);
    g.drawOval((w - t) / 2, (h - t) / 2, t, t);
}

    public void propertyChange(PropertyChangeEvent evt) {
            // Dès qu'on reçoit une notification du modèle, on redessine !
                this.repaint();
                System.out.println("ÇA CAHNGE");
            }        }
