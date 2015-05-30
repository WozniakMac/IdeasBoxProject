Rails.application.routes.draw do

  # public
  root 'homepage#index'
  devise_for :users

  # administration box (admin)

  # administrations webpage (superadmin)
end
