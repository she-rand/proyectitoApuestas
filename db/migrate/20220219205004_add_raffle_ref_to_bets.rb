class AddRaffleRefToBets < ActiveRecord::Migration[7.0]
  def change
    add_reference :bets, :raffle, null: false, foreign_key: true
  end
end
