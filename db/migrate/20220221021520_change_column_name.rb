class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
        rename_column :transfers, :balance, :amount
  end
end
