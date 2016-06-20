
module DataUtil
  def self.init_redis_cli(obj = nil)
    @redis_cli = obj
  end

  def self.get_data_from_redis(id:, app_name:)
    key  = id.nil? ? "#{app_name}*" : "#{app_name}:#{id}"
    keys = @redis_cli.keys key
    raise "Data not available for #{app_name}!" if keys.empty?
    keys.compact!
    redis_data = (@redis_cli.mget keys)
    redis_data
  rescue StandardError => e
    puts e
  end

  def self.insert_data_in_redis(options = {})
    key = "#{options[:app_name]}:#{options[:id]}"
    options[:time] = Time.now
    redis_data = nil
    @redis_cli.pipelined do
      redis_data = @redis_cli.set key, options.to_json
      @redis_cli.expire(key, (24 * 60 * 60)) # expire a key after 1 day
    end
    redis_data
  end
end
