class FayeLoggingExtension
  def initialize(logger)
    @logger = logger
  end

  def incoming(message, callback)
    @logger.info('FAYE') { message }

    callback.call message
  end
end
