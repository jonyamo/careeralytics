Rails.application.routes.draw do
  resources :trends, only: [:index]
end
