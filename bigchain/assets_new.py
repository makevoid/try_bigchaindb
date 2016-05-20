from env import assets_new
import sys
import json

priv, pub = sys.argv[0], sys.argv[1]

asset_tx = assets_new(priv, pub)
asset_tx = json.dumps(asset_tx)

print(asset_tx)
