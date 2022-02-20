class ChangeWalletStatusToTransfer < ActiveRecord::Migration[7.0]
  def change
      rename_table :wallet_statuses, :transfers
  end
end
