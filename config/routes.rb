Rails.application.routes.draw do

  root 'index#home'

  devise_for :users

  resources :users
  resources :profiles

end
