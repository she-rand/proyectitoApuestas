class CreateRaffles < ActiveRecord::Migration[7.0]
  def change
    create_table :raffles do |t|
      t.string :color
      t.timestamps
    end
  end
end
