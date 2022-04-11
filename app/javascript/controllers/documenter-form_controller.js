import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable", "phoneFieldGroup", "phone", "dataSourceGroup" ]

  togglePhoneGroup() {
    const element = this.phoneFieldGroupTarget
    if(element.classList.value.includes("hidden")) {
      element.classList.remove("hidden");
    } else {
      element.classList.add("hidden");
      this.phoneTarget.value = null;
    };
  }

  toggleDataSource() {
    this.dataSourceGroupTargets.forEach((el) => {
      if(el.classList.value.includes("hidden")) {
        el.classList.remove("hidden");
      } else {
        el.classList.add("hidden");
      };
    });
  }
}