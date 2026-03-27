const img = document.querySelector('img');

document.querySelectorAll(".lightbox").forEach(image => {
    image.addEventListener('click', function() {
        image.classList.toggle('lightbox');

        const background = document.createElement('div');
        background.id = 'background';
        document.body.appendChild(background);

        const lightbox = document.createElement('div');
        lightbox.id = 'lightbox';
        background.appendChild(lightbox)

        const newimage = document.createElement('img');
        newimage.src = image.src;
        lightbox.appendChild(newimage);

        const imageWidth = newimage.getBoundingClientRect().width;
        console.log(imageWidth);

        const closeButton = document.createElement('button');
        closeButton.id = 'close';
        closeButton.innerText = 'X';
        lightbox.appendChild(closeButton);



        closeButton.addEventListener('click', function() {
            lightbox.classList.add('fadeOut');
            setTimeout(() => {
                background.remove();
            }, 2000);
        });
closeButton.addEventListener('click', function() {
    body.addEventListener("keyup", keyEvent => {
        if (keyEvent.key === "Escape") {
            lightbox.classList.add('fadeOut');
        }});
});



         body.addEventListener("keyup", keyEvent => {
        if (keyEvent.key === "Escape") {
           console.log("Escape key pressed");
        }});

    });
    
});
