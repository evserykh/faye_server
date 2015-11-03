class RedisPing
  def self.ping(options)
    begin
      Redis.new(options).ping
    rescue
      abort "Redis at #{options} is unavailable"
    end
  end
end
