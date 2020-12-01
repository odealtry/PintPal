// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";

//Flatpickr
import "flatpickr/dist/flatpickr.min.css"
require("flatpickr/dist/themes/dark.css");

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initChatroomCable } from '../channels/chatroom_channel';
// import { initChat } from '../components/init_chat';
import { addBackgroundToNavbar } from '../components/navbar';
import { changePlaceholder } from '../components/navbar';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initChatroomCable();
  // initChat();
  splashScreen();
  addAlert();

  // Finding current_address for getting there sweet alert
  navigator.geolocation.getCurrentPosition((data) => {
    const lat = data.coords.latitude;
    const lon = data.coords.longitude;

    // Sweet alert for getting there
    if (document.getElementById('venue-address') !== null) {
      const current_address = `${lat} ${lon}`;
      const venue_address = document.getElementById('venue-address').innerText;
      const uber = `https://m.uber.com/ul`;
      const maps = `https://www.google.com/maps/dir/?api=1&origin=${current_address}&destination=${venue_address}&travelmode=transit`;
      const el = document.createElement('div');
      el.innerHTML = `<a href='${uber}' style="color: black; font-size: 50px;"><i class='fab fa-uber'></i></br></a><a href='${maps}' style="color: black; font-size: 50px;"><i class="fas fa-subway"></i></a>`;
      initSweetalert({
        title: "How are you getting there?",
        button: false,
        content: el
      });
    }
  });
  addBackgroundToNavbar();
  changePlaceholder();
});

const splashScreen = () => {
  const splash = document.querySelector('.splash');
  const navbar = document.querySelector('.navbar');
  let splashed = false;
  if (document.cookie !== "") {
    splashed = document.cookie
      .split('; ')
      .find(row => row.startsWith('splashed'))
      .split('=')[1];      
  }

  if (splash) {
    if (splashed) {
      splash.classList.add('invisible');      
    } else {
      navbar.classList.toggle("invisible");
      setTimeout(() => {
        splash.classList.add('display-none');
      }, 6000);
      setTimeout(() => {
        navbar.classList.toggle("invisible");
      }, 6200);
    }
  }
  document.cookie = "splashed=true";
};

// When a venue owner accepts a booking, show an alert icon on the navbar
const addAlert = () => {
  const acceptButton = document.querySelector(".accept-booking");
  const notifierToggler = document.querySelector(".notifier-toggler")
  if (acceptButton) {
    acceptButton.addEventListener("click", () => {
      notifierToggler.classList.toggle("invisible");
    })
  }
};