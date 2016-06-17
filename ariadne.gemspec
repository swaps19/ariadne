# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ariadne/version'

Gem::Specification.new do |spec|
  spec.name          = 'ariadne'
  spec.version       = Ariadne::VERSION
  spec.authors       = ['Swapnil']
  spec.email         = ['swapnil@elitmus.com']
  spec.summary       = %q{heartbeat counter}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/elitmus/ariadne'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['ariadne']
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.bindir        = 'bin'
  
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency     'redis'
  spec.add_runtime_dependency     'hiredis'
  spec.add_runtime_dependency     'fakeredis'
end
