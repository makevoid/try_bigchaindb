require_relative 'env'

DB = Rethink.new

class BigchainApi < Roda
  plugin :json

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

    r.on "assets" do
      r.get do

      end

      r.get ":id" do

      end

      r.post do

      end
    end


  end
end
