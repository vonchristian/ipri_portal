import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "label"]

  updateLabel() {
    const selectedText = this.categoryTarget.options[this.categoryTarget.selectedIndex].text
    
    this.labelTarget.textContent = `Number of affected ${selectedText.toLowerCase()}`
  }
}