fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    booksElement = document.getElementById('books');
    body.books.forEach((book) => {
      let listElement = document.createElement("li");
      let textNode = document.createTextNode(book.name);
      booksElement.appendChild(listElement);
      listElement.appendChild(textNode);
    });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
