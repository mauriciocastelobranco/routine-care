import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-display"
export default class extends Controller {
  static targets = ["form"]

  toggle() {
    this.formTarget.classList.toggle("d-none")
  }
}
