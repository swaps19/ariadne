require_relative 'data_util'
require 'fakeredis'

DataUtil.init_redis_cli(Redis.new)
