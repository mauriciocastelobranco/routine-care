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
  chat = current_user.chats.find(params[:id])
  patient = chat.patient

  chat.destroy
  redirect_to patient_path(patient), notice: "Chat excluído."
end

  private

  def care_params
    params.require(:care).permit(:caregiver_id)
  end
end
