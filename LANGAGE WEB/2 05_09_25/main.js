console.log("ça marche !");

const data = [
    {
        name:"Nagui",
        image : "nagui.jpeg",
        description : "Masterclass Nagui quand même"
    },{
        name:"Naguo",
        image:"nagui2.jpeg",
        description : "Tema le Nagui"
    }
    ,{
        name:"Nagua",
        image:"nagui3.jpeg",
        description:"Parce que je suis con"
    }
]


const body = document.querySelector("body");

data.forEach((row) =>{
    let test = document.createElement("h1");
    test.innerText=row.name;
    body.appendChild(test);

    let img = document.createElement("img");
    img.src = "images/" +row.image;
    body.appendChild(img);
}
);