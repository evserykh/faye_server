require 'bundler/setup'

require 'active_support/core_ext/string'
require 'active_support/logger'
require 'faye'
require 'faye/authentication'
require 'faye/redis_delayed'
require 'redis'
require 'yaml'

ROOT = Pathname.new(File.expand_path('../..', __FILE__))

Dir[ROOT.join('lib/**/*.rb')].each { |f| require f }

class App
  def self.env
    ENV['RACK_ENV'] || 'development'
  end

  def self.logger
    @logger ||= Logger.new(ROOT.join("log/#{env}.log"))
  end

  def self.check!
    @settings = SettingsChecker.check(ROOT.join('config/settings.yml'))

    RedisPing.ping @settings['redis']
  end

  def self.rack_adapter
    RackAdapterBuilder.build(@settings, logger)
  end
end
