import { Controller } from "@hotwired/stimulus"

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

  toggleTargetsByValue(selectedValue, target, showValue) {
    if (Array.isArray(showValue)) {
      target.classList.toggle("hidden", !showValue.includes(selectedValue));
    } else {
      target.classList.toggle("hidden", selectedValue !== showValue);
    }
  }

  toggleExperienceHarrassment(event) {
    this.toggleTargetsByValue(event.target.value, this.experienceHarrassmentYesTarget, "Yes");
  }

  togglePerpetratorCategories(event) {
    this.toggleTargetsByValue(event.target.value, this.perpetratorCategoryGroupTarget, "Yes");
  }

  togglestateActionToAddressKilling(event) {
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.stateActionToAddressYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.stateActionToAddressNoTarget, "No");
  }

  toggleCaseFiling(event) {
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
  }

  toggleInvestigationOnKilling() {
    this.investigationOnKillingGroupTargets.forEach(el => {
      el.classList.toggle("hidden");
    });
  }
}