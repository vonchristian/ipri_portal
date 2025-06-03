import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['filterForm']
  submit() {
    const form = this.filterFormTarget;
    const url = new URL(window.location);

    for (const input of form.elements) {
      if (input.name) {
        if (input.value) {
          url.searchParams.set(input.name, input.value);
        } else {
          url.searchParams.delete(input.name);
        }
      }
    }

    history.pushState({}, '', url);
    form.requestSubmit();
  }
}