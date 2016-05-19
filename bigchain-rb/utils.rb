module Utils

  BIGPY_PATH = "#{PATH}/bigchain"

  def exe(cmd)
    `#{cmd}`
  end

  def py(pyfile)
    exe "python3 #{BIGPY_PATH}/#{pyfile}"
  end

end
