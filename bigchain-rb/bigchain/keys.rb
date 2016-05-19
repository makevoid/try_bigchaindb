module Bigchain::Keys
end

require_relative 'keys/utils'

module Bigchain::Keys

  include KeyUtils

  # --- coinbase keys (node admin)

  def keys
    return @keys if @keys
    keys = py "keys.py"
    keys = parse_keys keys
    @keys = keys
  end

  def key_pvt
    keys.pvt
  end

  def key_pub
    keys.pub
  end

  # --- user keys

  def keys_new
    keys = py "keys_new.py"
    parse_keys keys
  end

end
