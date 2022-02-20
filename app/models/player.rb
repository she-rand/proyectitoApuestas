class Player < ApplicationRecord
  has_many :bets
  has_many :raffles, through: :bets
  has_many :transfers
end
