const initReviewForm = () => {
  const reviewButtons = document.querySelectorAll('.show-review');
  reviewButtons.forEach((button) => {
    if (button) {
      button.addEventListener('click', (event) => {
        let bookingId = event.currentTarget.dataset.booking_id;
        const forms = document.querySelectorAll('#review-form');

        forms.forEach((form) => {
          let formBookingId = form.dataset.booking_id;
          if (bookingId === formBookingId) {
            if (form.style.display === 'block') {
              form.style.display = 'none';
            } else {
              form.style.display = 'block';
            }
          }
        });
     });
    }
  });
}
export { initReviewForm };
