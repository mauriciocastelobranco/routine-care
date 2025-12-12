class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
  @patient = Patient.find(params[:id])
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

  def destroy
  @patient = Patient.find(params[:id])
  @patient.destroy

  redirect_to patients_path, notice: "Paciente excluído com sucesso."
  end

  private

  def patient_params
    params.require(:patient).permit(
      :name,
      :birth,
      :address,
      :insurance,
      :insurance_number
      )
  end
end
