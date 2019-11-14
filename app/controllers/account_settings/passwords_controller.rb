class AccountSettings::PasswordsController < AccountSettings::BaseController
  before_action :set_user

  # GET /account_settings/passwords/edit
  def edit
  end

  # PATCH/PUT /account_settings/passwords
  def update
    if @user.update_with_password(user_params)
      redirect_to account_settings_path, notice: "パスワードを変更しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
