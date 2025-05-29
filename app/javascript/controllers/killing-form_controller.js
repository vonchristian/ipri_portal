import { Controller } from "@hotwired/stimulus"
import { toggleTargetsByValue } from "./toggle_visibility"
export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "experienceHarrassmentYes",
    "perpetratorCategoryGroup",
    "caseFilingYes",
    "caseFilingNo",
    "investigationOnKillingGroup",
    "stateActionToAddressYes", 
    "stateActionToAddressNo"
  ]

  toggleExperienceHarrassment(event) {
    toggleTargetsByValue(event.target.value, this.experienceHarrassmentYesTarget, "Yes");
  }

  togglePerpetratorCategories(event) {
    toggleTargetsByValue(event.target.value, this.perpetratorCategoryGroupTarget, "Yes");
  }

  togglestateActionToAddressKilling(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.stateActionToAddressYesTarget, "Yes");
    toggleTargetsByValue(value, this.stateActionToAddressNoTarget, "No");
  }

  toggleCaseFiling(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
  }
}