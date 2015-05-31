Rails.application.routes.draw do

  # public
  root 'homepage#index'
  devise_for :users
  resources :boxes, only: [:index, :show] do
    resources :ideas do
      resources :comments
      resources :votes
    end
  end

  # admin
  namespace :admin do
    get '', to: 'boxes#index', as: '/'
    resources :boxes do
      resources :ideas do
        resources :comments
        resources :votes
      end
    end
  end

  # manager
  namespace :manager do
    get '', to: 'boxes#index', as: '/'
    resources :boxes do
      resources :ideas do
        resources :comments
        resources :votes
      end
    end
  end
end
