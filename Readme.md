### Trying BigChainDB

Looking into BigChainDB to do some tests storing and retreiving arbitrary data to/from the rethinkdb-based blockchain, mainly following the tutorial (https://bigchaindb.readthedocs.io/en/latest/installing-server.html) + some custom attempts.


#### Quick Recap:

(considering you have rethinkdb and bichaindb installed already)

Run:

    rethinkdb


Run:

    bigchaindb start


You should be good to go, otherwise repeat this step: https://bigchaindb.readthedocs.io/en/latest/installing-server.html#how-to-install-bigchaindb-with-pip to update bigchaindb.


#### Start the tools:

This repo contains an API and a UI for you to play with bichaindb, a sandboxed playground, you may want to run multiple nodes on different hosts/ports to do a full-fledged test:

Run API:

    rackup -p 3001

Run UI:

(drop it on your favourite web server, or)

    python -m SimpleHTTPServer 3002

Visit <http://localhost:3002>

Enjoy!


#### Things to check:

Check RethinkDB admin UI to inspect the two BigChainDB tables, `backlog` and `bigchain`: <http://localhost:8080> - This is the main query you want to run onto the Data Explorer tool / tab: `r.db('bigchain').table('bigchain')`. It will return all the blockchain's blocks with all the contained transactions contained within them.

@makevoid
