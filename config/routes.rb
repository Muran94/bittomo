Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  get 'statics/top'
  resources :articles
  resources :improvement_requests, only: %i[new create]
  resources :inquiries, only: %i[new create]
  resources :users, only: %i[index] do
    scope module: 'users' do
      get '/', to: 'profiles#show'
      resource :profile, only: %i[show]
      resources :articles, only: %i[index]
    end
  end
end
