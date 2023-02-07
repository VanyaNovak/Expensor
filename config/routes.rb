Rails.application.routes.draw do
  devise_for :users
  root "expenses#index"
end
