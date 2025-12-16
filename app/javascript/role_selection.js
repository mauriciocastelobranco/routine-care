function initRoleSelection() {
  const root = document.querySelector(".role-page");
  if (!root) return;

  // evita duplicar listeners com Turbo
  if (root.dataset.roleInit === "1") return;
  root.dataset.roleInit = "1";

  const items = root.querySelectorAll(".role-item[data-action='select-role']");
  const cta = root.querySelector(".role-cta");

  let selectedRole = null;

  function setSelected(role) {
    selectedRole = role;

    items.forEach((el) => {
      el.classList.toggle("is-selected", el.dataset.target === role);
    });

    if (cta) cta.disabled = false;
  }

  items.forEach((el) => {
    el.addEventListener("click", (e) => {
      e.preventDefault();
      setSelected(el.dataset.target);
    });
  });

  if (cta) {
    cta.addEventListener("click", () => {
      if (!selectedRole) return;

      if (selectedRole === "family") {
        // navega direto (mais confiável do que click em link escondido)
        const link = root.querySelector("[data-role-link='family']");
        if (link && link.href) window.location.href = link.href;
        return;
      }

      if (selectedRole === "caregiver") {
        // submete o form direto (mais confiável do que click em botão display:none)
        const form = root.querySelector("form.role-hidden-btn");
        if (form) {
          if (form.requestSubmit) form.requestSubmit();
          else form.submit();
        }
        return;
      }
    });
  }
}

// Rails 7 (Turbo)
document.addEventListener("turbo:load", initRoleSelection);
// fallback
document.addEventListener("DOMContentLoaded", initRoleSelection);
