Rails.application.routes.draw do
  resources :merchants
  resources :sales
  resources :company_sales
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
