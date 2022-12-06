import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="votes-handler"
export default class extends Controller {
  static targets = [ "likes", "post", "count", "button" ]
  static values = {
     user: Number,
     poster: Number,
     post: Number
     }
  connect() {
    // console.log(this.countTarget.innerText)
  }
  like() {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const sendData = { like:{user: this.userValue, poster: this.posterValue, post: this.postValue}}
    fetch('/api/v1/like', {
      method: 'POST',
      headers: {'Content-Type': 'application/json',"X-CSRF-Token": csrfToken},
      body: JSON.stringify(sendData)})
    .then((response) => response.json())
    .then((data) => {
      console.log(data)
      this.countTarget.innerText = data.new_count
      if (data.status === true) {
        this.buttonTarget.classList.add("liked-button-red")
      } else{
        this.buttonTarget.classList.remove("liked-button-red")
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }
}
