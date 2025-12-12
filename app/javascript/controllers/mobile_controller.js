import { Controller } from "@hotwired/stimulus";

const MOBILE_BREAKPOINT = 768;

export default class extends Controller {
  static targets = ["desktop", "mobile"];

  connect() {
    this.mql = window.matchMedia(`(max-width: ${MOBILE_BREAKPOINT - 1}px)`);
    this.onChange = this.onChange.bind(this);
    this.mql.addEventListener("change", this.onChange);
    this.onChange();
  }

  disconnect() {
    if (this.mql && this.onChange) {
      this.mql.removeEventListener("change", this.onChange);
    }
  }

  onChange() {
    const isMobile = window.innerWidth < MOBILE_BREAKPOINT;

    if (this.hasDesktopTarget) {
      this.desktopTarget.classList.toggle("d-none", isMobile);
    }

    if (this.hasMobileTarget) {
      this.mobileTarget.classList.toggle("d-none", !isMobile);
    }
  }
}
