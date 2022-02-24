class RaffleProcessJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    Raffle.all_raffle_process()
    logger.info "Ejecutando Job:::::::::::::::::::: "

  end
end
