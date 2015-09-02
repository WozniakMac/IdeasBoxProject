Rails.application.routes.draw do

  # public
  root 'homepage#index'
  devise_for :users
  resources :boxes, only: [:index, :show] do
    resources :ideas, only: [:show, :create, :new] do
      resources :comments, only: :create
      post 'like', to: 'votes#like', as: 'like'
      post 'dislike', to: 'votes#dislike', as: 'dislike'
      post 'unlike', to: 'votes#unlike', as: 'unlike'
    end
    get 'about', to: 'boxes#about', as: 'about'
    get 'fresh', to: 'boxes#fresh', as: 'fresh'
    get 'popular', to: 'boxes#popular', as: 'popular'
    get 'planned', to: 'boxes#planned', as: 'planned'
    get 'inprogress', to: 'boxes#in_progress', as: 'inprogress'
    get 'completed', to: 'boxes#completed', as: 'completed'
  end

  # admin
  namespace :admin do
    get '', to: 'boxes#index', as: '/'
    resources :boxes do
      resources :ideas, only: [ :show, :edit, :update, :destroy] do
        resources :comments
      end
    end
  end

  # manager
  namespace :manager do
    get '', to: 'boxes#index', as: '/'
    resources :boxes, only: [ :index, :new, :show, :edit, :update, :create] do
      resources :ideas, only: [:show, :update ] do
        resources :comments, only: :create
      end
    end
  end
end
