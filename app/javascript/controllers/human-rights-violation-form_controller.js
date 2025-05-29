import { Controller } from "@hotwired/stimulus"
import { toggleTargetsByValue } from "utils/toggle_visibility"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "perpetratorCategoryGroup",
    "caseFilingYes",
    "caseFilingNo",
    "stateActionToAddressViolationYes",
    "stateActionToAddressViolationNo",
    "investigationOnViolationYes",
    "investigationOnViolationNo"
  ]

  togglePerpetratorCategories(event) {
    toggleTargetsByValue(event.target.value, this.perpetratorCategoryGroupTarget, ["Yes"]);
  }

  toggleCaseFiling(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
  }

  togglestateActionToAddressViolation(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.stateActionToAddressViolationYesTarget, "Yes");
    toggleTargetsByValue(value, this.stateActionToAddressViolationNoTarget, "No");
  }

  toggleInvestigationOnViolation(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.investigationOnViolationYesTarget, "Yes");
    toggleTargetsByValue(value, this.investigationOnViolationNoTarget, "No");
  }
}