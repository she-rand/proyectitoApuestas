class AddWeatherRefToRaffles < ActiveRecord::Migration[7.0]
  def change
    add_reference :raffles, :weather, null: false, foreign_key: true
  end
end
