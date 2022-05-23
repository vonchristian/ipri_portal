import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    console.log("Connected");
  }
  static targets = [ "referToIndividualGroup" ]

  toggleReferToIndividuals() {
    this.referToIndividualGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}