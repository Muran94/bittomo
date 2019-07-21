class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  # GET /messages
  # GET /messages.json
  def index
    @messages = @conversation.messages.order(created_at: :desc)
    @messages.unread(@conversation.partner(current_user)).update_all(read: true) # 既読処理
    @new_message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = @conversation.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_path(@conversation), notice: 'メッセージを送信しました。' }
        format.json { render :show, status: :created, location: conversation_messages_path(@conversation) }
      else
        format.html { render :index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def message_params
      _params = {}
      _params = params.require(:message).permit(:body)
      _params.merge!(user_id: current_user.id)
      _params
    end
end
