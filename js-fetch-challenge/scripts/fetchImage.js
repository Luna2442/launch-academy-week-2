ready().then(() => {
  fetch('/images/logo.png')
  .then(response => response.blob())
  .then(blob => objectURL = URL.createObjectURL(blob))
  .then(url => {
    let imageElement = document.createElement('img');
    imageElement.src = url;
    document.getElementById('main').appendChild(imageElement);
  });
});
