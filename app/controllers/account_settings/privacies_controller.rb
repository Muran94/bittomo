class AccountSettings::PrivaciesController < AccountSettings::BaseController
  before_action :set_privacy_setting

  def edit
  end

  def update
    if @privacy_setting.update(privacy_setting_params)
      redirect_to account_settings_path, notice: "公開設定を更新しました。"
    else
      render :edit
    end
  end

  private

  def set_privacy_setting
    @privacy_setting = current_user.privacy_setting
  end

  def privacy_setting_params
    params.require(:privacy_setting).permit(:show_activity_prefecture, :show_gender, :show_age)
  end
end
