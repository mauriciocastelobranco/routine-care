class Caregiver::ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @patient = Patient.find(params[:patient_id])

    @chat = Chat.new(title: Chat::DEFAULT_TITLE)
    @chat.patient = @patient
    @chat.user = current_user

    if @chat.save
      redirect_to caregiver_chat_path(@chat)
    else
      @chats = @patient.chats.where(user: current_user)
      render "caregiver/patients/show", status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @patient = @chat.patient
    @message = Message.new
  end

  def destroy
    chat = current_user.chats.find(params[:id])
    patient = chat.patient

    chat.destroy
    redirect_to caregiver_patient_path(patient), notice: "Chat excluído."
  end
end
