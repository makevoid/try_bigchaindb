# install: gem i roda oj rethinkdb
require 'roda'
require 'oj'
require 'rethinkdb'

require_relative 'rethink'

Oj.default_options = { mode: :compat }
