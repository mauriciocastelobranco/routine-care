class AppointmentsController < ApplicationController

  def show
    @appointment = current_user.appointments.find(params[:id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new(title: Chat::DEFAULT_TITLE)
    @appointment.patient = @appointment
    @appointment.user = current_user

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @appointments = @title.appointments.where(user: current_user)
      render "patients/show"
    end
  end
end
