class RethinkDB::RQL
  def blocks
    db('bigchain').table('bigchain').order_by(desc 'block_number')
  end
end
