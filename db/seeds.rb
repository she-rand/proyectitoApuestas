# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
weather=Weather.forecast_from_api()
players=Player.create([{first_name:"Eufranio",last_name:"Perez",rut:"1-1"},{first_name:"Anatolio",last_name:"Burgos",rut:"1-1"},{first_name:"Gerónimo",last_name:"Martínez",rut:"3-3"},{first_name:"Martín",last_name:"Rivas",rut:"4-4"}])
raffles=Raffle.create([{color:"rojo",weather:weather},{color:"rojo",weather:weather},{color:"verde",weather:weather},{color:"negro",weather:weather},{color:"verde",weather:weather},{color:"negro",weather:weather}])
bets=Bet.create([{bet_amount:"4000",bet_color:"rojo",player:players[0],raffle:raffles[0]}])

transfers=Transfer.create([{amount:"10000",player:players[0]},{amount:"12000",player:players[0]}])
