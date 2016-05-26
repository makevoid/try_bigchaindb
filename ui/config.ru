require 'bundler'
Bundler.require :default

class BigchainUI < Sinatra::Base
  get "/" do
    haml :index
  end
end

run BigchainUI
