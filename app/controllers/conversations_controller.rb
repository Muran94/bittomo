class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.participating(current_user.id).page(params[:page])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to conversation_messages_path(@conversation), notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: conversation_messages_path(@conversation) }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def conversation_params
    _params = {}
    _params = params.require(:conversation).permit(:receiver_id, messages_attributes: [:body])
    # sender_idに関しては、フォームを経由して受け渡すと、成りすますことができてしまうので、current_userを裏側でセットしている
    _params.merge!(sender_id: current_user.id)
    _params["messages_attributes"]["0"].merge!(user_id: current_user.id)
    _params
  end
end
