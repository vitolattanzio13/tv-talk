import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="back-button"
export default class extends Controller {
  connect() {
  }

  back(e) {
    e.preventDefault()
    window.history.back()
  }
}
