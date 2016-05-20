require_relative 'env'

DB = Rethink.new
B  = Bigchain.new

class BigchainApi < Roda
  plugin :json
  plugin :not_found

  route do |r|
    r.root do
      r.redirect "/blocks/last"
    end

    r.on "blocks" do
      r.get do
        r.is do
          DB.blocks
        end

        r.on "last" do
          DB.blocks_last
        end
      end
    end

    r.on "keys" do
      r.post do
        B.keys_new
      end
    end

    r.on "assets" do
      r.get ":id" do
        # B.asset 1
        { id: 1 }
      end

      r.get do
        [{ id: 1 }]
        # B.assets
      end

      r.on "admin" do
        r.post do
          B.assets_new_admin
        end
      end

      r.post do
        B.assets_new
      end
    end

  end

  not_found do
    { error: :not_found, message: "404 - Route not present"}
  end
end
