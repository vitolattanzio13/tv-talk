import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form", "input", "links", "movie_input", "suggestions", "postContent", "postsContainer","postForm"]
  static values = { user: Number }
  connect() {
    // console.log("Search controller connected")
  }

  queryMovieDb(){
    // console.log(this.movie_inputTarget.value)
    const query = this.movie_inputTarget.value;
    const resultsContainer= this.suggestionsTarget;
    // console.log(resultsContainer.classList)
    if (query === "") {
      resultsContainer.classList.add("d-none");
    } else {
      resultsContainer.innerHTML = ""
      const url = this.#generateMovieLink(query)
      fetch(url,{headers: {'Accept': 'application/json'}})
      .then((response) => response.json())
      .then((data) => {
        if (query != "") {
          // console.log(data)
          resultsContainer.classList.remove("d-none")
          resultsContainer.innerHTML = ""
          if (data === "no results") {
            console.log(data)
            resultsContainer.innerHTML = `<p class="form-font-size">No results found</p>`
          } else {
            data.forEach((result) => {
              this.#insertMovieResult(result)
            })
          }
        }
      });
    }
  }

  #generateMovieLink(query) {
    return `/api/v1/movies/${query}`
  }

  #insertMovieResult(result){
    const resultsContainer= this.suggestionsTarget;
    resultsContainer.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" data-action='click->search#autofill' href="">${result.title}</a>`)
  }

  autofill(event){
    event.preventDefault();
    // console.log(event.currentTarget.innerText)
    this.movie_inputTarget.value = event.currentTarget.innerText
    this.suggestionsTarget.classList.add("d-none")
  }
  create(event) {
    event.preventDefault();
    if(this.movie_inputTarget.value === ""){
      // alert("Please enter a movie title")
    } else if (this.postContentTarget.value === "") {
      // alert("Please post something")
    } else {
      const postData = { post: { title: this.movie_inputTarget.value, user: this.userValue, content: this.postContentTarget.value} }
      const csrfToken = document.querySelector("[name='csrf-token']").content
      fetch("/api/v1/post", {
        method: "POST",
        headers: {'Content-Type': 'application/json',"X-CSRF-Token": csrfToken},
        body: JSON.stringify(postData)})
      .then((response) => response.json())
      .then((data) => {
        console.log(data.insert_item)
        this.postsContainerTarget.insertAdjacentHTML("afterbegin", data.insert_item)
        this.postFormTarget.reset()
      })
    }
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
          if (data === "no results") {
            resultsContainer.innerHTML = `<p class="form-font-size">No results found</p>`
          } else {
            data.forEach((result) => {
              this.#insertResult(result)
            })
          }
        }
      });
    }
  }
  #generateLink = (query) =>{
    return `/api/v1/search/${query}`
  }

  #insertResult = (result) =>{
    if (result.type === "user") {
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/profile/${result.url}">${result.title}</a>`)
    } else {
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/movies/${result.url}">${result.title}</a>`)
      this.linksTarget.insertAdjacentHTML("beforeend", `<a class="search-result-link form-font-size" href="/chatrooms/${result.chat}">${result.title} discussion</a>`)
    }
  };
}
