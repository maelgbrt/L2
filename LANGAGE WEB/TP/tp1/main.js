var data = null;
const url = "https://swapi.tech/api/people";
axios.get(url)
.then(response => {
tab(response.data.results);
})

container = document.querySelector(".container");

function tab(data){
    const div_peso= document.createElement("div");
    div_peso.className = "div_perso";
    const global_details = document.createElement("div");
    global_details.className = "global_details";

        for (let i = 0; i < data.length; i++) {

            let perso = document.createElement("div");
            perso.className = "perso";
            perso.innerText = data[i].name;
            perso.innerHTML += data[i].uid;
            div_peso.appendChild(perso);
            let test_url = "https://swapi.tech/api/people" + "/" + (i+1);
            perso.addEventListener("click", function() {
                axios.get(test_url)
                .then(response => {
                    global_details.innerHTML = "";
                       let details = document.createElement("div");
                          details.className = "details";
                          console.log(response.data.result.properties);
                    url_planet = response.data.result.properties.homeworld;
                    details.innerHTML = "Name: " + response.data.result.properties.name + "<br>" +
                                        "Birth Year: " + response.data.result.properties.birth_year + "<br>" +
                                        "Height: " + response.data.result.properties.height + "<br>" +
                                        "Mass: " + response.data.result.properties.mass + "<br>" +
                                        "Hair Color: " + response.data.result.properties.hair_color + "<br>" +
                                        "Skin Color: " + response.data.result.properties.skin_color + "<br>" +
                                        "Eye Color: " + response.data.result.properties.eye_color + "<br>" +
                                    response.data.result.properties.films.forEach(element => {
                                        axios.get(element)
                                            .then(response => {
details.innerHTML += "Film: " + response.data.result.properties.title + "<br>";
console.log(response.data.result.properties);
});
                                    });
                                    global_details.appendChild(details);

                    axios.get(url_planet)
                    .then(response => {
                           let details = document.createElement("div");
                                                        details.className = "details";

                        details.innerHTML += "Planet Name: " + response.data.result.properties.name + "<br>" +
                                            "Climate: " + response.data.result.properties.climate + "<br>" +
                                            "Terrain: " + response.data.result.properties.terrain + "<br>" +
                                            "Population: " + response.data.result.properties.population + "<br>"+
                                            "surface_water: " + response.data.result.properties.surface_water + "<br>"+
                                            "orbital_period: " + response.data.result.properties.orbital_period + "<br>"+
                                            "rotation_period: " + response.data.result.properties.rotation_period + "<br>"+
                                            "diameter: " + response.data.result.properties.diameter + "<br>"+
                                            "</p>";
                                            global_details.appendChild(details);
                    })
                })
                
            });
             
        }

 container.appendChild(div_peso);
                 container.appendChild(global_details);
                
    }
 plus_de_perso = document.createElement("div");
                    plus_de_perso.className = "plus_de_perso";
                    plus_de_perso.innerHTML = "<button id='more-button'>See More Characters</button>";
                    container.appendChild(plus_de_perso);



plus_de_perso.addEventListener("click", function() {
    more_perso();
;})

function more_perso(){
for (let i = 2; i <= 9; i++) {
const url2 = "https://swapi.tech/api/people/?page=" + i + "&limit=10";
axios.get(url2)
.then(response => {
donne_enreg(response.data.results);

})
}
console.log(enregst);
tab(enregst);

}
    const enregst = [];

function donne_enreg(data){
    enregst.push(...data);
}