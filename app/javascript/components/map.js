const dynamicMapHeight = () => {
  const map = document.querySelector("#map");
  map.style.height = `${window.innerHeight}px`;
}

export { dynamicMapHeight };
