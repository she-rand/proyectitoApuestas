class TransfersController < ApplicationController
def index
  @player=Player.find(params[:player_id])
  @transfers=Transfer.all
end
def new
  @player=Player.find(params[:id])
  @transfer=Transfer.new
end
private
def transfer_params
  params.require(:transfer).permit(:balance)
end

def create
  @player=Player.find(params[:id])
  @tranfer=@player.build(params[:transfer])
  if @transfer.save
    redirect_to(:action=>'index',:id=>@player.id)
  else
    render 'new'

  end
end
end
