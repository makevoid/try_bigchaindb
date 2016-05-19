require_relative 'rethink/monkeypatches'

class Rethink
  include RethinkDB::Shortcuts

  LIMIT = 100

  def initialize
    r.connect(host: "localhost", port: 28015).repl
  end

  def blocks
    r.blocks.limit(LIMIT).run
  end

  def blocks_last
    r.blocks.limit(1).run
  end

end