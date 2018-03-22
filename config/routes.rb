Rails.application.routes.draw do
  resources :interviews
  get 'users', :to => 'users#index', :as => :user_root
  root :to => 'users#index'
  devise_for :users
  post 'send_request_email', :to => 'interviews#send_request_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
