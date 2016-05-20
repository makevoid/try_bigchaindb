from env import assets_new_admin
import json

asset_tx = assets_new_admin()
asset_tx = json.dumps(asset_tx)

print(asset_tx)
