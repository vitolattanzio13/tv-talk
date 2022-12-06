import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-tabs"
export default class extends Controller {
  static targets = [ "followedMovies", "followedUsers", "posts", "buttonFollowedMovies", "buttonFollowedUsers", "buttonPosts" ]

  connect() {
    console.log("fuck youuuuuuuuuuuuuu")
    this.buttonFollowedMoviesTarget.classList.add("btn-profile-tab-active")
  }

  showFollowedMovies() {
    console.log("fuck youuuuuuuuuuuuuu2")
    this.buttonFollowedMoviesTarget.classList.add("btn-profile-tab-active")
    this.buttonFollowedUsersTarget.classList.remove("btn-profile-tab-active")
    this.buttonPostsTarget.classList.remove("btn-profile-tab-active")
    this.followedMoviesTarget.classList.remove("d-none")
    this.followedUsersTarget.classList.add("d-none")
    this.postsTarget.classList.add("d-none")
  }

  showFollowedUsers() {
    console.log("fuck youuuuuuuuuuuuuu3")
    this.buttonFollowedMoviesTarget.classList.remove("btn-profile-tab-active")
    this.buttonFollowedUsersTarget.classList.add("btn-profile-tab-active")
    this.buttonPostsTarget.classList.remove("btn-profile-tab-active")
    this.followedMoviesTarget.classList.add("d-none")
    this.followedUsersTarget.classList.remove("d-none")
    this.postsTarget.classList.add("d-none")
  }

  showPosts() {
    console.log("fuck youuuuuuuuuuuuuu4")
    this.buttonFollowedMoviesTarget.classList.remove("btn-profile-tab-active")
    this.buttonFollowedUsersTarget.classList.remove("btn-profile-tab-active")
    this.buttonPostsTarget.classList.add("btn-profile-tab-active")
    this.followedMoviesTarget.classList.add("d-none")
    this.followedUsersTarget.classList.add("d-none")
    this.postsTarget.classList.remove("d-none")
  }

}
