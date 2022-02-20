class CreateJoinTablePlayerRaffle < ActiveRecord::Migration[7.0]
  def change
    create_join_table :players, :raffles do |t|
      # t.index [:player_id, :raffle_id]
      # t.index [:raffle_id, :player_id]
    end
  end
end
