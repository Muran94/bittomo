class Users::ProfilesController < ApplicationController
  # GET /users/1/profiles
  # GET /users/1/profiles.json
  def show
    @user = User.find(params[:user_id])
  end
end
