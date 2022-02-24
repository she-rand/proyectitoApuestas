class WeatherJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    logger.info "Consultando el tiempo Job:::::::::::::::::::: "

  end
end
