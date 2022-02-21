class RafflesController < ApplicationController
  def index
    @raffles=Raffle.all
  end
  def show
    @raffle=Raffle.find(params[:id])
    @players=@raffle.players
  end
  def new
    @raffle=Raffle.new
  end
  def create
    @raffle=Raffle.new({color:color})
    @players=Player.all
    @players.each do |player|
      color=randomcolor()

      @bets=@raffle.bets.new({bet_color:color,bet_amount:"6000", player:player})

    end
    if @raffle.save
      @raffle.bets.build(player:@players[0],bet_color:color,bet_amount:'6000')
      redirect_to '/raffles'
    else
      render '/new'
    end
  end
  def randomcolor
    nrandom=rand(99)
    if nrandom==0||nrandom==1
      color='verde'
    elsif nrandom>1&& nrandom<50
      color='rojo'
    else
      color='negro'
    end
    color
  end
  
  private
  def raffle_params
    params.require(:raffle).permit(:color)
  end

end
