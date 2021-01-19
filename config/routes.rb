Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    rregistrations: 'users/registrations'
  }
  root to: "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
