class Transfer < ApplicationRecord
  belongs_to :player
  def self.balance(transfers)
    total=0
    transfers.each do |transfer|
      total+=transfer.amount.to_i
    end
    total
  end

  def self.transfer_to_all
    players=Player.all
    players.each do |player|
      Transfer.create({amount:"10000",player:player})
    end
  end

  def self.calc_bet_amount(transfers)
    total=self.balance(transfers)
    weather=Weather.forecast_today()
    temp=weather.nil? ? nil : weather.forecast_temp
    bet_amount=0
    nrandom=rand(99)

    if  total==0
      bet_amount=0
    elsif total<=1000
      betamount=total
    elsif temp<=29
      percentage=(7.0/99.0)*nrandom+8
      factor=percentage/100.0
      bet_amount=total*factor
    elsif temp>29
      percentage=(4.0/99.0)*nrandom+3
      factor=percentage/100.0
      bet_amount=total*factor
    elsif temp.nil
      puts "Ocurrió un error con la temperatura"

    end
    bet_amount
    end

end
