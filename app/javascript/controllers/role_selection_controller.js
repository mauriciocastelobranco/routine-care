import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "cta", "link", "form"]

  connect() {
    this.selectedRole = null
    // O botão começa desabilitado se definido no HTML, ou garantimos aqui:
    if (this.hasCtaTarget) this.ctaTarget.disabled = true
  }

  select(event) {
    event.preventDefault()

    // Pega o valor do dataset do elemento clicado
    const role = event.currentTarget.dataset.roleValue
    this.selectedRole = role

    // Atualiza classes visuais
    this.itemTargets.forEach((el) => {
      // Toggle class baseado se é o elemento atual
      el.classList.toggle("is-selected", el.dataset.roleValue === role)
    })

    // Habilita o botão
    if (this.hasCtaTarget) this.ctaTarget.disabled = false
  }

  confirm() {
    if (!this.selectedRole) return

    if (this.selectedRole === "family") {
      // Busca o link target
      if (this.hasLinkTarget) {
        // Turbo.visit é melhor que window.location para manter o SPA feel
        // Mas se precisar forçar reload, use window.location
        window.location.href = this.linkTarget.href
      }
    } else if (this.selectedRole === "caregiver") {
      if (this.hasFormTarget) {
        this.formTarget.requestSubmit() // requestSubmit é o padrão moderno
      }
    }
  }
}
