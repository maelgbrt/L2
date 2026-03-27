const linksSection = document.querySelector("#links");


function create(tagname, text,parent) {
    const elt = document.createElement(tagname)
    elt.textContent = text
    parent.appendChild(elt)
    return elt
}


fetch("bookmark2.php?action=load")
    .then(response => response.json())
    .then(links => {
        links.forEach(link => {
            const article = create("article", "", linksSection);
            create("h2", link.title, article);

            const ifram = create("iframe","",article);
            ifram.src = link.url

        });
    
    })


    document.querySelector("#form button").addEventListener("click", () => {


    const title = document.querySelector("#form input[name=title]");
    const url = document.querySelector("#form input[name=url]");
    const category = document.querySelector("#form input[name=category]");

    const header = new Headers();
    header.append("Content-Type", "application/json");

    fetch("bookmark2.php?action=save", {
        method: "POST",
        headers: header,
        body: JSON.stringify({
            title: title.value,
            url: url.value,
            category: category.value
        }),
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(err => console.error(err));
});
