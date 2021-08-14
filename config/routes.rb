# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants
      resources :sales
      resources :company_sales, except: [:update]
    end
  end
end
