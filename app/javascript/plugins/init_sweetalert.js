import swal from 'sweetalert';


const initSweetalert = (options = {}) => {
  console.log("here");
  const swalButton = document.getElementById('sweet-alert');

  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      swal(options);
    });
  }
};

export { initSweetalert };
