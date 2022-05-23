import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [
    "experienceHarrassmentGroup",
    "perpetratorCategoryGroup",
    "caseFilingGroup",
    "stateActionToAddressGroup",
    "investigationOnKillingGroup"
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

  togglePerpetratorCategories() {
    this.perpetratorCategoryGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }

  togglestateActionToAddressKilling() {
    this.stateActionToAddressGroupTargets.forEach((el) => {
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

  toggleInvestigationOnKilling() {
    this.investigationOnKillingGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}