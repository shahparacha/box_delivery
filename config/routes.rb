Rails.application.routes.draw do
  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                    controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
#     get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
#     get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
#   end
#
#   devise_scope :user do
#     get '/users/auth/facebook' => 'users/omniauth_callbacks#passthru'
#     get '/users/auth/facebook/callback' => 'users/omniauth_callbacks#passthru'
#   end

  resources :users do
    collection do
      get 'logged_in'
       get 'get_current_user'
    end  
  end
  
  get 'auth/failure' => redirect('/')
  get 'home/index'
  root :to => "home#index"
  scope :api, defaults: { format: 'json' } do
    scope :v1 do 
      resources :invoices, only: [:create]
      resources :users do
        resources :payments, only: [:create]
      end
      resources :drivers, only: [:create, :show, :update] do 
        resources :invoices, only: [:create, :update, :destroy]
      end
      resources :products, only: [:create, :show, :update, :index]
    end
  end
end