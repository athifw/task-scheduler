Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :rooms do
    resources :tasks do
    end
  end
end