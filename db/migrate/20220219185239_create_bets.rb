class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :bet_amount
      t.string :bet_color
      
      t.timestamps
    end
  end
end
