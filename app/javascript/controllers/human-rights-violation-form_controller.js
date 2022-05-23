import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "perpetratorCategoryGroup",
    "caseFilingGroup",
    "stateActionToAddressViolationGroup",
    "investigationOnViolationGroup"
  ]

  togglePerpetratorCategories() {
    this.perpetratorCategoryGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
  toggleCaseFiling() {
    this.caseFilingGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  togglestateActionToAddressViolation() {
    this.stateActionToAddressViolationGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleInvestigationOnViolation() {
    this.investigationOnViolationGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}