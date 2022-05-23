import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [ "actionTakenGroup" ]

  toggleActionTaken() {
    this.actionTakenGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}