const dynamicMapHeight = () => {
  const map = document.querySelector("#map");
  // map.addEventListener("click", (event) => {
  //   console.log("working");
  // })
  map.style.height = `${window.innerHeight}px`;
}

export { dynamicMapHeight };
