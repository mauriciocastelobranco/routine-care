class Caregiver::PatientsController < ApplicationController
  before_action :authenticate_user!

    def index
      caregiver = current_user.caregiver
      @patients = caregiver ? caregiver.patients : Patient.none
    end

    def show
      caregiver = current_user.caregiver
      @patient = caregiver.patients.find(params[:id]) # garante que é “meu”
      @chats = @patient.chats
    end
end
