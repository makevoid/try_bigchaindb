# install: gem i roda oj rethinkdb
# require 'roda'
# require 'oj'
# require 'rethinkdb'
require 'bundler'
Bundler.require :default


require_relative 'lib/rethink'

Oj.default_options = { mode: :compat }

require_relative '../bigchain-rb/bigchain'
