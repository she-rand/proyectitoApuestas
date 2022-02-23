class WorkerNameJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
    logger.info "Ejecutando Job:::::::::::::::::::: "

  end
end
