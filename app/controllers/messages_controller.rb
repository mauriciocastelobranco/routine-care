class MessagesController < ApplicationController
  SYSTEM_PROMPT = "You are a nurse Assistant.\n\nI am a person putting information about a patient in the database of our system.\n\nHelp me break down my information into small pieces, categorizing each one of the informations.\n\nDo it concisely."

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @patient = @chat.patient

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)

      @chat.messages.create(role: "assistant", content: response.content)
      @chat.generate_title_from_first_message
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def patient_context
  "Here is the context of the patient: #{@patient.name}, #{@patient.address}, #{@patient.insurance}, #{@patient.insurance_number}"
  end

  def instructions
    @medications = ""
    @patient.medications.each do |medication|
      @medications += "#{medication.name} - #{medication.dosage}, "
    end

    @appointments = ""
    @patient.appointments.each do |appointment|
      @appointments += "#{appointment.title}: #{appointment.occurs_at} - #{appointment.notes}, "
    end

    [SYSTEM_PROMPT, patient_context, @patient.system_prompt, @medications, @appointments].compact.join("\n\n")
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end
end
