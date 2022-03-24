import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    home: Boolean
  }

  connect() {
    if (!this.homeValue) this.element.classList.add("navbar-lewagon-white");
  }

  updateNavbar() {
    if (!this.homeValue) return ;

    if (window.scrollY > (window.innerHeight-90)) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}
