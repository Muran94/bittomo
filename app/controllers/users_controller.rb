class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page])
  end
end
