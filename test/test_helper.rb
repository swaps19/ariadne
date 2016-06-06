$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'ariadne'
require 'minitest/autorun'
require 'ariadne/testing'
