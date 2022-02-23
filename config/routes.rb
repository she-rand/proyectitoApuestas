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


  resources :players do
    resources :transfers
  end

  get '/players/:player_id/transfers' => 'transfers#index'

  get '/players/:player_id/transfers/new' =>'transfers#new'

  post '/players/:player_id/transfers' => 'transfers#create'

  get 'weathers' => 'weathers#index'


  resources :weathers do
    resources :raffles
  end

  get 'raffles' => 'raffles#home'

  get '/weathers/:weather_id/raffles' => 'raffles#index'

#  get '/weathers/:weather_id/raffles/:id' => 'raffles#show' , as: :raffle

  get '/weathers/:weather_id/raffles/new' => 'raffles#new'

  post '/weathers/:weather_id/raffles' => 'raffles#create'
end
