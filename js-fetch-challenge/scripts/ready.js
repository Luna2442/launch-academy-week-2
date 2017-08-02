let ready = () => {
  return new Promise((resolve, reject) => {
    document.onreadystatechange = () => {
      if (document.readyState == 'complete') {
        resolve();
      }
    };
  }
)};
