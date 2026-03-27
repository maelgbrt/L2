h1 = document.querySelector("header h1");

h1.innerHTML = "hello"

background = document.querySelector("main");

setInterval(ChangeBackgroundColor,2000);



function ChangeBackgroundColor(){
    let randomColor = (Math.floor(Math.random()*0xFFFFFF)).toString(16);
     background.style.background = "#" + randomColor;
}


span_orange = document.querySelectorAll("span.orange");

setInterval(ChangeSpan,1000);

function ChangeSpan(){
    let randomColor= (Math.floor(Math.random()*0xFFFFFF)).toString(16);
    span_orange.forEach(span => {
        span.style.color = "#" + randomColor;
    });
}

hexa = document.querySelectorAll(".hexa");
visu = document.querySelectorAll(".visu");
tr = document.querySelectorAll("tr");

for(let i = 0; i < hexa.length;i++){
visu[i].style.background = hexa[i].innerHTML
if(hexa[i].innerHTML == "#800080"){
    tr[i].innerHTML ="";
}
}


setInterval(ChangeImage,3000);
image = document.querySelector("img");

j = 0;

function ChangeImage(){
    if (j<dico_image.length){
    image.src="./images/" + dico_image[j].image;
    j += 1;}
    else{
        j=0;
    }
}

dico_image = [{
    image : "beer.jpg",
    description : "Une bière"
},{
    image : "fruit.jpg",
    description : "Un fruit"
},{
        image : "pen.jpg",
    description : "Un pot de Stylo"
},{
    image : "redhead.jpg",
    description : "Jsp"
},{
    image : "van.jpg",
    description :"Un van"
}



    
]

text_img = document.querySelector("#img h2");

text_img.innerHTML ="Images";

nav= document.querySelector("nav");

nav.addEventListener("click",CacheNav)
res = true;
function CacheNav(){
    if (res==true){
    nav.style.background ="transparent";
    res = false;
    }else{
            nav.style.background ="black";
            res = true;

    }
}