Rails.application.routes.draw do

  resources :comments
  root 'index#home'

  devise_for :users

  resources :users, except: [:destroy, :create] do

    member do
      post :follow
      post :unfollow
    end

    resources :posts do
      member do
        post :likes
        post :unlikes
      end
      resources :comments do
        member do
          post :likes
          post :unlikes
        end
      end

    end
  end
  resources :profiles

end
