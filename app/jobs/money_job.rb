class MoneyJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    Transfer.transfer_to_all()
    logger.info ":::::::::::Repartiendo Money Job:::::::::::::::::::: "


  end
end
