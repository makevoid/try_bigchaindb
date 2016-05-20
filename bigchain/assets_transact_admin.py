from env import assets_new_admin
import sys
import json

data = sys.argv[1]
data = json.loads data
asset_tx = assets_transact_admin(data)
asset_tx = json.dumps(asset_tx)

print(asset_tx)
