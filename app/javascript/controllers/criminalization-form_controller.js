import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "experienceHarrassmentGroup",
    "caseFilingGroup",
    "caseDecisionGroup",
    "victimInDetentionGroup",
    "caseFilingAgainstPerpetratorGroup",
    "stateActionGroup",
    "investigationGroup"
  ]

  toggleExperienceHarrassment() {
    this.experienceHarrassmentGroupTargets.forEach((el) => {
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

  toggleCaseDecision() {
    this.caseDecisionGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleVictimInDetention() {
    this.victimInDetentionGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleCaseFilingAgainstPerpetrator() {
    this.caseFilingAgainstPerpetratorGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleStateAction() {
    this.stateActionGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  toggleInvestigation() {
    this.investigationGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}