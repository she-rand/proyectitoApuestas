class BetsController < ApplicationController
  def create
    @player=Player.find(params[:player_id])
    @raffle=Raffle.find(params[:raffle_id])
  end

end
