class IpmListenerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, backtrace: true
  def perform(params)
      logger.info '&' * 50
      logger.info %(#{params})

  end
end
