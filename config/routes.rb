Rails.application.routes.draw do
  
  resources :supports
  resources :causes
  get 'static/index'
  get 'static/not_index'
  devise_for :users
  root to: 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
