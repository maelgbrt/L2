

images = document.querySelectorAll('img');
images.forEach(img => {
    img.addEventListener('click', () => {
    valeur = img.alt;
    article = document.querySelector('article#' + valeur);
    p_descri = article.querySelector('p');
    description = document.createElement('p');
    description.id = 'description';
    description.textContent = p_descri.textContent;
    //    p_descri.remove();
    //    article.appendChild(description);

    
        
    // le mode ne touche a rien d'autre dans la page
    donttouch = document.createElement('div');
    donttouch.id = 'donttouch';
    setTimeout(() => {
    donttouch.classList.add('fadeIn');}, 1000);

    
    // bouton de sortie
    const content = document.createElement('div');
    content.id = 'content';
    setTimeout(() => {
    content.classList.add('fadeIn');}, 10);

    const title = document.createElement('h1');
    title.textContent = img.alt + " - " + article.querySelector('.year').textContent;
    

    const closeButton = document.createElement('button');
    closeButton.id = 'close';
    closeButton.innerText = 'Fermer';

    const imgcontent = document.createElement('img');
    imgcontent.src = img.src;

    divplacebouton = document.createElement('div');
    divplacebouton.id = 'divplacebouton';

    const ensavoirplus = document.createElement('button');
    ensavoirplus.textContent = "En savoir plus";
     
const pausecafé = document.createElement('button');
pausecafé.textContent = "Pause café";


const liens = [
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/1",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/2",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/3",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/4",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/5",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/6",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/7",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/8",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/9",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/10",
    "https://www.vinted.fr/items/7037913704-machine-a-cafe-krup-espresso",
    "https://www.vinted.fr/items/7029959691-macchina-da-caffe-krups-dolce-gusto-nescafe",
    "https://www.vinted.fr/items/7057897455-cafetiere-beko",
    "https://www.vinted.fr/items/7023694209-cafetiere-nespresso-vertuo",
    "https://www.vinted.fr/items/6456934626-machine-cafe",
    "https://www.lidl.fr/p/silvercrest-machine-a-cafe-automatique-skva-1450-a1/p100389809",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-sem-1100-e1-noire/p100392719",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-retro-1973/p100393796",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso/p100391015",
    "https://www.lidl.fr/p/bosch-machine-a-cafe-automatique-verocup-tie20109/p100366676",
    "https://www.lidl.fr/p/krups-nescafe-machine-a-cafe-compacte-piccolo-xs-kp1a3b/p100368046",
    "https://www.lidl.fr/p/silvercrest-machine-a-cafe-automatique-skva-1450-a1/p100389809",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-sem-1100-e1-noire/p100392719",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-retro-1973/p100393796",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso/p100391015",
    "https://www.lidl.fr/p/bosch-machine-a-cafe-automatique-verocup-tie20109/p100366676",
    "https://www.lidl.fr/p/krups-nescafe-machine-a-cafe-compacte-piccolo-xs-kp1a3b/p100368046",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/11",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/12",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/13",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/14",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/15",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/16",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/17",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/18",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/19",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/20",
    "https://www.vinted.fr/items/7037913704-machine-a-cafe-krup-espresso",
    "https://www.vinted.fr/items/7029959691-macchina-da-caffe-krups-dolce-gusto-nescafe",
    "https://www.vinted.fr/items/7057897455-cafetiere-beko",
    "https://www.vinted.fr/items/7023694209-cafetiere-nespresso-vertuo",
    "https://www.vinted.fr/items/6456934626-machine-cafe",
    "https://www.lidl.fr/p/silvercrest-machine-a-cafe-automatique-skva-1450-a1/p100389809",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-sem-1100-e1-noire/p100392719",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-retro-1973/p100393796",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso/p100391015",
    "https://www.lidl.fr/p/bosch-machine-a-cafe-automatique-verocup-tie20109/p100366676",
    "https://www.lidl.fr/p/krups-nescafe-machine-a-cafe-compacte-piccolo-xs-kp1a3b/p100368046",
    "https://www.lidl.fr/p/silvercrest-machine-a-cafe-automatique-skva-1450-a1/p100389809",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-sem-1100-e1-noire/p100392719",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso-retro-1973/p100393796",
    "https://www.lidl.fr/p/silvercrest-machine-a-expresso/p100391015",
    "https://www.lidl.fr/p/bosch-machine-a-cafe-automatique-verocup-tie20109/p100366676",
    "https://www.lidl.fr/p/krups-nescafe-machine-a-cafe-compacte-piccolo-xs-kp1a3b/p100368046",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/21",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/22",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/23",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/24",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/25",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/26",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/27",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/28",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/29",
    "https://www.leboncoin.fr/ck/electromenager/machine-a-cafe/30"
];

pausecafé.onclick = () => {
    const randomIndex = Math.floor(Math.random() * liens.length);
    window.location.href = liens[randomIndex];
};



        document.body.appendChild(donttouch);
        donttouch.appendChild(content);
        content.appendChild(title);
        content.appendChild(closeButton);
        content.appendChild(imgcontent);
        content.appendChild(description);
        divplacebouton.appendChild(ensavoirplus);
        divplacebouton.appendChild(pausecafé);
        content.appendChild(divplacebouton);

    closeButton.addEventListener('click', function() {
        content.classList.remove('fadeIn');
        donttouch.classList.remove('fadeIn');
        setTimeout(() => {
        donttouch.remove();
        }, 1000);
    });

    ensavoirplus.addEventListener('click',function(){
const textes = [
    "Il y a environ 13,8 milliards d’années, tout commence avec le Big Bang. L’univers naît d’un point infiniment dense et chaud...",
    "Quelques centaines de milliers d’années plus tard, l’univers se refroidit suffisamment pour que les électrons se lient aux noyaux...",
    "Alors que l’univers continue de s’étendre, la gravité commence à rassembler les nuages d’hydrogène et d’hélium pour former les premières étoiles massives...",
    "Au fil des milliards d’années, les galaxies se regroupent et fusionnent, donnant naissance à des structures de plus en plus grandes...",
    "Il y a environ 4,6 milliards d’années, dans une nébuleuse de gaz et de poussière, une région s’effondre pour créer notre Soleil...",
    "Sur cette planète jeune, la vie apparaît il y a environ 3,8 milliards d’années...",
    "La vie multicellulaire apparaît il y a environ 600 millions d’années...",
    "Les dinosaures dominent la planète pendant plus de 160 millions d’années...",
    "Les humains commencent comme chasseurs-cueilleurs, vivant en petits groupes...",
    "Il y a environ 10 000 ans, la révolution néolithique change radicalement le monde...",
    "Depuis, l’humanité n’a cessé d’innover et de rêver...",
    "Aujourd’hui, nous sommes environ 8 milliards sur Terre, capables de réfléchir à nos origines..."];
description.innerText="";

textes.forEach(para => {
    
    const p = document.createElement('p');
    p.innerText = para;
    description.appendChild(p);
    description.id='mini';
});
    })


});
});