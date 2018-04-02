Rails.application.routes.draw do
  resources :products
  resources :product_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :super do
    resources :dashboard_messages
    resources :users do
      member do
        put :update_profile
        put :update_income
      end
    end
  end

  scope :users do
    resources :profiles, path: 'profile'
  end

  devise_for :users

  get '/index', to: 'index#index'
  root 'index#index'
end
