require_relative 'data_util'
require 'fakeredis'

DataUtil.init_redis_cli(redis_obj: Redis.new)