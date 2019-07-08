Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  get 'statics/top'
  resources :articles
  resources :improvement_requests, only: %i[new create]
  resources :inquiries, only: %i[new create]
end
