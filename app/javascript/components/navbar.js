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

const changePlaceholder = () => {
  const input = document.querySelector(".mapboxgl-ctrl-geocoder--input")
  input.placeholder = "Search for a location or venue";
};

export { addBackgroundToNavbar };
export { changePlaceholder }
