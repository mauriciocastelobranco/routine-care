class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
  @patient = Patient.find(params[:id])
  @chats = @patient.chats.where(user: current_user)
  end
end
