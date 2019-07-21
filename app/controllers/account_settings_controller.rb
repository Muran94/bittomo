class AccountSettingsController < ApplicationController
  before_action :authenticate_user!

  # GET /account_settings
  # GET /account_settings.json
  def show
  end
end
