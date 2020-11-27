
cons chatHTML = (bookingId) => {
  const HTML = "<div id="close"><%= link_to "x", shortlist_path %></div>"
}



const initChat = () => {
  const chatButtons = document.querySelectorAll('.chat-button');
  chatButtons.forEach((button) => {
    if (button) {
      button.addEventListener('click', (event) => {
        const bookingId = event.currentTarget.id;
        // console.log(bookingId);
        const chat = document.getElementById('chat-popup');
        if (chat.style.display !== "block") {
          chat.style.display = "block";
        } else {
          chat.style.display = "none";
        }
        chat.innerHtml = insertAdjacentHTML('beforeend', chatHTML(bookingId));
      });
    }
  });
}

export { initChat };
