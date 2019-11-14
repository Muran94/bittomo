crumb :root do
  link "トップ", root_path
end

crumb :articles do
  link "募集一覧", articles_path
end

crumb :article do |article|
  link article.title.truncate(10), article_path(article)
  parent :articles
end

crumb :new_article do
  link "記事作成", new_article_path
  parent :articles
end

crumb :edit_article do |article|
  link "編集", edit_article_path(article)
  parent :article, article
end

crumb :users do
  link "ユーザー一覧", users_path
end

crumb :user do |user|
  link "#{user.name}さん", user_profile_path(user)
end

crumb :users_articles do |user|
  link "募集記事一覧", user_articles_path(user)
  parent :user, user
end

crumb :account_settings do
  link "アカウント設定", account_settings_path
end

crumb :profile_edit do
  link "プロフィール編集", edit_account_settings_profiles_path
  parent :account_settings
end

crumb :privacy_setting do
  link "公開設定", edit_account_settings_privacies_path
  parent :account_settings
end

crumb :notification_settings do
  link "通知設定", edit_account_settings_notifications_path
  parent :account_settings
end

crumb :article_notification_condition_settings do
  link "新着募集の通知条件設定", edit_account_settings_article_notification_conditions_path
  parent :account_settings
end

crumb :email_edit do
  link "メールアドレス変更", edit_account_settings_emails_path
  parent :account_settings
end

crumb :password_edit do
  link "パスワード変更", edit_account_settings_passwords_path
  parent :account_settings
end

crumb :conversations do
  link "メッセージ一覧", conversations_path
end

crumb :helps do
  link "よくある質問", helps_path
end

crumb :new_inquiry do
  link "お問い合わせ", new_inquiry_path
end

crumb :new_improvement_request do
  link "サービス改善要望", new_improvement_request_path
end

crumb :terms do
  link "利用規約", terms_path
end

crumb :privacy_and_policies do
  link "プライバシーポリシー", privacy_policies_path
end
