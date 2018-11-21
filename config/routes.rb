Rails.application.routes.draw do
  devise_for :users

  root to: 'home#landing_page'

  resources :posts

  get '/users' => 'posts#index'

end
