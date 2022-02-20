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
    nrandom=rand(99)
    if nrandom==0||nrandom==1
      color='verde'
    elsif nrandom>1&& nrandom<50
      color='rojo'
    else
      color='negro'
    end
    @raffle=Raffle.new({color:color})
    if @raffle.save
      redirect_to '/raffles'
    else
      render '/new'
    end
  end
  private
  def raffle_params
    params.require(:raffle).permit(:color)
  end

end
