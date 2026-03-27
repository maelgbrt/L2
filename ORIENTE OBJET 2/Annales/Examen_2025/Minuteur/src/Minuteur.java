import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Minuteur implements Serializable,Runnable {
    // duree du minuteur en minutes
    private double minutes;
    // temps restant en minutes
    private double restant;
    // indique si le minuteur est arrete ou non
    private boolean running;

    private Thread myThread;

    private transient PropertyChangeSupport pcs = new PropertyChangeSupport(this);

    // constructeur par défaut
    public Minuteur() {
        this(3.0);
    }
    // constructeur avec paramètre
    public Minuteur(double minutes) {
        this.minutes = minutes;
        this.restant = minutes;
        this.running = false;
    }

    // --- Getters ---
    public double getMinutes() {
        return minutes;
    }

    public double getRestant() {
        return restant;
    }

    public boolean isRunning() {
        return running; // Corrigé pour retourner l'état réel
    }

    // --- Setters ---
    // On remplace les ";" par des blocs de code
    public void setMinutes(double minutes) {
        this.minutes = minutes;
    }

    public void setRestant(double restant) {
        this.restant = restant;
    }

    public void setRunning(boolean running) {
        this.running = running;
    }

    // --- Méthodes de contrôle ---
    public void start() {
        this.running = true;
        System.out.println("Minuteur démarré.");
    }

    public void stop() {
        this.running = false;
        System.out.println("Minuteur arrêté.");
    }

    // reinitialise le décompte
    public void reset() {
        this.reset(this.minutes);
    }

    // reinitialise le décompte en changeant la duree du minuteur
    public void reset(double minutes) {
        this.setMinutes(minutes);
        this.setRestant(minutes);
        this.setRunning(false); // On l'arrête au reset
    }

    public void sauvegarder(String path){
        try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(path))){
                oos.writeObject(this);
                oos.close();
            }catch(IOException e){
                e.printStackTrace();
            }
    }
public void charger(String path){
    try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(path))){
        Minuteur m = (Minuteur)ois.readObject();
        this.minutes = m.minutes;
        this.restant = m.restant;
        this.running = m.running;
    }catch (IOException | ClassNotFoundException e) { // Gestion des deux erreurs
        e.printStackTrace();
    }
}

    public void StartListener(){
        if((!this.isRunning())&&(myThread == null)){
            myThread = new Thread(this);
            myThread.setDaemon(true);
            myThread.start();
            this.start();
        }
    }

   public void run() {
        while (running && restant > 0) {
            try {
                Thread.sleep(1000);
                double ancienRestant = restant;
                this.restant -= (1.0 / 60.0);
                
                // On prévient tout le monde que "restant" a changé
                if (pcs != null) {
                    pcs.firePropertyChange("restant", ancienRestant, restant);
                }
                System.out.println("ça tourne" + restant);
                if (restant <= 0) { restant = 0; running = false; }
            } catch (InterruptedException e) { running = false; }
        }
        myThread = null;
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
    if (this.pcs == null) {
        this.pcs = new PropertyChangeSupport(this);
    }
    this.pcs.addPropertyChangeListener(listener);
}
}