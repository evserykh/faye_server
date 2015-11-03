class LoggerBuilder
  def self.build(*args)
    Logger.new(args.shift).tap do |logger|
      args.each do |arg|
        logger.extend ActiveSupport::Logger.broadcast(Logger.new(arg))
      end
    end
  end
end
