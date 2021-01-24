Rails.application.routes.draw do

  resources :posts do
    post 'like', to: 'likes#like'
    delete 'unlike', to: 'likes#unlike'
    resources :comments, except: [:index, :show, :update, :delete]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    rregistrations: 'users/registrations'
  }
  root to: "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
