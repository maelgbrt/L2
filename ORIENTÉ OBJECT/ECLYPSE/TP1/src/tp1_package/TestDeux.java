package tp1_package;


public class TestDeux {

	public static void main(String[] args) {
		Personne p1 = new Personne("Gaborit","Mael","Homme","Célibataire",2006);

		Personne p2 = new Personne("Negoce","Matelian","Homme","Célibataire",2005);
		
		System.out.println(p1 + "\nest plus age que\n" + p2 + "\nest : " + p1.estPlusAge(p2));
		
	}

}
