import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "experienceHarrassmentYes",
    "caseFilingYes",
    "caseFilingNo",
    "caseDecisionGroup",
    "victimInDetentionYes",
    "victimInDetentionNo",
    "caseFilingAgainstPerpetratorYes",
    "caseFilingAgainstPerpetratorNo",
    "stateActionYes",
    "stateActionNo",
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

  toggleCaseFiling(event) {
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
  }

  toggleCaseDecision(event) {
    this.toggleTargetsByValue(event.target.value, this.caseDecisionGroupTarget, ["Yes", "No"]);
  }

  toggleVictimInDetention(event) { 
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.victimInDetentionYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.victimInDetentionNoTarget, "No");
  }

  toggleCaseFilingAgainstPerpetrator(event) {
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.caseFilingAgainstPerpetratorYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.caseFilingAgainstPerpetratorNoTarget, "No");
  }

  toggleStateAction(event) {
    const value = event.target.value;
    this.toggleTargetsByValue(value, this.stateActionYesTarget, "Yes");
    this.toggleTargetsByValue(value, this.stateActionNoTarget, "No");
  }
}