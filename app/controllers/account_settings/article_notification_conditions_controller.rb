class AccountSettings::ArticleNotificationConditionsController < AccountSettings::BaseController
  before_action :set_article_notification_condition

  def edit
  end

  def update
    if @article_notification_condition.update(article_notification_condition_params)
      redirect_to account_settings_path, notice: "保存しました。"
    else
      render :edit
    end
  end

  private

  def set_article_notification_condition
    @article_notification_condition = current_user.article_notification_condition
  end

  def article_notification_condition_params
    params.require(:article_notification_condition).permit(:gender, :age_min, :age_max, prefecture_ids: [])
  end
end
