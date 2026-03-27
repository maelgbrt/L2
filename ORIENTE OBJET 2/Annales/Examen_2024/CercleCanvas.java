import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Graphics;

class CercleCanvas extends JPanel implements PropertyChangeListener {

    private Color couleur;
    private FeuRouge feuRouge;

    public CercleCanvas(Color couleur, FeuRouge feuRouge) {
        this.couleur = couleur;
        this.feuRouge = feuRouge;
        feuRouge.addPropertyChangeListener(this);
    }

    public CercleCanvas(Color couleur) {
        this.couleur = couleur;
    }

    public CercleCanvas() {
        this(Color.WHITE);
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        int w = getWidth();
        int h = getHeight();
        int t = Math.min(w, h) * 8 / 10;

        int x = (w - t) / 2;
        int y = (h - t) / 2;

        if (feuRouge != null && couleur.equals(feuRouge.getEtat())) {
            g.setColor(couleur);
        } else {
            g.setColor(Color.WHITE);
        }

        g.fillOval(x, y, t, t);
        g.setColor(Color.BLACK);
        g.drawOval(x, y, t, t);
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        this.repaint();
    }
}