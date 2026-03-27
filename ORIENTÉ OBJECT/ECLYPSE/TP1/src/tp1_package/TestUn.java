package tp1_package;

import in.keyboard.Keyboard;

public class TestUn {
	
	//Instance

    //-------------------Method-------------
    
    //Main Static
    
	public static void main(String[] args) {
		System.out.println("Salut tous !!!");
		System.out.print("Votre Numéro de Compte : "); 
		int num_compt = Keyboard.getInt();
		System.out.print("Votre Solde : "); 
		int solde = Keyboard.getInt();
		System.out.print("Deposer ? :  "); 
		int depot = Keyboard.getInt();
		System.out.print("Retirer ? : "); 
		int retrait = Keyboard.getInt();
		 
		CompteEnBanque c1 = new CompteEnBanque(solde,num_compt);
		c1.deposer(depot);
		c1.retirer(retrait);
		System.out.println(c1);
		
		
		

	}
	
	
	


		
	
	
	;
	
	
	
	//Fin de la class TestUn
}
