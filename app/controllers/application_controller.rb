class ApplicationController < ActionController::Base
  before_action :set_search_article, :set_search_user
  before_action :show_header, :show_footer

  private

  def set_search_article
    @search_article = Article.search(params[:article_q])
  end

  def set_search_user
    @search_user = User.search(params[:user_q])
  end

  def show_header
    @show_header = true
  end

  def hide_header
    @show_header = false
  end

  def show_footer
    @show_footer = true
  end

  def hide_footer
    @show_footer = false
  end
end
