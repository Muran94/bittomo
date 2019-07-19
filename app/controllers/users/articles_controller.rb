class Users::ArticlesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @articles = @user.articles.page(params[:page])
  end
end
