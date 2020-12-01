const initReviewForm = () => {
  const reviewButtons = document.querySelectorAll('.show-review');
  reviewButtons.forEach((button) => {
    if (button) {
      button.addEventListener('click', (event) => {
        const form = document.getElementById('review-form');
        // if (form.style.display !== "block") {
        //   form.style.display = "block";
        // } else {
        //   form.style.display = "none";
        // }
      });
    }
  });
}
export { initReviewForm };
