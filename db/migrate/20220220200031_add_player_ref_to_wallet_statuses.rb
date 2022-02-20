class AddPlayerRefToWalletStatuses < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallet_statuses, :player, null: false, foreign_key: true
  end
end
