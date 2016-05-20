rethink: killall -9 rethinkdb ; rethinkdb
bigchain: sleep 2 && bigchaindb start
api: sleep 4 && cd api && rerun -s KILL -p "**/*.{rb}" -- rackup -p 3001
coffee: coffee -cw .
ui: killall python; cd ui && python -m SimpleHTTPServer 3002
haml: watch -p "**/*.haml" -c "haml --trace index.haml > index.html"
