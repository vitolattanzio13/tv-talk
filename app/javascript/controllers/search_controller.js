import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form", "input", "links"]
  connect() {
    console.log("Search controller connected")
  }
  queryDb(event) {
    // console.log(this.inputTarget.value)
    if (this.inputTarget.value === "") {
      this.linksTarget.classList.add("d-none")
    }
    this.linksTarget.innerHTML = ""
    const url = `/pages/?query=${this.inputTarget.value}`
    fetch(url,{headers: {'Accept': 'application/json'}})
    .then((response) => response.json())
    .then((data) => {
      if (this.inputTarget.value != "") {
        console.log(data)
        this.linksTarget.classList.remove("d-none")
        this.linksTarget.innerHTML = ""
        data.forEach((result) => {
          if (result.type === "user") {
            this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/${result.url}">${result.title}</a>`)
          } else {
            this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/movies/${result.url}">${result.title}</a>`)
            this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/movies/${result.url}/chatrooms/${result.url}">${result.title} discussion</a>`)
          }
        })
      }
    });
  }
}
