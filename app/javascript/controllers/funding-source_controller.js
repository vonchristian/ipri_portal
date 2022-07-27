import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "output"]
  connect() {
    this.outputTarget.hidden = true
  }

  toggle(event) {
    if(event.target.value == "Yes") {
      this.outputTarget.hidden = false
    } else if(event.target.value != "Yes") {
      this.outputTarget.hidden = true
    }
  }
}