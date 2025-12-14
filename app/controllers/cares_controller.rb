class CaresController < ApplicationController
  before_action :authenticate_user!

  def create
    patient = Patient.find(params[:patient_id])

    care = patient.cares.new(care_params)
    if care.save
      redirect_to patient_path(patient), notice: "Cuidador vinculado."
    else
      redirect_to patient_path(patient), alert: care.errors.full_messages.to_sentence
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    care = patient.cares.find(params[:id])
    care.destroy
    redirect_to patient_path(patient), notice: "Cuidador removido."
  end

  private

  def care_params
    params.require(:care).permit(:caregiver_id)
  end
end
