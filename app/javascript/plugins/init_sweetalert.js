import swal from 'sweetalert';


const initSweetalert = (options = {}) => {
  const swalButton = document.getElementById('sweet-alert');

  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (event) => {
      event.preventDefault();
      swal(options);
    });
  }
};

export { initSweetalert };
