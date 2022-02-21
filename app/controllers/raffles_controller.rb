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
    color=random_color()
    @raffle=Raffle.new({color:color})
    @players=Player.all

    @players.each do |player|
      color=random_color()
      @transfers=player.transfers
      bet_amount=Transfer.calc_bet_amount(@transfers)
      if bet_amount>0
        @bet=@raffle.bets.new({bet_color:color,bet_amount:bet_amount, player:player})
      end
    end

    if @raffle.save
      redirect_to '/raffles'
    else
      render '/new'
    end
  end

  def random_color
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
