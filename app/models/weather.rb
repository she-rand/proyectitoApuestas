class Weather < ApplicationRecord
  has_many:raffles
  def self.forecast_from_api
    headers = {
      'x-rapidapi-host' => "community-open-weather-map.p.rapidapi.com",
      'x-rapidapi-key' => "a402c1becdmsh32280587dc0cc5fp1942ccjsna72e3da74bdb"
  }

  url = 'https://community-open-weather-map.p.rapidapi.com/climate/month'
  params = '?q=Santiago'
  response = HTTParty.get(url+params,
    :headers => headers
  )

    logger.info "Mostrando json #{response.parsed_response["list"][7]["dt"]}"
    forecast_temp=response.parsed_response["list"][7]["temp"]["average_max"].to_f-273.15
    forecast_date=response.parsed_response["list"][7]["dt"]
    return Weather.create(forecast_date:Time.at(forecast_date),forecast_temp:forecast_temp)
    #puts response.read_body
    #Weather.create(forecast_date:json[7].dt)
  end
  def self.forecast_today
    date=Time.now
    weathers=Weather.all
    finded=false

    weathers.each do |weather|
      if(weather.created_at.day==date.day&&weather.created_at.month==date.month&&weather.created_at.year==date.year)
        finded=true
        return weather
      end
    end

    return self.forecast_from_api()

  end
end
