import { Controller } from "@hotwired/stimulus"
import { toggleTargetsByValue } from "../utils/toggle_visibility"
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

  

  toggleExperienceHarrassment(event) {
    toggleTargetsByValue(event.target.value, this.experienceHarrassmentYesTarget, "Yes");
  }

  toggleCaseFiling(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.caseFilingYesTarget, "Yes");
    toggleTargetsByValue(value, this.caseFilingNoTarget, "No");
  }

  toggleCaseDecision(event) {
    toggleTargetsByValue(event.target.value, this.caseDecisionGroupTarget, ["Yes", "No"]);
  }

  toggleVictimInDetention(event) { 
    const value = event.target.value;
    toggleTargetsByValue(value, this.victimInDetentionYesTarget, "Yes");
    toggleTargetsByValue(value, this.victimInDetentionNoTarget, "No");
  }

  toggleCaseFilingAgainstPerpetrator(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.caseFilingAgainstPerpetratorYesTarget, "Yes");
    toggleTargetsByValue(value, this.caseFilingAgainstPerpetratorNoTarget, "No");
  }

  toggleStateAction(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.stateActionYesTarget, "Yes");
    toggleTargetsByValue(value, this.stateActionNoTarget, "No");
  }
}