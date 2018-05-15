Rails.application.routes.draw do
  resources :products do
    member do
      get :copy
    end
  end
  
  resources :product_categories do
    member do
      get :copy
    end
  end
  
  resources :product_types do
    member do
      get :copy
    end
  end
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

  post "/upload_photos/:file_id/add_photo", to: 'upload_files#add_photo'
  post "/upload_photos/upload_editor", to: 'upload_files#upload_editor'
  get "/upload_photos/:file_id/get_photos", to: 'upload_files#get_photos'
  delete "/upload_photos/:id", to: 'upload_files#destroy'

  devise_for :users

  get '/index', to: 'index#index'
  get '/index/:category_id', to: 'index#index'
  get '/product_details/:id', to: 'index#product_details', as: "product_details"
  root 'index#index'
end
