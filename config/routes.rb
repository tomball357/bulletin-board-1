Rails.application.routes.draw do
  root "boards#index"
  resources :boards, only: [:index, :show, :create]
  resources :posts, only: [:create]
end
