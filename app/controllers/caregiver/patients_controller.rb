class Caregiver::PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    is_caregiver = current_user.caregiver
    unless is_caregiver
      Caregiver.create(user: current_user)
    end

    @patients = Patient.all

  end

  def show
    @patient = Patient.find(params[:id])
  end
end
