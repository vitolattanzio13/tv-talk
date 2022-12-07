import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "home", "movies", "profile", "about", "friends" ]
  static values = { user: Number }
  connect() {
    // console.log(window.location.pathname)
    // console.log(this.userValue)
    switch (window.location.pathname) {
      case "/":
        this.#resetAll();
        this.homeTarget.classList.add("current-page-nav");
        break;
      case "/movies":
        this.#resetAll();
        this.moviesTarget.classList.add("current-page-nav");
        break;
      case "/profile/" + this.userValue:
        this.#resetAll();
        this.profileTarget.classList.add("current-page-nav");
        this.profileTarget.children[2].children[1].classList.add("notifications-count-red");
        this.profileTarget.children[2].children[1].classList.remove("notifications-count-white");
        break;
      case "/about":
        this.#resetAll();
        this.aboutTarget.classList.add("current-page-nav");
        break;
      case "/friends":
        this.#resetAll();
        this.friendsTarget.classList.add("current-page-nav");
        break;

      default:
        this.#resetAll();
        break;
    }
  }
  #resetAll() {
    this.homeTarget.classList.remove("current-page-nav")
    this.moviesTarget.classList.remove("current-page-nav")
    this.friendsTarget.classList.remove("current-page-nav")
    this.profileTarget.classList.remove("current-page-nav")
    this.profileTarget.children[2].children[1].classList.remove("notifications-count-red");
    this.profileTarget.children[2].children[1].classList.add("notifications-count-white");
    this.aboutTarget.classList.remove("current-page-nav")
  }
}
