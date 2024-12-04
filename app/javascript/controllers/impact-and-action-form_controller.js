import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "actionTakenGroup",
    "investigationOnViolationGroup"
  ]

  toggleActionTaken() {
    this.actionTakenGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleInvestigation() {
    this.investigationOnViolationGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}