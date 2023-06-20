Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'searches#input'
  get '/home', to: 'application#home'
  get '/search', to: 'searches#input'
  post '/search', to: 'searches#search'

end
