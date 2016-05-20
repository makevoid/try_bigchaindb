from bigchaindb import crypto
from bigchaindb import Bigchain
import time

b = Bigchain()


# lib

def sign_and_write(tx, private_key):
  tx_signed = b.sign_transaction(tx, private_key)
  b.write_transaction(tx_signed)
  return tx_signed


# commands (CLI api)

def keys():
  return b.me_private, b.me

def keys_new():
  return crypto.generate_key_pair()

def assets_new(private_key, asset_owner_pub_key):
  asset_payload = {
    'type': 'asset',
    'id': 1,
    'amount': 1000,
    'date': '2016-01-01'
  }
  tx = b.create_transaction(asset_owner_pub_key, asset_owner_pub_key, None, 'CREATE', payload=asset_payload)
  # print("TX:", tx)
  tx_signed = sign_and_write(tx, private_key)
  # print("TX signed:", tx_signed)
  # time.sleep(6) # default settings
  time.sleep(0.2) # fast_confirmation fork - @makevoid's fork at github.com/makevoid/bigchaindb
  tx_retrieved = b.get_transaction(tx_signed['id'])
  return tx_retrieved

def assets_new_admin():
  priv, pub = keys()
  tx_retrieved = assets_new(priv, pub)
  return tx_retrieved

def assets_transact(tx_id, asset_payload, private_key, asset_owner_pub_key):
  tx_id = {
    'cid': 0,
    'txid': tx_id
  }
  tx = b.create_transaction(asset_owner_pub_key, asset_owner_pub_key, tx_id, 'TRANSFER', payload=asset_payload)
  tx_signed = sign_and_write(tx, private_key)
  time.sleep(0.2)
  tx_retrieved = b.get_transaction(tx_signed['id'])
  return tx_retrieved

def assets_transact_admin(tx_id, asset):
  priv, pub = keys()
  tx_retrieved = assets_transact(tx_id, asset, priv, pub)
  return tx_retrieved
