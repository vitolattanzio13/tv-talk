import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow-movies"
export default class extends Controller {
  static targets = [ "button" ]
  static values = { movie: Number,
                    user: Number }
  connect() {
    // console.log("follow-movies controller connected")
  }
  followMovie() {
    // console.log(this.movieValue, this.userValue)
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const sendData = { follow:{user: this.userValue, movie: this.movieValue}}
    fetch('/api/v1/followm', {
      method: 'POST',
      headers: {'Content-Type': 'application/json',"X-CSRF-Token": csrfToken},
      body: JSON.stringify(sendData)})
    .then((response) => response.json())
    .then((data) => {
      // console.log(data)
      if (data.status === true) {
        if (data.job === "follow") {
          this.buttonTarget.innerText = "Unfollow"
        } else if (data.job === "unfollow") {
          this.buttonTarget.innerText = "Follow"
        }
      } else{
        console.log("something went wrong")
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }
}
