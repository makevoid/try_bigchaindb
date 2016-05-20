from env import assets_new
import sys
import json

priv, pub = sys.argv[1], sys.argv[2]

asset_tx = assets_new(priv, pub)
asset_tx = json.dumps(asset_tx)

print(asset_tx)
