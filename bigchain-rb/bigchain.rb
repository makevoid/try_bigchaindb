require_relative 'env'

class Bigchain
  include Keys

  # assets

  def assets_new_admin
    py "assets_new_admin.py"
  end

  def assets_new
    py "assets_new_admin.py"
  end
  
end
