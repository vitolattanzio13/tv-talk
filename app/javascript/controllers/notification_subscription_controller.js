import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = [ "count" ]
  static values = { notificationId: Number }
  connect() {
    // console.log(this.notificationIdValue)
    // console.log(createConsumer().subscriptions.create)
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.notificationIdValue },
      { received: data => {
        console.log(data)
        this.countTarget.innerText = data
      } }
    )
    // console.log(this.channel)
  }
}
