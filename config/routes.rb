Rails.application.routes.draw do

  root 'index#home'

  devise_for :users

  resources :users, except: [:destroy, :create] do
    member do
      post :load_posts
    end
    resources :conversations, only: [:index, :create] do
      resources :messages, only: [:create]
      member do
        post :close
      end
    end
    member do
      post :follow
      post :unfollow
    end

    resources :posts do
      member do
        post :likes
        post :unlikes
      end
      resources :comments, except: [:edit] do
        member do
          post :likes
          post :unlikes
        end
      end

    end
  end
  resources :profiles

end
