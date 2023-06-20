Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'shops#input'
  get '/home', to: 'application#home'
  get '/shops', to: 'shops#input'
  post '/shops', to: 'shops#search'
  get '/shops/:id', to: 'shops#show'
end
