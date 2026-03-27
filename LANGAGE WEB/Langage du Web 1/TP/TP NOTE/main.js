const nav = document.querySelector("nav");
const links_nav = nav.querySelectorAll("div");
const emplacement_donnees = document.querySelector("#emplacement_donnees");
let movies;
let genres;
const nb_film_emplacement = document.querySelector(".nb_film");
const button_tri = document.querySelector("#tri")
const list_tri = document.querySelector(".type");
const list_genres = document.querySelector(".genre")

links_nav.forEach(link_nav =>{
    link_nav.addEventListener("click", () => {
        link_nav.classList.add("activate");
        other(link_nav);
        if (link_nav.textContent == "Movies"){
            affichageMovies(movies);
        }
        else if (link_nav.textContent =="Genres" ){
            affichageGenres();
        }
        else{
            affichageAdmin();
        }
    })
})

function other(link){
    links_nav.forEach(other => {
        if(other != link){
            other.classList.remove("activate");
        }
    })
}


function affichageMovies(datas) {
    let html = "";
    let oui_non ="non";
    let nb_film=0;
    emplacement_donnees.innerHTML = "";
    datas.forEach(data => {
        nb_film ++;
        if(data.animation == true){
            oui_non = "oui"
        }
        html += `
        <div class="movie">
            <h2>Titre du film : ${data.title}</h2>
            <h3>Réalisateur : ${data.director}</h3>
            <p>Année : ${data.year}</p>
            <p>Animation : ${oui_non}</p>
            Genres :
            <ul>
        `;
        data.genres.forEach(genre => {
            html += `<li>${genre}</li>`;
        });
        html += "</ul></div>";
    });
    nb_film_emplacement.innerHTML = `Nombre de film : ${nb_film}`;

    emplacement_donnees.innerHTML = html;
}

function affichageGenres(){
    emplacement_donnees.innerHTML="Genres";
}
function affichageAdmin(){
    let html;
    html =`
    <div class="erreur"></div>
    <input type="text" class="recup" name="annee" placeholder="Année">
    <input type="text" class="recup" name="director" placeholder="Director">
    <input type="text" class="recup" name="animation" placeholder="Animation">
    <input type="text" class="recup" name="titre" placeholder="Titre">
    <button>Submit</button>
    `;
    genres.forEach(genre=>{
html += `<label><input type="checkbox" name="genres" value="${genre}">${genre}</label>`;
    })
    emplacement_donnees.innerHTML = html;
    form();
}





function recuperation_Movies() {
     axios.get("http://51.83.36.122:8080/movies").then(reponse =>{
        affichageMovies(reponse.data);
        movies = reponse.data})
}

function recuperation_Genres() {
     axios.get("http://51.83.36.122:8080/genres").then(reponse =>{
        console.log(reponse.data);
        genres = reponse.data
        tri_genre();})
}

recuperation_Movies();
recuperation_Genres();


button_tri.addEventListener("click", () =>
{
    list_tri.style.display= list_tri.style.display === "flex" ? "none" : "flex" ;
})

const choix = list_tri.querySelectorAll(".choix");
choix.forEach(choix_unique => {
    choix_unique.addEventListener("click", () =>{
        console.log(choix_unique.textContent)
        tri_donnees(choix_unique.textContent,movies);
        })
})

function tri_donnees(type, donnees) {
    if (type === "Director") {
        donnees.sort((a, b) => a.director.localeCompare(b.director, 'fr'));
    }
    if (type === "Titre"){
        donnees.sort((a, b) => a.title.localeCompare(b.title, 'fr'));
    }


    affichageMovies(donnees);
}

function tri_genre() {
    list_genres.innerHTML = ""; 
    genres.forEach(genre => {
        list_genres.innerHTML += `<li class="choix_genre">${genre}</li>`;
    });

    const li_list_genre = document.querySelectorAll(".choix_genre");

    li_list_genre.forEach(li => {
        li.addEventListener("click", () => {
            const genreChoisi = li.textContent.trim();
            let movies_tri = [];

            movies.forEach(movie => {
                if (movie.genres.includes(genreChoisi)) {
                    movies_tri.push(movie);
                }
            });

            affichageMovies(movies_tri);
        });
    });
}




function form(){
const submit = emplacement_donnees.querySelector("button")

submit.addEventListener("click", () => {
    const titre = document.querySelector('input[name="titre"]');
    const annee = document.querySelector('input[name="annee"]');
    const animation = document.querySelector('input[name="animation"]');
    const director = document.querySelector('input[name="director"]');
    const checkboxes = document.querySelectorAll('input[name="genres"]:checked');

    if (titre.value.trim() === "" || director.value.trim() === "") {
        console.log("Erreur : titre ou réalisateur vide");
        const erreur = document.querySelector(".erreur")
        erreur.textContent = "Erreur : titre ou réalisateur vide";
        }
     else {
        console.log(`titre : ${titre.value}`);
        console.log(`animation : ${animation.value}`);
        console.log(`director : ${director.value}`);
        console.log(`annee : ${annee.value}`);
        
        const genres = Array.from(checkboxes).map(cb => cb.value);
        console.log("genres :", genres);
    }
});

}

const titre = document.querySelector("h1");
let grossit = true;

setInterval(() => {
    if (grossit) {
        titre.style.transform = "scale(1.2)";
    } else {
        titre.style.transform = "scale(1)";
    }
    titre.style.transition = "transform 0.5s ease";
    grossit = !grossit;
}, 2000);

