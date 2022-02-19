class Raffle < ApplicationRecord
  has_many :bets
  has_many :players, through: :bets
end
