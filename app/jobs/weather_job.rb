class WeatherJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    Weather.forecast_from_api()
    logger.info "Consultando el tiempo Job:::::::::::::::::::: "

  end
end
