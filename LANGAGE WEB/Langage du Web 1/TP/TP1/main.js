
const container = document.querySelector("#container");
const envoyer = document.querySelector("#inser button");
const inputMarque = document.querySelector("#inser input"); 
const inputSeller = document.querySelector("#inser input[name=seller]"); 
const inputDescr = document.querySelector("#inser input[name=descr]"); 

const nav = document.querySelector("nav");
const input_nav = nav.querySelector("input");
const rechercher = nav.querySelector("button");

chaussure = [];


function chargeChaussure(){
 axios.get("http://51.83.36.122:81/shoes").then(reponse =>{

                affichage(reponse.data);
                chaussure = reponse.data
    })
    .catch(erreur => {
        console.error("Erreur :", erreur);
    })

}

chargeChaussure();


function ajouterChaussure(brand_input,descr,seller) {
    axios.post("http://51.83.36.122:81/add", {
        descr: descr,
        brand: brand_input,
        category: 1,
        color: 143,
        size: 42,
        price: 100,
        seller: seller
    })
    .then(reponse => {
        console.log("Ajout réussi :", reponse.data);
            chargeChaussure();                           // Puis on recharge les chaussures

    })
    .catch(erreur => {
        console.error("Erreur lors de l'ajout :", erreur);
    })
    .finally(() => {
        console.log("Ajout terminé, quoi qu'il arrive.");
    });
}


function create(elementTag, parent,inner,classe) {
    const element = document.createElement(elementTag); 
    element.classList.add(classe);

    const Title = document.createElement("h2");
    Title.innerHTML = inner.brand;       
    element.appendChild(Title);

    const Descr = document.createElement("p");
    Descr.innerHTML = inner.descr;
    element.appendChild(Descr);
    parent.appendChild(element);
}



function tri(){
    const recherche = input_nav.value.toLowerCase(); // récupère le texte tapé
    container.innerHTML = ""; // on vide le container

    const resultat = chaussure.filter(item =>item.brand.toLowerCase().includes(recherche));

    affichage(resultat); // on affiche les résultats filtrés
}


function affichage(data){
            container.innerHTML="";

    for (let i = 0; i < data.length ; i++){
        create("div",container,data[i],"bloc");
    }

}

envoyer.addEventListener("click", () => {
    ajouterChaussure(inputMarque.value,inputDescr.value,inputSeller.value);  // On attend que l'ajout soit fait
});


input_nav.addEventListener("input", () => {
    tri(); // On lance la fonction tri à chaque caractère tapé
});
