Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :categories, only: nil do

  end
  resources :expenses
end
