# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :company_sales, except: [:update]
      resources :total_all_time_gross_income, only: [:index]
    end
  end
end
