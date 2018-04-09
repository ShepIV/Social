Rails.application.routes.draw do
  root 'index#home'
  devise_for :users
  resources :users, except: %i[destroy create] do
    resources :conversations, only: %i[index create] do
      resources :messages, only: [:create]
      member do
        post :close
      end
    end
    resources :posts do
      member do
        post :likes
        post :unlikes
      end
      resources :comments, only: %i[create destroy] do
        member do
          post :likes
          post :unlikes
        end
      end
    end
    member do
      post :follow
      post :unfollow
    end
  end
end
