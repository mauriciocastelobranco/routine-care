class AppointmentsController < ApplicationController


  def index
    @appointments = @patient.appointments
  end

  def show
  end

  def new
    @appointment = @patient.appointments.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient), notice: "Consulta criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path(@patient), notice: "Consulta atualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to patient_appointments_path(@patient), notice: "Consulta removida."
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_appointment
    @appointment = @patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :title,
      :specialty,
      :occurs_at,
      :notes,
      )
  end
end
