Rails.application.routes.draw do
  devise_for :users
  root 'statics#top'

  resource :account_settings, only: %i[show] do
    scope module: 'account_settings' do
      resource :article_notification_conditions, only: %i[edit update]
      resource :emails, only: %i[edit update]
      resource :passwords, only: %i[edit update]
      resource :profiles, only: %i[edit update]
      resource :privacies, only: %i[edit update]
      resource :notifications, only: %i[edit update]
    end
  end
  resources :articles
  resources :helps, only: %i[index]
  resources :improvement_requests, only: %i[new create]
  resources :inquiries, only: %i[new create]
  resources :privacy_policies, only: %i[index]
  resources :statics, only: %i[] do
    collection do
      get :top
    end
  end
  resources :terms, only: %i[index]
  resources :users, only: %i[index] do
    scope module: 'users' do
      get '/', to: 'profiles#show'
      resource :profile, only: %i[show]
      resources :articles, only: %i[index]
    end
  end
  resources :conversations, only: %i[index create] do
    resources :messages, only: %i[index create]
  end
end
