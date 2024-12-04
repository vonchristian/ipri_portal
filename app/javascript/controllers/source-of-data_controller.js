import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]
  connect() {
    this.outputTarget.hidden = true
  }

  toggle(event) {
    console.log(event);
    if(event.target.value == "No, not directly from the source (information is gathered from news outlets, etc.)") {
      this.outputTarget.hidden = false
    } else if(!event.target.value != "No, not directly from the source (information is gathered from news outlets, etc.)") {
      this.outputTarget.hidden = true
    }
  }
}