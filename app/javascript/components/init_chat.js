const initChat = () => {
  const chatButtons = document.querySelectorAll('.chat-button');
  chatButtons.forEach((button) => {
    if (button) {
      button.addEventListener('click', (event) => {
        const bookingId = event.currentTarget.dataset.bookingId;
        const venueId = event.currentTarget.dataset.venueId;
        const chatroomId = event.currentTarget.dataset.chatroomId;

        const chat = document.getElementById('chat-popup');
        if (chat.style.display !== "block") {
          chat.style.display = "block";
        } else {
          chat.style.display = "none";
        }

        const url = `venues/${venueId}/bookings/${bookingId}/chatrooms/${chatroomId}?popup=true`;
        fetch(url)
        .then(response => response.json())
        .then((data) => {
          chat.insertAdjacentHTML('beforeEnd', data.content);
        });
      });
    }
  });
}

export { initChat };
