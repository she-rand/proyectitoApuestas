Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/players' => 'players#index'

  get '/players/new'=>'players#new'


  get '/players/:id' => 'players#show', as: :player


  post 'players' => 'players#create'

  get '/raffles' => 'raffles#index'

  get '/raffle/:id' => 'raffles#show' , as: :raffle
end
