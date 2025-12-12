import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "image"]

  choose() {
    this.inputTarget.click()
  }

  preview() {
    const file = this.inputTarget.files[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = (e) => {
      this.imageTarget.src = e.target.result
    }
    reader.readAsDataURL(file)
  }
}
