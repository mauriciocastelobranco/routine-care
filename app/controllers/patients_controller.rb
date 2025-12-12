class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @medication = Medication.new
    @appointment = Appointment.new
    @cares = Care.new
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    if @patient.save
      redirect_to patients_path, notice: "Paciente criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: "Paciente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path, notice: "Paciente excluído com sucesso."
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :name,
      :birth,
      :address,
      :insurance,
      :insurance_number
      )
    @chats = @patient.chats.where(user: current_user)
  end
end
