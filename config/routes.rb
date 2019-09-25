Rails.application.routes.draw do
  get 'dashboard/show'
  get 'welcome/index'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'auth0#logout'
  get 'dashboard' => 'dashboard#show'

  
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
