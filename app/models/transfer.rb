class Transfer < ApplicationRecord
  belongs_to :player
  def self.balance(transfers)
    total=0
    transfers.each do |transfer|
      total+=transfer.amount.to_i
    end
    total
  end

  def self.calc_bet_amount(transfers)
    total=self.balance(transfers)
    bet_amount=0
    if  total==0
      bet_amount=0
    elsif total<=1000
      betamount=total
    else
      nrandom=rand(99)
      percentage=(7.0/99.0)*(nrandom-8)+8
      factor=percentage/100.0
      bet_amount=total*factor
    end
    bet_amount
    end

end
