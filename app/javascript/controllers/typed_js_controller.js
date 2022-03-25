import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Trouvez la chambre qu’il vous faut !", "Au prix qu'il vous faut !"],
      typeSpeed: 55,
      loop: true
    });
  }
}
