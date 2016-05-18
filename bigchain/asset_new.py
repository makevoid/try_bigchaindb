from env import asset_new

priv, pub = sys.argv[0], sys.argv[1]

asset_tx = asset_new(priv, pub)

print(asset_tx)
