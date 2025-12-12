class Caregiver::PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @chats = @patient.chats.where(user: current_user)
  end
end
