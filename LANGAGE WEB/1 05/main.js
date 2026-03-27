console.log("Hello, World!");

h1 = document.querySelector("h1");
console.log(h1);

h1.textContent = "Hello, Gerard !";

h1.style.color = "#00ff04ff";

function changeColor() {
    var randomColor = Math.floor(Math.random()*16777215).toString(16);
    h1.style.color = "#" + randomColor;
    h1.textContent = "Hello, " + prenoms[Math.floor(Math.random() * prenoms.length)]+" !";

}

const prenoms = [
  "Alice", "Léo", "Emma", "Lucas", "Chloé",
  "Nathan", "Jade", "Hugo", "Lina", "Noah",
  "Mia", "Louis", "Léna", "Gabriel", "Inès",
  "Raphaël", "Zoé", "Ethan", "Manon", "Tom"
];


setInterval(changeColor, 1000);

i = 0;
h1.addEventListener("click", function() {
    i++;
    
count = document.querySelector(".count");
count.innerHTML = "Vous avez cliqué sur le titre " + i + " fois!";
    
});

console.log(i);


button = document.querySelector("button");
button.addEventListener("click", function() {
    alert("You are Gay!");
});


button.addEventListener("mouseover", function() {
    button.style.top = Math.floor(Math.random() * 90) + "%";
    button.style.left = Math.floor(Math.random() * 90) + "%";
    button.style.position = "absolute";} );
