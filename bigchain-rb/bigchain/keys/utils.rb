module Bigchain::Keys::KeyUtils
  def parse_keys(keys)
    keys = keys.split
    Hashie::Mash.new pvt: keys[0], pub: keys[1]
  end
end
