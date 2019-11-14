class AccountSettings::BaseController < ApplicationController
  before_action :authenticate_user!

  private

  def set_user
    @user = current_user
  end
end
