class TransfersController < ApplicationController
def index
  @player=Player.find(params[:player_id])
  @transfers=@player.transfers
end
def new
  @player=Player.find(params[:player_id])
  @transfer=Transfer.new
end


def create
  @player=Player.find(params[:player_id])
  @transfer=@player.transfers.build(transfer_params)
  if @transfer.save
    redirect_to(:action=>'index',:id=>@player.id)
  else
    render 'new'

  end
end

private
def transfer_params
  params.require(:transfer).permit(:amount)
end

end
