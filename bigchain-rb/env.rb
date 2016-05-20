path = File.expand_path "../../", __FILE__
PATH = path
require_relative 'utils'
require 'hashie/mash'


class Bigchain
  include Utils
end

require_relative 'bigchain/keys'
require_relative 'bigchain/assets'
