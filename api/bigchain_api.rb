require_relative 'env'

DB = Rethink.new
B  = Bigchain.new

class BigchainApi < Roda
  plugin :json
  plugin :not_found

  route do |r|
    r.root do
      r.redirect "/hello"
    end

    r.get do
      r.on "blocks" do
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
      r.get do

      end

      r.get ":id" do

      end

      r.post do
        B.assets_new
      end

      r.on "admin" do
        r.post do
          B.assets_new_admin
        end
      end
    end


  end

  not_found do
    { error: :not_found, message: "404 - Route not present"}
  end
end
