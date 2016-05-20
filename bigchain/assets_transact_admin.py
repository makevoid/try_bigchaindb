from env import assets_transact_admin
import sys
import json

tx_id, data = sys.argv[1], sys.argv[2]
data = json.loads(data)
asset_tx = assets_transact_admin(tx_id, data)
asset_tx = json.dumps(asset_tx)

print(asset_tx)
