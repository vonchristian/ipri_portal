import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "output"];
  connect() {
    this.outputTarget.hidden = true;
  }

  toggle(event) {
    if (["Yes", "Sí"].includes(event.target.value)) {
      this.outputTarget.hidden = false;
    } else if (!["Yes", "Sí"].includes(event.target.value)) {
      this.outputTarget.hidden = true;
    }
  }
}
