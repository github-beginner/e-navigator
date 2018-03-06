Rails.application.routes.draw do
  get 'interviews', :to => 'interviews#index', :as => 'interviews'
  resources :interviews
  get 'users', :to => 'users#index', :as => :user_root
  root :to => 'users#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
