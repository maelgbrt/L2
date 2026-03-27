const url_like = "http://51.83.36.122:81/like";
const urlN = "http://51.83.36.122:81/n";
const like = document.querySelectorAll("#coeur");
like.forEach(like => {


    setInterval( _ => {
fetch(urlN)
            .then (response => response.json())
            .then (data => {
                like.innerText = "♥ " + data.likes
            })

        },1000);
    like.addEventListener("click", _ => {
        fetch(url_like)
            .then (response => response.json())
            .then (data => {
                like.innerText = "♥ " + data.likes
            })

    });
});