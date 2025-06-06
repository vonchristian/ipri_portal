// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => this.element.remove(), 5000)
  }
  
  close() {
    this.element.remove()
  }
}