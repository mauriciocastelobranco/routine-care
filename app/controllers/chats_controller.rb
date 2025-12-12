class ChatsController < ApplicationController
  def create
    @patient = Patient.find(params[:patient_id])

    @chat = Chat.new(title: Chat::DEFAULT_TITLE)
    @chat.patient = @patient
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = @patient.chats.where(user: current_user)
      render "patients/show"
    end
  end

  def show
    @chat    = current_user.chats.find(params[:id])
    @message = Message.new
  end
end
