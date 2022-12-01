import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="votes-handler"
export default class extends Controller {
  static targets = [ "likes", "post" ]
  static values = {
     user: Number,
     poster: Number,
     post: Number
     }
  connect() {
    console.log("Connected to votes-handler")
  }
  like() {
    console.log(this.userValue)
    console.log(this.posterValue)
    console.log(this.postValue)
  }
}
