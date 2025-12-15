class CaregiversController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])

    @chats = @patient.chats.where(user: current_user)
  end

  def create
    caregiver = Caregiver.find_or_create_by!(user: current_user)
    redirect_to caregiver_patients_path, notice: "Perfil de cuidador ativo."
  end

end
