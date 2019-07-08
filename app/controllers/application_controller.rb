class ApplicationController < ActionController::Base
  before_action :show_header, :show_footer

  private

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
