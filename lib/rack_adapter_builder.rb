class RackAdapterBuilder
  def self.build(settings, logger)
    options = {
      mount: settings['mount_path'],
      timeout: 25,
      engine: {
        type:  Faye::RedisDelayed,
        expire: 60 * 60 * 24 * 30,
        uri: settings['redis']['url']
      }
    }

    Faye::RackAdapter.new(options).tap do |adapter|
      adapter.add_extension Faye::Authentication::ServerExtension.new(settings['secret'])
      adapter.add_extension FayeLoggingExtension.new(logger)
    end
  end
end
