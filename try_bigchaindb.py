import time
from bigchaindb import Bigchain

# env
#
b = Bigchain()


# lib
#
def sign_and_write(tx, private_key):
  tx_signed = b.sign_transaction(tx, private_key)
  b.write_transaction(tx_signed)
  return tx_signed

# setup
#
pvt_key, pub_key  = b.generate_keys()
pvt_key2, pub_key2 = b.generate_keys()

print("Public Key:", pub_key, "\n")


# init
#
#
# db initialization
# first transaction - asset creation - required, asset logic not used for our use-case: storing arbitrary data
print("DB init - first TX:")
asset_payload = {'msg': 'Arbitrary data asset'}
tx = b.create_transaction(b.me, pub_key, None, 'CREATE', payload=asset_payload)
tx_signed = sign_and_write(tx, b.me_private)
print("TX:", tx_signed, "\n")

time.sleep(8)
tx_retrieved = b.get_transaction(tx_signed['id'])
print("TX retrieved:", tx_retrieved, "\n")


# main
#
print("\n\nData TX:")
data = { "amount": 123, "date": "2016-01-01" } # <---- arbitrary data, can be encrypted with ecies, ownership based on transaction signer (public key)
tx2 = b.create_transaction(pub_key, pub_key, tx_retrieved['id'], 'TRANSFER', data)
tx_signed = sign_and_write(tx2, pvt_key)
print("TX:", tx_signed, "\n")

time.sleep(8)
tx_retrieved = b.get_transaction(tx_signed['id'])
print("TX retrieved:", tx_retrieved, "\n")


# http://localhost:8080/#dataexplorer
#
# all blocks:
# r.db('bigchain').table('bigchain')
#
# last block:
# r.db('bigchain').table('bigchain').orderBy(r.desc('block_number')).limit(1)
#
#
# will list everything
