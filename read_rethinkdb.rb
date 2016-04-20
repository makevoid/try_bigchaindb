require 'rethinkdb' # gem i rethinkdb
include RethinkDB::Shortcuts


# read latest block

r.connect(host: "localhost", port: 28015).repl

out = r.db('bigchain').table('bigchain').order_by(r.desc('block_number')).limit(1).run

pp out
