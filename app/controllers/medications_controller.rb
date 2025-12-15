class MedicationsController < ApplicationController
  before_action :set_patient
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @medications = @patient.medications
  end

  def show
  end

  def new
    @medication = @patient.medications.new
  end

  def create
    @medication = @patient.medications.new(medication_params)
    if @medication.save
      redirect_to patient_medications_path(@patient), notice: "Medicação criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  @patient = Patient.find(params[:patient_id])
  @medication = @patient.medications.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @medication = @patient.medications.find(params[:id])

    if @medication.update(medication_params)
      redirect_to patient_path(@patient), notice: "Medicamento atualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    medication = patient.medications.find(params[:id])
    medication.destroy

    redirect_to patient_path(patient), notice: "Medicamento removido."
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_medication
    @medication = @patient.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(
      :name,
      :dosage,
    )
  end
end
