class RafflesController < ApplicationController
  def index
    @weather=Weather.find(params[:weather_id])
    @raffles=@weather.raffles
  end

  def new
    @weather=Weather.find(params[:weather_id])
    @raffle=Raffle.new

  end

  def create
    @weather=Weather.find(params[:weather_id])

    color=Raffle.random_color()
    @raffle=Raffle.create({color:color,weather:@weather})
    @players=Player.all

    @players.each do |player|
      color=Raffle.random_color()


      @transfers=player.transfers
      bet_amount=Transfer.calc_bet_amount(@transfers)
      if bet_amount>0
        @bet=@raffle.bets.create({bet_color:color,bet_amount:bet_amount, player:player})
        Bet.pay_bet(@bet)
        #@transfer=Transfer.create({amount:"10074",player:player})


      end
    end

    if @raffle.save
      redirect_to(controller:'raffles', action:'index',id:@weather.id)
    else
      render '/new'
    end
  end



  private
  def raffle_params
    params.require(:raffle).permit(:color)
  end

end
