import { Controller } from "@hotwired/stimulus"
import { toggleTargetsByValue } from "utils/toggle_visibility"

export default class extends Controller {
  static targets = [
    "actionTakenYes",
    "actionTakenNo",
    "investigationOnViolationYes",
    "investigationOnViolationNo"
  ]

  toggleActionTaken(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.actionTakenYesTarget, "Yes");
    toggleTargetsByValue(value, this.actionTakenNoTarget, "No");
  }

  toggleInvestigation(event) {
    const value = event.target.value;
    toggleTargetsByValue(value, this.investigationOnViolationYesTarget, "Yes");
    toggleTargetsByValue(value, this.investigationOnViolationNoTarget, "No");
  }
}