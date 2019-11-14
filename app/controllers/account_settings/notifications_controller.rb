class AccountSettings::NotificationsController < AccountSettings::BaseController
  before_action :set_notification_setting

  def edit
  end

  def update
    respond_to do |format|
      if @notification_setting.update(notification_setting_params)
        format.html { redirect_to account_settings_path, notice: '保存しました。' }
        format.json { render :show, status: :ok, location: account_settings_path }
      else
        format.html { render :edit }
        format.json { render json: @notification_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_notification_setting
    @notification_setting = current_user.notification_setting
  end

  def notification_setting_params
    params.require(:notification_setting).permit(:receive_article_arrival_notifications, :receive_message_notifications)
  end
end
