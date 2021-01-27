Rails.application.routes.draw do

  get '/posts/mailer', to: 'posts#new_posts_mailer'

  resources :posts do
    post 'like', to: 'likes#like'
    delete 'unlike', to: 'likes#unlike'
    resources :comments, except: [:index, :update, :delete]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    rregistrations: 'users/registrations'
  }
  root to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
