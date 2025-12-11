import { Controller } from "@hotwired/stimulus";

const TOAST_LIMIT = 1;
const TOAST_REMOVE_DELAY = 4000; // 4s

export default class extends Controller {
  static targets = ["toast"];

  connect() {
    if (!window.toast) {
      window.toast = (options) => this.createToast(options);
    }
  }


  createToast({ title = "", description = "" }) {
    // remove toasts anteriores (limite 1)
    this.element.innerHTML = "";

    const toast = document.createElement("div");
    toast.className = "rc-toast shadow-lg rounded-3 bg-dark text-white p-3 mb-2 animate__fadeIn";

    toast.innerHTML = `
      <strong>${title}</strong>
      <p class="mb-0">${description}</p>
    `;

    this.element.appendChild(toast);

    setTimeout(() => {
      toast.classList.add("animate__fadeOut");
      setTimeout(() => toast.remove(), 400);
    }, TOAST_REMOVE_DELAY);
  }
}

window.toast({
  title: "Paciente criado",
  description: "O cadastro foi realizado com sucesso!"
});
window.toast({ title: "Sucesso", description: "Operação finalizada!" });
