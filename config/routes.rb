Rails.application.routes.draw do
  resources :trends, only: [:index]
  root "trends#index"
end
