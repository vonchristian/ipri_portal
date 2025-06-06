import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select"]

  connect() {
    this.selectTarget.addEventListener("change", () => {
      this.element.requestSubmit();
    });
  }
}