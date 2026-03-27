const links = [
{
"title": "USMB",
"url": "https://univ-smb.fr/",
"category": "taf"
},
{
"title": "Useless Web",
"url": "https://theuselessweb.com/",
"category": "wtf"
}
]

function create(tagname, text,parent) {
    const elt = document.createElement(tagname)
    elt.textContent = text
    parent.appendChild(elt)
    return elt
}

create("h1", "Bookmarks", document.body)

const linksSection = create("section", "", document.body)
linksSection.id = "links";

const displayLink = link => {
    const linksArticles = create("article", "", linksSection)
    linksArticles.classList.add("link");

    create("h2", link.title, linksArticles)
    const a = create("a", link.url, linksArticles)
    a.href = link.url
    const p = create("p", link.category, linksArticles)
    p.classList.add("category")

    const delButton = create("button", "Supprimer", linksArticles)
    delButton.addEventListener("click", () => {
        linksArticles.remove();
        console.log(links);
    })

    linksArticles.addEventListener("dbclick", (e) => {

}
links.forEach(displayLink);

const addFromSection = create("section", "", document.body)
addFromSection.id = "add-form";

['title', 'url', 'category'].forEach(field => {
    const p = create("p", field, addFromSection)
    const input = create("input", "", p)
    input.name = field
})


// AJOUTER
const addButton = create("button", "Ajouter", addFromSection)
addButton.type = "button"

addButton.addEventListener("click", () => {
    const title = document.querySelector("#add-form input[name=title]").value
    const url = document.querySelector("#add-form input[name=url]").value
    const category = document.querySelector("#add-form input[name=category]").value

// verification des champs
    if (title === "" || url === "" || category === "") {
        alert("Veuillez remplir tous les champs.");
        return;
    }

    const newLink = {
        "title": title,
        "url": url,
        "category": category}
    links.push(newLink)
    displayLink(newLink)
    console.log(links)
})





