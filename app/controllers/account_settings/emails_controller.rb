class AccountSettings::EmailsController < AccountSettings::BaseController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to account_settings_path, notice: "メールアドレスを変更しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
