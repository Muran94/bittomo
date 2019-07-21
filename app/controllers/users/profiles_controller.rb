class Users::ProfilesController < ApplicationController
  # GET /users/1/profiles
  # GET /users/1/profiles.json
  def show
    @user = User.find(params[:user_id])
    @conversation = Conversation.find_or_initialize_by(sender_id: current_user&.id, receiver_id: @user.id)
    @conversation.messages.build
  end
end
