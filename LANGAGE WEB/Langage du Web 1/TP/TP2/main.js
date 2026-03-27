const buttons = document.querySelectorAll(".button");
const container_donnees = document.querySelector(".donnees");
const tri = document.querySelector(".tri");
const button_filtre = tri.querySelector("button");
const menu_filtre = tri.querySelector("ul");
let donnees_recuperer;

buttons.forEach(button => {
    button.addEventListener("click", () => {
        button.classList.add("activate");
        buttons.forEach(other => {
            if (other !== button) {
                console.log(other);
                other.classList.remove("activate");
            }});
            if (button.classList.contains("demande_donnees")) {
                Charge_Donnees();
                tri.style.display = "flex";
            }
            else if(button.classList.contains("demande_admin")){
                affichage_admin();
                tri.style.display = "none";

            }
        });
    });

function affichage(donnees){
    container_donnees.innerHTML="";
    donnees.forEach(donnee => {
        container_donnees.innerHTML +=`<div class="sport"><h1>${donnee.brand}</h1><p>prix : ${donnee.price}</p><button class="suppr">Supprimer</button></div>`;
    })
    // supprimer();
}

function Charge_Donnees(){
 axios.get("http://51.83.36.122:81/shoes").then(reponse =>{
    affichage(reponse.data);
    donnees_recuperer = reponse.data;
    })
    .catch(erreur => {
        console.error("Erreur :", erreur);
    })

}

Charge_Donnees();

function affichage_admin() {
    container_donnees.innerHTML = `
        <div id="formulaire">
        <input type="text" class="insert nom" placeholder="Nom">
        <input type="text" class="insert prenom" placeholder="Prénom">
        <input type="text" class="insert marque" placeholder="Marque">
        <button class="submit">Envoyer</button>
        <div class="notif"></div>
        </div>
    `;

    const submit = container_donnees.querySelector(".submit");
    const notif = container_donnees.querySelector(".notif");

    submit.addEventListener("click", () => {
        const nom = container_donnees.querySelector(".nom").value;
        const prenom = container_donnees.querySelector(".prenom").value;
        const marque = container_donnees.querySelector(".marque").value;

        if (ajouter(nom, prenom, marque)) {
            notif.innerHTML="Article Ajouté avec Succès ! "
        }
    });
}




function ajouter(description,brand,seller){
    axios.post("http://51.83.36.122:81/add", {
        descr: description,
        brand: brand,
        category: 1,
        color: 143,
        size: 42,
        price: 100,
        seller: seller
    })
    .catch(erreur => {
        console.error("Erreur lors de l'ajout :", erreur);
    })
    return true
}



// MENU DE TRI
button_filtre.addEventListener("click", () => {
menu_filtre.style.display =
  menu_filtre.style.display === "flex" ? "none" : "flex";
});

const choix = menu_filtre.querySelectorAll(".choix");
choix.forEach(choix_unique => {
    choix_unique.addEventListener("click", () =>{
        console.log(choix_unique)
        tri_donnees(choix_unique.textContent,donnees_recuperer);
        })
})




function tri_donnees(type,donnees){
    if(type == "Marque"){
    donnees.sort((a, b) => a.brand.localeCompare(b.brand, 'fr'));
    }
    else if(type == "Couleur"){
        donnees.sort((a, b) => b.color - a.color);
    }
    else if(type == "Prix Croissant"){
        donnees.sort((a, b) => a.price - b.price);
    }
    else if(type == "Prix Decroissant"){
        donnees.sort((a, b) => b.price - a.price);
    }
    else if(type == "Categorie Croissant"){
        donnees.sort((a, b) => a.category - b.category);
    }
    else if(type == "Category Decroissante"){
        donnees.sort((a, b) => b.category - a.category);
    }
    
    affichage(donnees);
}









// function supprimer() {
//   const suppr = document.querySelectorAll(".suppr");
//   suppr.forEach(suppr_unique => {
//     suppr_unique.addEventListener("click", () => {
//       const id = suppr_unique.dataset.id;

//       axios.delete("http://51.83.36.122:81/delete", {
//         data: { id: id }
//       })
//       .then(response => {
//         console.log("Supprimé :", response.data);
//         Charge_Donnees(); // rafraîchir la liste
//       })
//       .catch(error => {
//         console.error("Erreur :", error);
//       });
//     });
//   });
// }