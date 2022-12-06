import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="follow-movies"
export default class extends Controller {
  static targets = [ "button" ]
  static values = { movie: Number,
                    followee: Number,
                    user: Number }
  connect() {
    // console.log("follow-movies controller connected")
  }
  followUser() {
    const sendData = { follow_user:{user: this.userValue, followee: this.followeeValue }}
    // console.log(this.followeeValue, this.userValue)
    const url = '/api/v1/followu'
    this.#sendRequest(url, sendData)
  }
  followMovie() {
    // console.log(this.movieValue, this.userValue)
    const sendData = { follow_movie:{user: this.userValue, movie: this.movieValue }}
    const url = '/api/v1/followm'
    this.#sendRequest(url, sendData)
  }
  #sendRequest(url, sendData) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch(url, {
      method: 'POST',
      headers: {'Content-Type': 'application/json',"X-CSRF-Token": csrfToken},
      body: JSON.stringify(sendData)})
    .then((response) => response.json())
    .then((data) => {
      // console.log(data)
      this.#updateButton(data)
    })
  }
  #updateButton(data) {
    // console.log(data)
    if (data.status === true) {
      if (data.job === "follow") {
        this.buttonTarget.innerText = "Unfollow"
      } else if (data.job === "unfollow") {
        this.buttonTarget.innerText = "Follow"
      }
    } else{
      console.log(data)
      console.log("something went wrong")
    }
  }
}
