class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :not_found]

  def home
  end

  # SELECT ROLE -------------------
  def select_role
    @user = current_user
  end

  def update_role
    @user = current_user
    if @user.update(role_params)
      redirect_to onboarding_path, notice: "Perfil atualizado ✨"
    else
      flash.now[:alert] = "Escolha um perfil para continuar."
      render :select_role, status: :unprocessable_entity
    end
  end

  # ONBOARDING --------------------
  def onboarding
    @user = current_user
  end

  def complete_onboarding
    @user = current_user
    if @user.update(onboarding_completed: true)
      redirect_to patient_home_path, notice: "Onboarding concluído com sucesso! 💚"
    else
      flash.now[:alert] = "Ops, tente novamente."
      render :onboarding, status: :unprocessable_entity
    end
  end

  # PATIENT HOME ------------------
  def patient_home
    @patients = Patient.all # se depois tiver associação, troca por current_user.patients
  end

  # PATIENT PROFILE ---------------
  def patient_profile
    # Aqui você pode depois usar params[:id]. Por enquanto, pega o primeiro só pra demo.
    @patient = Patient.first
  end

  # REPORTS -----------------------
  def reports
    @total_patients = Patient.count

    @total_medications =
      defined?(Medication) ? Medication.count : nil

    @upcoming_appointments =
      if defined?(Appointment)
        Appointment.order(:created_at).limit(5)
      else
        []
      end
  end

  # SETTINGS ----------------------
  def settings
    @user = current_user
  end

  # NOT FOUND ---------------------
  def not_found
    respond_to do |format|
      format.html { render status: :not_found }
      format.any  { head :not_found }
    end
  end

  private

  def role_params
    params.require(:user).permit(:role)
  end
end
