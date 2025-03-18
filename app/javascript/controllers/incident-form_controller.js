import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "output"];
  connect() {
    this.outputTarget.hidden = false;
  }

  toggle(event) {
    if (["Yes", "Sí"].includes(event.target.value)) {
      this.outputTarget.hidden = true;
    } else if (!["Yes", "Sí"].includes(event.target.value)) {
      this.outputTarget.hidden = false;
    }
  }
}
