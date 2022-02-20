Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/players' => 'players#index'

  get '/players/new'=>'players#new'


  get '/players/:id' => 'players#show', as: :player

  get '/players/:id/edit' => 'players#edit' , as: :edit_player

  patch '/players/:id' => 'players#update'

  post 'players' => 'players#create'

  get '/raffles' => 'raffles#index'

  get '/raffle/:id' => 'raffles#show' , as: :raffle

  get '/raffles/new' => 'raffles#new'

  post 'raffles' => 'raffles#create'

  resources :players do
    resources :transfers
  end

  get '/players/:player_id/transfers' => 'transfers#index'

  get '/players/:player_id/transfers/new' =>'transfers#new'

  post '/players/:player_id/transfers' => 'transfers#create'

end
