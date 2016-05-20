require 'shellwords'

module Bigchain::Assets
  include Shellwords

  def assets_new_admin
    resp = py "assets_new_admin.py"
    parse resp
  end

  def assets_new
    resp = py "assets_new.py"
    parse resp
  end

  def assets_transact_admin(tx_id, data)
    # raise "assets_transact_admin.py #{tx_id} #{Shellwords.escape data}".inspect
    resp = py "assets_transact_admin.py #{tx_id} '#{data}'"
    # resp = py "assets_transact_admin.py #{tx_id} '#{Shellwords.escape data}'"
    parse resp
  end

  def assets_transact
    resp = py "assets_transact.py"
    parse resp
  end
end
