class StaticsController < ApplicationController
  def top
    @articles = Article.all.last(3)
    @users = User.all.last(3)
  end
end
