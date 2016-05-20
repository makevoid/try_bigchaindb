module Utils

  BIGPY_PATH = "#{PATH}/bigchain"

  def exe(cmd)
    puts "executing: #{cmd}"
    `#{cmd}`
  end

  def py(pyfile)
    exe "python3 #{BIGPY_PATH}/#{pyfile}"
  end

  def parse(string)
    data = JSON.parse string
    Hashie::Mash.new data
  end

end
