require_relative 'rethink/monkeypatches'

module Utils
  def mash(object)
    Hashie::Mash.new object
  end
end

class Rethink
  include RethinkDB::Shortcuts
  include Utils

  LIMIT = 100

  def initialize
    r.connect(host: "localhost", port: 28015).repl
  end

  def blocks
    r.blocks.limit(LIMIT).run
  end

  def blocks_last
    block = r.blocks.limit(1).run.first
    mash block
  end

end
