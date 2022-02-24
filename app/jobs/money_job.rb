class MoneyJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    logger.info ":::::::::::::::::::: "
    logger.info "Repartiendo Money Job:::::::::::::::::::: "
    logger.info ":::::::::::::::::::: "

  end
end
