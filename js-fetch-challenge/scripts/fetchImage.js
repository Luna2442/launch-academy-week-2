ready().then(() => {
  fetch('/images/logo.png')
  .then(response => response.blob())
  .then(blob => {
    let objectURL = URL.createObjectURL(blob);
    let imageElement = document.createElement('img');
    imageElement.src = objectURL;
    document.getElementById('main').appendChild(imageElement);
  });
});
