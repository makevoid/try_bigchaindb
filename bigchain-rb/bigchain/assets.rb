module Bigchain::Assets
  def assets_new_admin
    resp = py "assets_new_admin.py"
    parse resp
  end

  def assets_new
    resp = py "assets_new.py"
    parse resp
  end
end
