Rails.application.routes.draw do

  # public
  root 'homepage#index'
  devise_for :users
  resources :boxes
  resources :comments
  resources :ideas
  resources :votes

  # admin
  namespace :admin do
    get '', to: 'box#index', as: '/'
    resources :boxes
    resources :comments
    resources :ideas
    resources :votes
  end

  # manager
  namespace :manager do
    get '', to: 'box#index', as: '/'
    resources :boxes
    resources :comments
    resources :ideas
    resources :votes
  end
end
