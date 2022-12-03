import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form", "input", "links"]
  connect() {
    // console.log("Search controller connected")
  }
  queryDb(event) {
    // console.log(this.inputTarget.value)
    const query = this.inputTarget.value;
    const resultsContainer= this.linksTarget;
    if (query === "") {
      resultsContainer.classList.add("d-none");
    } else {
      resultsContainer.innerHTML = ""
      const url = this.#generateLink(query)
      fetch(url,{headers: {'Accept': 'application/json'}})
      .then((response) => response.json())
      .then((data) => {
        if (query != "") {
          // console.log(data)
          this.linksTarget.classList.remove("d-none")
          this.linksTarget.innerHTML = ""
          data.forEach((result) => {
            this.#insertResult(result)
          })
        }
      });
    }
  }
  #generateLink = (query) =>{
    return `/api/v1/search/${query}`
  }

  #insertResult = (result) =>{
    if (result.type === "user") {
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/${result.url}">${result.title}</a>`)
    } else {
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/movies/${result.url}">${result.title}</a>`)
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/chatrooms/${result.chat}">${result.title} discussion</a>`)
    }
  };
}
