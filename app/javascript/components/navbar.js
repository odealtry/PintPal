const addBackgroundToNavbar = () => {
  const navbarToggler = document.querySelector(".navbar-toggler")
  const navbar = document.querySelector(".navbar")
  navbarToggler.addEventListener("click", (event) => {
    if (navbar.classList.contains("with-background")) {
      setTimeout(() => {navbar.classList.toggle("with-background")}, 200)
    } else {
      navbar.classList.toggle("with-background");
    }
  });
};

export { addBackgroundToNavbar };
