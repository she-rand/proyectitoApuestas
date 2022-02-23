class Bet < ApplicationRecord
  belongs_to :player
  belongs_to :raffle
  def self.pay_bet(bet)
    @player=bet.player
    @raffle=bet.raffle
    transfer_amount=0

    if(@raffle.color==bet.bet_color)
      transfer_amount=bet.bet_amount.to_i
    else
      transfer_amount=bet.bet_amount.to_i*(-1)

    end
    @transfer=@player.transfers.create({amount:transfer_amount})

  end
end
