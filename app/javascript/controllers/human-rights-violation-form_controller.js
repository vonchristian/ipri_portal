import { Controller } from "@hotwired/stimulus"
import { toggleTargetsByValue } from "./toggle_visibility"
export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "perpetratorCategoryGroup",
    "caseFilingYes",
    "caseFilingNo",
    "stateActionToAddressViolationGroup",
    "investigationOnViolationGroup"
  ]

  togglePerpetratorCategories(event) {
    toggleTargetsByValue(event.target.value, this.perpetratorCategoryGroupTarget, ["Yes"]);
  }

  toggleCaseFiling(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
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