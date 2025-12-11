import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "masterSwitch", "subSwitch"]

  toggle() {
    this.panelTarget.style.display =
      this.panelTarget.style.display === "none" ? "block" : "none"
  }

  toggleMaster(event) {
    const checked = event.target.checked
    this.subSwitchTargets.forEach(sw => {
      sw.checked = checked
      sw.disabled = !checked
    })
  }
}
