// app/javascript/controllers/incident_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "input"]

  connect() {
    this.toggle()
  }

  toggle() {
    const selected = this.inputTargets.find(el => el.checked)
    if (!selected) return

    if (selected.value === "No" || selected.value === "false") {
      this.outputTarget.classList.remove("hidden")
    } else {
      this.outputTarget.classList.add("hidden")
    }
  }
}
