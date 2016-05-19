path = File.expand_path "../../", __FILE__
PATH = path
require_relative 'utils'
require 'hashie/mash'

class Bigchain
end

module Bigchain::Keys

  def keys
    return @keys if @keys
    keys = py "keys.py"
    keys = keys.split
    keys = Hashie::Mash.new pvt: keys[0], pub: keys[1] 
    @keys = keys
    keys
  end

  def key_pvt
    keys.pvt
  end

  def key_pub
    keys.pub
  end

end


class Bigchain
  include Utils

  include Keys

  def antani

  end

end
