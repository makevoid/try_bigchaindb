require 'sinatra'
require 'haml'

class BigchainUI < Sinatra::Base
  get "/" do
    haml :index
  end
end

run BigchainUI
