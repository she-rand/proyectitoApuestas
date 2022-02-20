class RafflesController < ApplicationController
  def index
    @raffles=Raffle.all
  end
  def show
    @raffle=Raffle.find(params[:id])
    @players=@raffle.players
  end
end
