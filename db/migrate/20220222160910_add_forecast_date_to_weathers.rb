class AddForecastDateToWeathers < ActiveRecord::Migration[7.0]
  def change
    add_column :weathers, :forecast_date, :timestamp
  end
end
