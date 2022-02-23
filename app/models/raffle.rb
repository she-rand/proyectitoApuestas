class Raffle < ApplicationRecord
  has_many :bets
  has_many :players, through: :bets
  belongs_to :weather

  def self.random_color
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

  def self.all_raffle_process
    @weather=Weather.forecast_today()

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
  end
end
