const initChat = () => {
  const button = document.getElementById('chat');
  if (button) {
    button.addEventListener('click', (event) => {
      const chat = document.getElementById('chat-popup');
      console.log(chat.style.display);
      if (chat.style.display !== "block") {
        chat.style.display = "block";
      } else {
        chat.style.display = "none";
      }
    });
  }
}

export { initChat };
