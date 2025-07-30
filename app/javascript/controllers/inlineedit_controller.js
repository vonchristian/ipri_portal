import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String, name: String }

  save(event) {
    const newValue = event.target.innerText.trim()
    const data = {}
    data[this.nameValue] = newValue

    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify(data)
    })
  }
}