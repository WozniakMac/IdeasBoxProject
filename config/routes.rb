Rails.application.routes.draw do

  # public
  root 'homepage#index'
  devise_for :users
  resources :boxes, only: [:index, :show, :edit, :update, :new, :create] do
    resources :ideas, only: [:show, :create, :new] do
      resources :comments, only: [:create, :show, :new]
      get 'comments', to: 'comments#new', as: 'new'
      post 'like', to: 'votes#like', as: 'like'
      post 'dislike', to: 'votes#dislike', as: 'dislike'
      post 'unlike', to: 'votes#unlike', as: 'unlike'
    end
    get 'fresh', to: 'boxes#fresh', as: 'fresh'
    get 'popular', to: 'boxes#popular', as: 'popular'
    get 'planned', to: 'boxes#planned', as: 'planned'
    get 'inprogress', to: 'boxes#in_progress', as: 'inprogress'
    get 'completed', to: 'boxes#completed', as: 'completed'
  end
end
