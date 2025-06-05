import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form"]

  connect() {
    this.showDisplay()
  }

  edit() {
    this.showForm()
  }

  cancel() {
    this.showDisplay()
  }

  showDisplay() {
    this.displayTargets.forEach(el => el.classList.remove("hidden"))
    this.formTarget.classList.add("hidden")
  }

  showForm() {
    this.displayTargets.forEach(el => el.classList.add("hidden"))
    this.formTarget.classList.remove("hidden")
  }
}
