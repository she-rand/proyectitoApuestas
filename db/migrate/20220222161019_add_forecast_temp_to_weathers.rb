class AddForecastTempToWeathers < ActiveRecord::Migration[7.0]
  def change
    add_column :weathers, :forecast_temp, :float
  end
end
