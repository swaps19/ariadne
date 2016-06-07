require 'ariadne/data_util'
require 'json'
require 'time'
require 'redis'

module Ariadne
  DataUtil.init_redis_cli(Redis.new(url: ENV['REDIS_URL']))

  def self.insert_data(options = {})
    raise 'Please specify options to be passed for Ariadne.insert_data method!' if options.size <= 0
    raise 'Please specify id and application name to be passed for Ariadne.insert_data method!' if options[:id].nil? || options[:id].size <= 0
    DataUtil.insert_data_in_redis(options.merge!(app_name: get_app_name(options[:app_name])))
  rescue StandardError => e
    puts e
    e
  end

  def self.get_data(app_name = '')
    DataUtil.get_data_from_redis(get_app_name(app_name))
  rescue StandardError => e
    puts e
    e
  end

  def self.get_data_with_time_difference(app_name = '')
    redis_data = get_data(get_app_name(app_name))
    default_time_diff_threshold = 30
    output_data = []
    unless redis_data.nil?
      redis_data.each do |raw_data|
        next if raw_data.nil?
        json_data         = JSON.parse(raw_data)
        time_diff         = Time.now - Time.parse(json_data['time'])
        # 'diff_val' is a variable to decide time period after which the `json_data`
        #   will be included in the `output_data` to be passed to the desired app.
        diff_val          = (json_data['delay_interval'] || default_time_diff_threshold).to_i
        json_data['time_diff'] = time_diff
        output_data << json_data if time_diff > diff_val
      end
    end
    output_data.to_json
  end

  def self.get_app_name(app_name = '')
    app_name = ENV['APP_NAME'] if app_name.nil? || app_name.size <= 0
    app_name || ''
  end
end
