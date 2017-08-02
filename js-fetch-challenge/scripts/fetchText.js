ready().then(() => {
  links = document.getElementsByClassName('page');

  Array.from(links).forEach((link) => {
    link.addEventListener('click', () => {
      event.preventDefault();
      fetch(link.getAttribute('href'))
        .then(response => response.text())
        .then(text => document.getElementById('main').innerHTML = text);
    });
  });
});
