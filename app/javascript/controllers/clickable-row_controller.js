// app/javascript/controllers/clickable_row_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    this.element.style.cursor = "pointer"
  }

  click() {
    if (this.hasUrlValue) {
      window.location.href = this.urlValue
    }
  }
}
