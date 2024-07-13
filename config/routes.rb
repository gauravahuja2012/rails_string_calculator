Rails.application.routes.draw do
  resources :calculators, only: [:index, :new, :create]
  root 'calculators#new'
end