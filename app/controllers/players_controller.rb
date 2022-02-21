class PlayersController < ApplicationController
  def index
    @players=Player.all
  end
  def show
    @player=Player.find(params[:id])
    @raffles=@player.raffles
    @bets=@player.bets
    @transfer=@player.transfers
  end
  def new
    @player=Player.new
  end
  def create
    @player=Player.new(player_params)
    @transfer=@player.transfers.build({amount:"10000"})

    if @player.save

      redirect_to '/players'
    else
      render '/new'
    end
  end
  def edit
    @player=Player.find(params[:id])

  end
  def update
    @player=Player.find(params[:id])
    if @player.update(player_params)
      redirect_to(:action => 'show',:id => @player.id)
    else
      render 'edit'
    end
  end
  private
  def player_params
    params.require(:player).permit(:first_name,:last_name,:rut)
  end



end
