Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  resources :destinations
  patch "/posts/likes/:id", to: "posts#add_like", as: 'add_like'

end
