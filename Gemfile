source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/" }
ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'image_processing', '~> 1.2'

# Custom Gems
gem 'bootstrap' # cssフレームワーク
gem 'jquery-rails' # bootstrap依存
gem 'jquery-ui-rails' # サイドバー等、リッチなフロントUIを提供するためのjsgem
gem 'seedbank' # seed拡張gem
gem 'devise' # アカウント周り（ログイン・会員登録など）をサポートするためのgem
gem 'pundit' # 認可用gem
gem 'annotate' # schemaを元に、モデル等にテーブル情報をコメントするためのgem
gem 'jp_prefecture' # 都道府県
gem 'carrierwave' # 画像アップロード用gem
gem 'rmagick' # 画像リサイズ用gem
gem 'ransack' # 検索用gem
gem 'notifications', '~> 0.6.0' # 通知機能
gem 'kaminari' # ページネーション
gem 'config' # 環境別にSettings.ymlを設定できるようにするためのgem
gem 'enum_help' # enumのlocale用
gem 'impressionist' # アクセス解析用
gem 'haml-rails' # erbの代わりとなるテンプレートエンジン

group :development, :test do
  # pry 周り
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'

  # RSpec周り
  gem 'rspec-rails', '~> 3.6'
  gem 'spring-commands-rspec' # RSpecの実行高速化
  gem "factory_bot_rails"
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
