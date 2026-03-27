
body = document.querySelector("body");


setInterval(positon_aleatoire,5000);


function creerBUlle() {
  let bulle = document.createElement("div");
  bulle.style.background = "blue";
  bulle.style.height = "100px";
  bulle.style.width = "100px";
  bulle.style.borderRadius = "50%"
  bulle.style.position = "absolute"
  bulle.classList.add("bubble")
return bulle;
}
    
count = 0;

function positon_aleatoire(){
    let bulle = creerBUlle();
    console.log(bulle)
    position_x = Math.floor(Math.random()*window.innerHeight);
    position_y = Math.floor(Math.random()*window.innerWidth);
    bulle.style.top = position_x + "px"
    r = Math.floor(Math.random()*255);
    g = Math.floor(Math.random()*255);
    b = Math.floor(Math.random()*255);
    bulle.style.background= "rgb("+r+","+g+","+b+")";
    bulle.style.right = position_y +"px"
   body.appendChild(bulle);
    bulle.addEventListener("click",_=>{
    console.log(bulle)
    bulle.style.transform = "scale(1.5)";
    })
    }

    